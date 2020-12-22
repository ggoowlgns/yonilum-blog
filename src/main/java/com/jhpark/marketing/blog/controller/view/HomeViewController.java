package com.jhpark.marketing.blog.controller.view;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class HomeViewController {


  @RequestMapping(path = "/", method = RequestMethod.GET)
  public String home() {
    return "index";
  }
}
