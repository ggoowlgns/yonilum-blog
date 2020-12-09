package com.jhpark.marketing.blog.controller.rest;

import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class BaseRestController {

  @RequestMapping(path = "/api", method = RequestMethod.GET)
  public HttpStatus test() {
    return HttpStatus.OK;
  }
}
