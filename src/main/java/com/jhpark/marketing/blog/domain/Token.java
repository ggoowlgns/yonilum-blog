package com.jhpark.marketing.blog.domain;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.ToString;

/**
 * 토큰은 API서버에 접근하기 위한 인증 토큰과 인증 토큰이 만료되었을 경우 리프레쉬에 사용할 리프레쉬 토큰으로 이루어져 있습니다.
 */
@ToString
@NoArgsConstructor
@Getter
public class Token {
  private String token;
  private String refreshToken;

  public Token(String token, String refreshToken) {
    this.token = token;
    this.refreshToken = refreshToken;
  }
}