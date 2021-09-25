package com.jhpark.marketing.blog.entity;

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
@Table(name = "tb_posting_image")
@NoArgsConstructor
@ToString
public class PostingImage {
  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  private long id;

  @Column(nullable = false)
  private long postingId;

  @Column(nullable = false)
  private String imageUrl;

  @CreationTimestamp
  private LocalDateTime createdDatetime;

  @UpdateTimestamp
  private LocalDateTime updateDatetime;

  @Builder
  public PostingImage(long id, long postingId, String imageUrl, LocalDateTime createdDatetime, LocalDateTime updateDatetime) {
    this.id = id;
    this.postingId = postingId;
    this.imageUrl = imageUrl;
    this.createdDatetime = createdDatetime;
    this.updateDatetime = updateDatetime;
  }
}
