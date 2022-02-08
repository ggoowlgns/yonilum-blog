package com.jhpark.marketing.blog.entity;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonIdentityInfo;
import com.fasterxml.jackson.annotation.JsonManagedReference;
import com.fasterxml.jackson.annotation.ObjectIdGenerators;
import lombok.*;
import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;

import javax.persistence.*;
import java.time.LocalDateTime;

@Getter
@Setter
@Entity
@Table(name = "tb_category")
@NoArgsConstructor
@ToString
@Builder
@JsonIdentityInfo(generator = ObjectIdGenerators.IntSequenceGenerator.class)
public class Category {
  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  private long categoryId;

  @ManyToOne(targetEntity = Posting.class, fetch = FetchType.EAGER, optional = false)
  @JoinColumn(name = "posting_id", nullable = false)
  private Posting postingId;

  private int categoryIndex;

  private String category;

  @CreationTimestamp
  private LocalDateTime createdDatetime;

  @UpdateTimestamp
  private LocalDateTime updateDatetime;

  @Builder
  public Category(long categoryId, Posting postingId, int categoryIndex, String category, LocalDateTime createdDatetime, LocalDateTime updateDatetime) {
    this.categoryId = categoryId;
    this.postingId = postingId;
    this.categoryIndex = categoryIndex;
    this.category = category;
    this.createdDatetime = createdDatetime;
    this.updateDatetime = updateDatetime;
  }
}
