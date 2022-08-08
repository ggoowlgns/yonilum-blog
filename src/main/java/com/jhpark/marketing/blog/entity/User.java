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
import org.hibernate.type.descriptor.sql.TinyIntTypeDescriptor;

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

  private String introduction;

  @CreationTimestamp
  private LocalDateTime createdDatetime;

  @UpdateTimestamp
  private LocalDateTime updateDatetime;

  @Column(columnDefinition = "char(1) default 'U'")
  private Character authGrade;

  @Builder
  public User(Long userId, String name, String email, String imageUrl, Boolean emailVerified, String password, AuthProvider provider, String providerId, String introduction, LocalDateTime createdDatetime, LocalDateTime updateDatetime,Character authGrade) {
    this.userId = userId;
    this.name = name;
    this.email = email;
    this.imageUrl = imageUrl;
    this.emailVerified = emailVerified;
    this.password = password;
    this.provider = provider;
    this.providerId = providerId;
    this.introduction = introduction;
    this.createdDatetime = createdDatetime;
    this.updateDatetime = updateDatetime;
    this.authGrade = authGrade;
  }

  public User update(String name, String imageUrl) {
    this.name = name;
    this.imageUrl = imageUrl;
    return this;
  }

}
