package com.jhpark.marketing.blog.entity;

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
@Table(name = "tb_posting")
@NoArgsConstructor
@ToString
public class Posting {
  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  private long id;

  @Column(nullable = false)
  private long userId;

  @Column(nullable = false)
  private String category;

  @Column(nullable = false)
  private String title;

  @Column(nullable = false)
  private String thumbnailUrl;

  @Column(nullable = false)
  private char postingType;

  @CreationTimestamp
  private LocalDateTime createdDatetime;

  @UpdateTimestamp
  private LocalDateTime updateDatetime;

  @Builder
  public Posting(long id, long userId, String category, String title, String thumbnailUrl, char postingType, LocalDateTime createdDatetime, LocalDateTime updateDatetime) {
    this.id = id;
    this.userId = userId;
    this.category = category;
    this.title = title;
    this.thumbnailUrl = thumbnailUrl;
    this.postingType = postingType;
    this.createdDatetime = createdDatetime;
    this.updateDatetime = updateDatetime;
  }
}
