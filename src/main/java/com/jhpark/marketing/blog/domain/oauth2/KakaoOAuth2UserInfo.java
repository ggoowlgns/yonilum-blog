package com.jhpark.marketing.blog.domain.oauth2;

import lombok.ToString;

import java.util.LinkedHashMap;
import java.util.Map;

//TODO : Kakao 의 attribute 양식에 맞춰서 변경
@ToString
public class KakaoOAuth2UserInfo extends OAuth2UserInfo{
  private Map<String, Object> properties;
  private Map<String, Object> kakaoAccount;
  private Map<String, Object> kakaoProfile;

  public KakaoOAuth2UserInfo(Map<String, Object> attributes) {
    super(attributes);
    this.properties = (Map<String, Object>) attributes.get("properties");
    this.kakaoAccount = (Map<String, Object>) attributes.get("kakao_account");
    this.kakaoProfile = (Map<String, Object>) this.kakaoAccount.get("profile");
  }

  @Override
  public String getId() {
    return ((Integer) super.attributes.get("id")).toString();
  }

  @Override
  public String getName() {
    return kakaoProfile.get("nickname").toString();
  }

  @Override
  public String getEmail() {
    return (kakaoAccount.get("email")).toString();
  }

  @Override
  public String getImageUrl() {
    return (kakaoProfile.get("profile_image_url")).toString();
  }

  @Override
  public boolean getEmailVerified() {
    return (boolean) kakaoAccount.get("is_email_verified");
  }

}
