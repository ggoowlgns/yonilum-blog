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
import java.util.ArrayList;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Set;

@Getter
@Entity
@Table(name = "tb_posting")
@NoArgsConstructor
@ToString
@Builder
public class Posting {
  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  private long postingId;

  /**
   * FK 로 entity 땡겨오는 상황 - N:1
   * 등록한 column 명은 땡겨오는 대상 entity의 PK 즉, tb_user 의 user_id 속성 그대로 가져와서
   * tb_posting 의 column으로 박아넣음
   */
  @ManyToOne(targetEntity = User.class, fetch = FetchType.EAGER, optional = false)
  @JoinColumn(name = "user_id", nullable = false)
  private User user;

  @Column(nullable = false)
  private String category;

  @Column(nullable = false)
  private String title;

  @Column(nullable = false)
  private String thumbnailUrl;


  /**
   * PK로 entity 떙겨오는 상황
   * mappedBy로 들어가는 값은 땡겨오는 entity의 FK
   */
  @OneToMany(mappedBy = "postingId", fetch = FetchType.LAZY)
  private Set<PostingImage> postingImages = new LinkedHashSet<>();

  @OneToMany(mappedBy = "postingId", fetch = FetchType.LAZY)
  private Set<PostingContentParagraph> postingContentParagraphs = new LinkedHashSet<>();

  @OneToMany(mappedBy = "postingId", fetch = FetchType.LAZY)
  private Set<PostingComment> postingComments = new LinkedHashSet<>();

  @Column(nullable = false)
  private char postingType;

  @CreationTimestamp
  private LocalDateTime createdDatetime;

  @UpdateTimestamp
  private LocalDateTime updateDatetime;

  @Builder
  public Posting(long postingId, User user, String category, String title, String thumbnailUrl, Set<PostingImage> postingImages, Set<PostingContentParagraph> postingContentParagraphs, Set<PostingComment> postingComments, char postingType, LocalDateTime createdDatetime, LocalDateTime updateDatetime) {
    this.postingId = postingId;
    this.user = user;
    this.category = category;
    this.title = title;
    this.thumbnailUrl = thumbnailUrl;
    this.postingImages = postingImages;
    this.postingContentParagraphs = postingContentParagraphs;
    this.postingComments = postingComments;
    this.postingType = postingType;
    this.createdDatetime = createdDatetime;
    this.updateDatetime = updateDatetime;
  }
}
