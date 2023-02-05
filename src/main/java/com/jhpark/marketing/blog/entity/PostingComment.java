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
@Table(name = "tb_posting_comment",
    uniqueConstraints = {
        @UniqueConstraint(columnNames = {"posting_id", "comment_index"}),
    }
)
@NoArgsConstructor
@ToString
@Builder
public class PostingComment {
  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  private long postingCommentId;

  @ManyToOne(targetEntity = Posting.class, fetch = FetchType.LAZY)
  @JoinColumn(name = "posting_id", nullable = false)
  @JsonBackReference
  private Posting postingId;

  @Column(name = "comment_index",nullable = false)
  private int commentIndex;

  @ManyToOne(targetEntity = User.class, fetch = FetchType.LAZY, optional = false)
  @JoinColumn(name = "user_id", nullable = false)
  private User user;

  private String content;

  @CreationTimestamp
  private LocalDateTime createdDatetime;

  @UpdateTimestamp
  private LocalDateTime updateDatetime;

  @Builder
  public PostingComment(long postingCommentId, Posting postingId, int commentIndex, User user, String content, LocalDateTime createdDatetime, LocalDateTime updateDatetime) {
    this.postingCommentId = postingCommentId;
    this.postingId = postingId;
    this.commentIndex = commentIndex;
    this.user = user;
    this.content = content;
    this.createdDatetime = createdDatetime;
    this.updateDatetime = updateDatetime;
  }
}
