package com.jhpark.marketing.blog.controller.view.posting;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(path = "/posting")
public class PostingViewController {
  Logger LOG = LoggerFactory.getLogger(PostingViewController.class);

  @RequestMapping(path = "/{postingNum}", method = RequestMethod.GET)
  public String posting(@PathVariable("postingNum")String postingNum) {
    LOG.info("posting num : {}", postingNum);
    return "posting/post_gallery";
  }
}