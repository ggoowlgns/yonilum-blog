package com.jhpark.marketing.blog.payload.response;

import lombok.Getter;

@Getter
public class ApiResponse {
  private boolean success;
  private String message;

  public ApiResponse(boolean success, String message) {
    this.success = success;
    this.message = message;
  }

  public boolean isSuccess() {
    return success;
  }
}
