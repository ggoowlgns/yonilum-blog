package com.jhpark.marketing.blog.payload.response;

import lombok.Getter;

@Getter
public class ImageUploadResponse {
  private String status;
  private String message;
  private String path;

  public ImageUploadResponse(String status, String message, String path) {
    this.status = status;
    this.message = message;
    this.path = path;
  }
}
