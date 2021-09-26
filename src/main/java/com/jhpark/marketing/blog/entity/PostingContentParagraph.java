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
@Table(name = "tb_posting_paragraph",
    uniqueConstraints = {
        @UniqueConstraint(columnNames = {"posting_id", "paragraph_index"}),
//        @UniqueConstraint(columnNames = {"posting_id", "paragraph_index"})
    }
    )
@NoArgsConstructor
@ToString
@Builder
public class PostingContentParagraph {
  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  private long PostingContentParagraphId;


  @ManyToOne(targetEntity = Posting.class, fetch = FetchType.LAZY)
  @JoinColumn(name = "posting_id", nullable = false)
  @JsonBackReference
  private Posting postingId;

  @Column(name = "paragraph_index",nullable = false)
  private int paragraphIndex;

  private String content;

  @CreationTimestamp
  private LocalDateTime createdDatetime;

  @UpdateTimestamp
  private LocalDateTime updateDatetime;

  @Builder

  public PostingContentParagraph(long PostingContentParagraphId, Posting postingId, int paragraphIndex, String content, LocalDateTime createdDatetime, LocalDateTime updateDatetime) {
    this.PostingContentParagraphId = PostingContentParagraphId;
    this.postingId = postingId;
    this.paragraphIndex = paragraphIndex;
    this.content = content;
    this.createdDatetime = createdDatetime;
    this.updateDatetime = updateDatetime;
  }
}
