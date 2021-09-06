package com.jhpark.marketing.blog.domain;

import lombok.Data;

@Data
public class Posting {
  private long postingSeq;
  private String title;
  private String content;

}
