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
@Table(name = "tb_posting_content"/*,
    uniqueConstraints = {
        @UniqueConstraint(columnNames = {"posting_id", "paragraph_index"}), // 복합키
    }*/
)
@NoArgsConstructor
@ToString
@Builder
public class PostingContent {
  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  private long PostingContentId;


  @ManyToOne(targetEntity = Posting.class, fetch = FetchType.LAZY)
  @JoinColumn(name = "posting_id", nullable = false)
  @JsonBackReference
  private Posting postingId;


  private String content;

  @CreationTimestamp
  private LocalDateTime createdDatetime;

  @UpdateTimestamp
  private LocalDateTime updateDatetime;

  @Builder
  public PostingContent(long PostingContentId, Posting postingId, String content, LocalDateTime createdDatetime, LocalDateTime updateDatetime) {
    this.PostingContentId = PostingContentId;
    this.postingId = postingId;
    this.content = content;
    this.createdDatetime = createdDatetime;
    this.updateDatetime = updateDatetime;
  }
}
