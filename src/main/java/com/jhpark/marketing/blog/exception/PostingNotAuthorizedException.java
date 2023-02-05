package com.jhpark.marketing.blog.exception;

import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ResponseStatus;

@ResponseStatus(HttpStatus.UNAUTHORIZED)
public class PostingNotAuthorizedException extends RuntimeException{
  public PostingNotAuthorizedException(String message) {
    super(message);
  }

  public PostingNotAuthorizedException(String message, Throwable cause) {
    super(message, cause);
  }
}
