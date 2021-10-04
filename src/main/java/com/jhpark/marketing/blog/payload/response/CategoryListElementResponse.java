package com.jhpark.marketing.blog.payload.response;

import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

import javax.annotation.Nullable;
import javax.persistence.Entity;
import javax.persistence.Id;

@Setter
@Getter
public class CategoryListElementResponse {

  private String category;
  private long categoryCount;
  private String categoryImageUrl;

  @Builder
  public CategoryListElementResponse(String category, long categoryCount, String categoryImageUrl) {
    this.category = category;
    this.categoryCount = categoryCount;
    this.categoryImageUrl = categoryImageUrl;
  }

}
