package com.jhpark.marketing.blog.domain.oauth2;

import java.util.LinkedHashMap;
import java.util.Map;

//TODO : Kakao 의 attribute 양식에 맞춰서 변경
public class KakaoOAuth2UserInfo extends OAuth2UserInfo{
  private Map<String, Object> properties;
  private Map<String, Object> kakaoAccount;

  public KakaoOAuth2UserInfo(Map<String, Object> attributes) {
    super(attributes);
    this.properties = (Map<String, Object>) attributes.get("properties");
    this.kakaoAccount = (Map<String, Object>) attributes.get("kakao_account");
  }

  @Override
  public String getId() {
    return ((Integer) attributes.get("id")).toString();
  }

  @Override
  public String getName() {
    return properties.get("nickname").toString();
  }

  @Override
  public String getEmail() {
    return (kakaoAccount.get("email")).toString();
  }

  @Override
  public String getImageUrl() {
    return (properties.get("profile_image")).toString();
  }

  @Override
  public boolean getEmailVerified() {
    return (boolean) kakaoAccount.get("is_email_verified");
  }

}
