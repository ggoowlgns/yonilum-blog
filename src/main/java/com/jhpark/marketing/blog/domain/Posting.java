package com.jhpark.marketing.blog.domain;

import com.sun.istack.internal.NotNull;
import lombok.Data;

@Data
public class Posting {
  private @NotNull long postingSeq;
  private String title;
  private String content;

}
