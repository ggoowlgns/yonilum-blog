package com.jhpark.marketing.blog.component;

import com.jhpark.marketing.blog.domain.User;
import lombok.var;
import org.springframework.security.oauth2.core.user.OAuth2User;
import org.springframework.stereotype.Component;

@Component
public class UserRequestMapper {
  public User oAuthUsertoUser(OAuth2User oAuth2User) {
    var attributes = oAuth2User.getAttributes();
    return User.builder()
        .email((String)attributes.get("email"))
        .name((String)attributes.get("name"))
        .picture((String)attributes.get("picture"))
        .build();
  }

//  public UserFindRequest toFindDto(User userDto) {
//    return new UserFindRequest(userDto.getEmail());
//  }
}
