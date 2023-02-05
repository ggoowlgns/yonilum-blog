package com.jhpark.marketing.blog.payload.request;

import lombok.*;

import java.util.List;

@Getter
@Setter
@ToString
@AllArgsConstructor
public class PostingRequest {
  private long postingId;

  private long userId;
  private char postingType;
  private String thumbnailUrl;
  private String title;

  private List<String> categories;
  private List<String> images;
  private String content;
}
