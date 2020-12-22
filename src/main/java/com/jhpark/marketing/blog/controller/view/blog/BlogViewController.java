package com.jhpark.marketing.blog.controller.view.blog;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(path = "/blog")
public class BlogViewController {

  @RequestMapping
  public String home() {
    return "blog";
  }

  @RequestMapping(path = "/detail")
  public String detail() {
    return "blog-detail";
  }

}
