package com.jhpark.marketing.blog.service;

import lombok.*;
import lombok.extern.slf4j.Slf4j;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.oauth2.client.userinfo.DefaultOAuth2UserService;
import org.springframework.security.oauth2.client.userinfo.OAuth2UserRequest;
import org.springframework.security.oauth2.client.userinfo.OAuth2UserService;
import org.springframework.security.oauth2.core.OAuth2AuthenticationException;
import org.springframework.security.oauth2.core.user.DefaultOAuth2User;
import org.springframework.security.oauth2.core.user.OAuth2User;
import org.springframework.stereotype.Service;

import java.util.Collections;
import java.util.HashMap;
import java.util.Map;

/**
 * OAuth2UserService 인터페이스를 구현
 * OAuth2 인증 후 보내주는 데이터가 각 인증 서버마다 다르기 때문에 이곳에서 별도의 분기 처리를 해줘야 합니다.
 */
@Slf4j
@Service
public class CustomOAuth2UserService implements OAuth2UserService<OAuth2UserRequest, OAuth2User> {
  Logger LOG = LoggerFactory.getLogger(CustomOAuth2UserService.class);
  @Override
  public OAuth2User loadUser(OAuth2UserRequest userRequest) throws OAuth2AuthenticationException {
    OAuth2UserService<OAuth2UserRequest, OAuth2User> oAuth2UserService = new DefaultOAuth2UserService();
    OAuth2User oAuth2User = oAuth2UserService.loadUser(userRequest);

    String registrationId = userRequest.getClientRegistration().getRegistrationId();
    String userNameAttributeName = userRequest.getClientRegistration()
        .getProviderDetails().getUserInfoEndpoint().getUserNameAttributeName();

    OAuth2Attribute oAuth2Attribute =
        OAuth2Attribute.of(registrationId, userNameAttributeName, oAuth2User.getAttributes());

    LOG.info("oAuth2Attribute : {}", oAuth2Attribute);

    var memberAttribute = oAuth2Attribute.convertToMap();

    return new DefaultOAuth2User(
        Collections.singleton(new SimpleGrantedAuthority("ROLE_USER")),
        memberAttribute, "email");
  }
}


/**
 * 각 Vender 마다 method 분기
 * argumetns : attributes (properties 에 등록한 scope)
 * return : OAuth2Attribute
 */
@ToString
@Builder(access = AccessLevel.PRIVATE)
@Getter
class OAuth2Attribute {
  private Map<String, Object> attributes;
  private String attributeKey;
  private String email;
  private String name;
  private String picture;

  static OAuth2Attribute of(String provider, String attributeKey,
                            Map<String, Object> attributes) {
    switch (provider) {
      case "google":
        return ofGoogle(attributeKey, attributes);
      case "kakao":
        return ofKakao("email", attributes);
      case "naver":
        return ofNaver("id", attributes);
      default:
        throw new RuntimeException();
    }
  }

  private static OAuth2Attribute ofGoogle(String attributeKey,
                                          Map<String, Object> attributes) {
    return OAuth2Attribute.builder()
        .name((String) attributes.get("name"))
        .email((String) attributes.get("email"))
        .picture((String)attributes.get("picture"))
        .attributes(attributes)
        .attributeKey(attributeKey)
        .build();
  }

  private static OAuth2Attribute ofKakao(String attributeKey,
                                         Map<String, Object> attributes) {
    Map<String, Object> kakaoAccount = (Map<String, Object>) attributes.get("kakao_account");
    Map<String, Object> kakaoProfile = (Map<String, Object>) kakaoAccount.get("profile");

    return OAuth2Attribute.builder()
        .name((String) kakaoProfile.get("nickname"))
        .email((String) kakaoAccount.get("email"))
        .picture((String)kakaoProfile.get("profile_image_url")) // 없는데?
        .attributes(kakaoAccount)
        .attributeKey(attributeKey)
        .build();
  }

  private static OAuth2Attribute ofNaver(String attributeKey,
                                         Map<String, Object> attributes) {
    Map<String, Object> response = (Map<String, Object>) attributes.get("response");

    return OAuth2Attribute.builder()
        .name((String) response.get("name"))
        .email((String) response.get("email"))
        .picture((String) response.get("profile_image"))
        .attributes(response)
        .attributeKey(attributeKey)
        .build();
  }

  Map<String, Object> convertToMap() {
    Map<String, Object> map = new HashMap<>();
    map.put("id", attributeKey);
    map.put("key", attributeKey);
    map.put("name", name);
    map.put("email", email);
    map.put("picture", picture);

    return map;
  }
}