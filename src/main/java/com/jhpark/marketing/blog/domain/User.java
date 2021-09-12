package com.jhpark.marketing.blog.domain;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.sun.istack.NotNull;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.ToString;

import javax.persistence.*;

@Getter
@Entity
@Table(name = "tb_users", uniqueConstraints = {
    @UniqueConstraint(columnNames = "email")
})
@NoArgsConstructor
@ToString
public class User {
  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  private Long id;

  @Column(nullable = false)
  private String name;

  @Column(nullable = false)
  private String email;

  private String imageUrl;

  @Column(nullable = false)
  private Boolean emailVerified = false;

  @JsonIgnore
  private String password;

  @NotNull
  @Enumerated(EnumType.STRING)
  private AuthProvider provider;

  private String providerId;

  @Builder
  public User(Long id, String name, String email, String imageUrl, Boolean emailVerified, String password, AuthProvider provider, String providerId) {
    this.id = id;
    this.name = name;
    this.email = email;
    this.imageUrl = imageUrl;
    this.emailVerified = emailVerified;
    this.password = password;
    this.provider = provider;
    this.providerId = providerId;
  }

  public User update(String name, String imageUrl) {
    this.name = name;
    this.imageUrl = imageUrl;
    return this;
  }
}
