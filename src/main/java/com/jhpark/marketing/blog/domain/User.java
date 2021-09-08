package com.jhpark.marketing.blog.domain;

import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@Getter
public class User {
  private String email;
  private String name;
  private String picture;

  @Builder
  public User(String email, String name, String picture) {
    this.email = email;
    this.name = name;
    this.picture = picture;
  }
}
