package com.jhpark.marketing.blog.controller.rest.posting;

import com.jhpark.marketing.blog.domain.Posting;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletResponse;

@RestController
@RequestMapping(path = "/posting")
public class PostingRestController {
  Logger LOG = LoggerFactory.getLogger(PostingRestController.class);

  @RequestMapping(path = "/create", method = RequestMethod.POST)
  public String create(@RequestBody Posting posting,
                       HttpServletResponse response) {
    response.setHeader("Location", "/posting/123");
    LOG.info("posting : {}", posting);
    return "";
  }
}
