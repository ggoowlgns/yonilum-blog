package com.jhpark.marketing.blog.entity;

import lombok.Builder;
import lombok.Getter;
import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;

import javax.persistence.*;
import java.time.LocalDateTime;

@Getter
@Entity
@Table(name = "tb_posting_comment",
    uniqueConstraints = {
        @UniqueConstraint(columnNames = {"posting_id", "comment_index"}),
    })
public class PostingComment {
  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  private long id;

  @Column(nullable = false)
  private long postingId;

  @Column(nullable = false)
  private int commentIndex;

  @Column(nullable = false)
  private long userId;

  private String content;

  @CreationTimestamp
  private LocalDateTime createdDatetime;

  @UpdateTimestamp
  private LocalDateTime updateDatetime;

  @Builder
  public PostingComment(long id, long postingId, int commentIndex, long userId, String content, LocalDateTime createdDatetime, LocalDateTime updateDatetime) {
    this.id = id;
    this.postingId = postingId;
    this.commentIndex = commentIndex;
    this.userId = userId;
    this.content = content;
    this.createdDatetime = createdDatetime;
    this.updateDatetime = updateDatetime;
  }
}
