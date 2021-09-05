package com.jhpark.marketing.blog.controller.view.blog;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(path = "/category")
public class CategoryViewController {

  @RequestMapping(method = RequestMethod.GET)
  public String list() {
    return "category/blog-category-list";
  }
}
