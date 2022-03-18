package com.jhpark.marketing.blog.payload.response;

import lombok.Builder;
import lombok.Data;

@Data
public class CategoryWithUrlElement {
  public String category;
  public String categoryImageUrl;

  @Builder
  public CategoryWithUrlElement(String category, String categoryImageUrl) {
    this.category = category;
    this.categoryImageUrl = categoryImageUrl;
  }
}
