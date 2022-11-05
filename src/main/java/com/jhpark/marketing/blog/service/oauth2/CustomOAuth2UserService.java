package com.jhpark.marketing.blog.service.oauth2;

import com.jhpark.marketing.blog.domain.AuthProvider;
import com.jhpark.marketing.blog.entity.User;
import com.jhpark.marketing.blog.exception.BuildDataFailException;
import com.jhpark.marketing.blog.exception.OAuth2AuthenticationProcessingException;
import com.jhpark.marketing.blog.repository.user.UserRepository;
import com.jhpark.marketing.blog.security.UserPrincipal;
import com.jhpark.marketing.blog.domain.oauth2.OAuth2UserInfo;
import com.jhpark.marketing.blog.domain.oauth2.OAuth2UserInfoFactory;
import lombok.extern.slf4j.Slf4j;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.InternalAuthenticationServiceException;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.oauth2.client.userinfo.DefaultOAuth2UserService;
import org.springframework.security.oauth2.client.userinfo.OAuth2UserRequest;
import org.springframework.security.oauth2.core.OAuth2AuthenticationException;
import org.springframework.security.oauth2.core.user.OAuth2User;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import java.util.Optional;

@Slf4j
@Service
public class CustomOAuth2UserService extends DefaultOAuth2UserService {

  @Autowired
  private UserRepository userRepository;

  @Override
  public OAuth2User loadUser(OAuth2UserRequest oAuth2UserRequest) throws OAuth2AuthenticationException {
    OAuth2User oAuth2User = super.loadUser(oAuth2UserRequest);

    try {
      return processOAuth2User(oAuth2UserRequest, oAuth2User);
    } catch (AuthenticationException ex) {
      throw ex;
    } catch (Exception ex) {
      log.error("loadUser() : ",ex);
      // Throwing an instance of AuthenticationException will trigger the OAuth2AuthenticationFailureHandler
      throw new InternalAuthenticationServiceException(ex.getMessage(), ex.getCause());
    }
  }

  /**
   * 사용자 정보 추출
   * @param oAuth2UserRequest
   * @param oAuth2User
   * @return
   */
  private OAuth2User processOAuth2User(OAuth2UserRequest oAuth2UserRequest, OAuth2User oAuth2User) throws Exception{
    OAuth2UserInfo oAuth2UserInfo = OAuth2UserInfoFactory.getOAuth2UserInfo(oAuth2UserRequest.getClientRegistration().getRegistrationId(), oAuth2User.getAttributes());
    if(StringUtils.isEmpty(oAuth2UserInfo.getEmail())) {
      throw new OAuth2AuthenticationProcessingException("Email not found from OAuth2 provider");
    }

    Optional<User> userOptional = userRepository.findByEmail(oAuth2UserInfo.getEmail());
    User user;
    if(userOptional.isPresent()) {
      user = userOptional.get();
      if(!user.getProvider().equals(AuthProvider.valueOf(oAuth2UserRequest.getClientRegistration().getRegistrationId()))) {
        throw new OAuth2AuthenticationProcessingException("Looks like you're signed up with " +
            user.getProvider() + " account. Please use your " + user.getProvider() +
            " account to login.");
      }
      user = updateExistingUser(user, oAuth2UserInfo);
    } else {
      user = registerNewUser(oAuth2UserRequest, oAuth2UserInfo);
    }

    return UserPrincipal.create(user, oAuth2User.getAttributes());
  }

  /**
   * DB에 존재하지 않는 경우 새로 등록
   * @param oAuth2UserRequest
   * @param oAuth2UserInfo
   * @return
   */
  private User registerNewUser(OAuth2UserRequest oAuth2UserRequest, OAuth2UserInfo oAuth2UserInfo) {
    User user;
    try {
      user = User.builder()
          .name(oAuth2UserInfo.getName())
          .email(oAuth2UserInfo.getEmail())
          .emailVerified(oAuth2UserInfo.getEmailVerified())
          .imageUrl(oAuth2UserInfo.getImageUrl())
          .provider(AuthProvider.valueOf(oAuth2UserRequest.getClientRegistration().getRegistrationId()))
          .providerId(oAuth2UserInfo.getId())
          .build();
    } catch (Exception e) {
      log.error("");
      throw new BuildDataFailException("registerNewUser() oAuth2UserInfo : "+ oAuth2UserInfo);
    }

    return userRepository.save(user);
  }

  /**
   * DB에 존재할 경우 정보 업데이트
   * @param existingUser
   * @param oAuth2UserInfo
   * @return
   */
  private User updateExistingUser(User existingUser, OAuth2UserInfo oAuth2UserInfo) {
    return userRepository.save(existingUser.update(
        oAuth2UserInfo.getName(),
        oAuth2UserInfo.getImageUrl()
    ));
  }

}
