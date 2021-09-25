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
@Table(name = "tb_posting_paragraph",
    uniqueConstraints = {
        @UniqueConstraint(columnNames = {"posting_id", "paragraph_index"}),
//        @UniqueConstraint(columnNames = {"posting_id", "paragraph_index"})
    }
    )
@NoArgsConstructor
@ToString
public class PostingContentParagraph {
  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  private long id;

  @Column(name = "posting_id",nullable = false)
  private long postingId;

  @Column(name = "paragraph_index",nullable = false)
  private int paragraphIndex;

  private String content;

  @CreationTimestamp
  private LocalDateTime createdDatetime;

  @UpdateTimestamp
  private LocalDateTime updateDatetime;

  @Builder
  public PostingContentParagraph(long id, long postingId, int paragraphIndex, String content) {
    this.id = id;
    this.postingId = postingId;
    this.paragraphIndex = paragraphIndex;
    this.content = content;
  }
}
