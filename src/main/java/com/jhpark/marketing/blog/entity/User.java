package com.jhpark.marketing.blog.entity;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.jhpark.marketing.blog.domain.AuthProvider;
import com.sun.istack.NotNull;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.ToString;
import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;

import javax.persistence.*;
import java.time.LocalDateTime;

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
  @JoinColumn(name = "user_id")
  private Long userId;

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

  @CreationTimestamp
  private LocalDateTime createdDatetime;

  @UpdateTimestamp
  private LocalDateTime updateDatetime;

  @Builder
  public User(Long userId, String name, String email, String imageUrl, Boolean emailVerified, String password, AuthProvider provider, String providerId, LocalDateTime createdDatetime, LocalDateTime updateDatetime) {
    this.userId = userId;
    this.name = name;
    this.email = email;
    this.imageUrl = imageUrl;
    this.emailVerified = emailVerified;
    this.password = password;
    this.provider = provider;
    this.providerId = providerId;
    this.createdDatetime = createdDatetime;
    this.updateDatetime = updateDatetime;
  }

  public User update(String name, String imageUrl) {
    this.name = name;
    this.imageUrl = imageUrl;
    return this;
  }
}
