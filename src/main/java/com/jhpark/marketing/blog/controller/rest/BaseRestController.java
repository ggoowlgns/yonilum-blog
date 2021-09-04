package com.jhpark.marketing.blog.controller.rest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@RestController
@RequestMapping(path = "/api")
public class BaseRestController {
  Logger LOG = LoggerFactory.getLogger(BaseRestController.class);

  @RequestMapping(path = "/test", method = RequestMethod.GET, produces = "application/json")
  public String test(HttpServletRequest request, HttpServletResponse response,
                     @RequestParam("a") String a, @RequestParam("b") String b) {
    LOG.info("response body = request query string");
    return request.getQueryString();
  }
}
