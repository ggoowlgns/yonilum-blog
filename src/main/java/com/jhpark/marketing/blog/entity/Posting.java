package com.jhpark.marketing.blog.entity;

import com.fasterxml.jackson.annotation.JsonIdentityInfo;
import com.fasterxml.jackson.annotation.ObjectIdGenerators;
import lombok.*;
import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;

import javax.persistence.*;
import java.time.LocalDateTime;
import java.util.LinkedHashSet;
import java.util.Set;

@Getter
@Setter
@Entity
@Table(name = "tb_posting")
@NoArgsConstructor
@ToString
@Builder
@JsonIdentityInfo(generator = ObjectIdGenerators.IntSequenceGenerator.class)
public class Posting {
  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  private long postingId;

  /**
   * FK 로 entity 땡겨오는 상황 - N:1 (this 를 가지고 있는 애)
   * 등록한 column 명은 땡겨오는 대상 entity의 PK 즉, tb_user 의 user_id 속성 그대로 가져와서
   * tb_posting 의 column으로 박아넣음
   */
  @ManyToOne(targetEntity = User.class, fetch = FetchType.EAGER, optional = false)
  @JoinColumn(name = "user_id", nullable = false)
  private User user;

  @Column(nullable = false)
  private String title;

  @Column(nullable = false)
  private String thumbnailUrl;


  /**
   * PK로 entity 떙겨오는 상황 : 1:N (this 가 가지고 있는 애들)
   * mappedBy로 들어가는 값은 땡겨오는 entity의 FK
   */
  @OneToMany(mappedBy = "postingId", fetch = FetchType.LAZY)
  private Set<PostingImage> postingImages = new LinkedHashSet<>();

  @OneToMany(mappedBy = "postingId", fetch = FetchType.LAZY)
  private Set<PostingContent> postingContents = new LinkedHashSet<>();

  @OneToMany(mappedBy = "postingId", fetch = FetchType.LAZY)
  private Set<PostingComment> postingComments = new LinkedHashSet<>();

  @OneToMany(mappedBy = "postingId", fetch = FetchType.LAZY)
  private Set<Category> postingCategories = new LinkedHashSet<>();

  @Column(nullable = false)
  private char postingType;

  @Column(nullable = false)
  private int views;

  @CreationTimestamp
  private LocalDateTime createdDatetime;

  @UpdateTimestamp
  private LocalDateTime updateDatetime;

  @Builder
  public Posting(long postingId, User user, String title, String thumbnailUrl, Set<PostingImage> postingImages, Set<PostingContent> postingContents, Set<PostingComment> postingComments, Set<Category> postingCategories, char postingType, int views, LocalDateTime createdDatetime, LocalDateTime updateDatetime) {
    this.postingId = postingId;
    this.user = user;
    this.title = title;
    this.thumbnailUrl = thumbnailUrl;
    this.postingImages = postingImages;
    this.postingContents = postingContents;
    this.postingComments = postingComments;
    this.postingCategories = postingCategories;
    this.postingType = postingType;
    this.views = views;
    this.createdDatetime = createdDatetime;
    this.updateDatetime = updateDatetime;
  }
}
