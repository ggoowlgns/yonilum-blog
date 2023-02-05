package com.jhpark.marketing.blog.entity;

import com.fasterxml.jackson.annotation.JsonBackReference;
import lombok.*;
import org.checkerframework.common.aliasing.qual.Unique;
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
@Setter
@Builder
public class PostingContent {
  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  private long PostingContentId;


  @ManyToOne(targetEntity = Posting.class, fetch = FetchType.LAZY)
  @JoinColumn(name = "posting_id", nullable = false, unique = true)
  @JsonBackReference
  private Posting postingId;


  @Lob // FOR LONG TEXT
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
