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

  public String category;
  public long categoryCount;
  public String categoryImageUrl;

  @Builder
  public CategoryListElementResponse(String category, long categoryCount, String categoryImageUrl) {
    this.category = category;
    this.categoryCount = categoryCount;
    this.categoryImageUrl = categoryImageUrl;
  }

}
