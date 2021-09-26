package com.jhpark.marketing.blog.entity;

import com.fasterxml.jackson.annotation.JsonBackReference;
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
@Builder
public class PostingImage {
  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  private long postingImageId;

  @ManyToOne(targetEntity = Posting.class, fetch = FetchType.LAZY)
  @JoinColumn(name = "posting_id", nullable = false)
  @JsonBackReference
  private Posting postingId;

  @Column(nullable = false)
  private String imageUrl;

  @CreationTimestamp
  private LocalDateTime createdDatetime;

  @UpdateTimestamp
  private LocalDateTime updateDatetime;

  @Builder
  public PostingImage(long postingImageId, Posting postingId, String imageUrl, LocalDateTime createdDatetime, LocalDateTime updateDatetime) {
    this.postingImageId = postingImageId;
    this.postingId = postingId;
    this.imageUrl = imageUrl;
    this.createdDatetime = createdDatetime;
    this.updateDatetime = updateDatetime;
  }
}
