package com.jhpark.marketing.blog.payload.request;

import lombok.Getter;
import lombok.ToString;

import java.util.List;

@Getter
@ToString
public class PostingRequest {
  private long userId;
  private char postingType;
  private String thumbnailUrl;
  private String title;

  private List<String> categories;
  private List<String> images;
  private List<String> paragraphs;

  public PostingRequest(long userId, char postingType, String thumbnailUrl, String title, List<String> categories, List<String> images, List<String> paragraphs) {
    this.userId = userId;
    this.postingType = postingType;
    this.thumbnailUrl = thumbnailUrl;
    this.title = title;
    this.categories = categories;
    this.images = images;
    this.paragraphs = paragraphs;
  }
}
