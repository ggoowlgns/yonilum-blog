package com.jhpark.marketing.blog.controller.view;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class HomeViewController {


  @RequestMapping(path = "/", method = RequestMethod.GET)
  public String home() {
    return "index";
  }

//  @RequestMapping(value = "/{file}.ftl")
//  public String forwardRequests(@PathVariable String file) {
//    return file;
//  }

  @RequestMapping(value = "/about", method = RequestMethod.GET)
  public String about() {
    return "about";
  }

}
