package com.jhpark.marketing.blog.payload.response;

import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

@Getter
public class AuthResponse {
  private String accessToken;
  private String tokenType = "Bearer";

  @Builder
  public AuthResponse(String accessToken) {
    this.accessToken = accessToken;
  }
}
