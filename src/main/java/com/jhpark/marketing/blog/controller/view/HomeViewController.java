package com.jhpark.marketing.blog.controller.view;

import com.jhpark.marketing.blog.controller.BaseController;
import com.jhpark.marketing.blog.entity.User;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class HomeViewController extends BaseController {
  private final Logger LOG = LoggerFactory.getLogger(HomeViewController.class);

  @RequestMapping(path = "/", method = RequestMethod.GET)
  public String home(ModelMap modelMap, User user) {
    LOG.info("User : {}", user);
    modelMap.put("user", user);
    return "index";
  }

//  @RequestMapping(value = "/{file}.ftl")
//  public String forwardRequests(@PathVariable String file) {
//    return file;
//  }

  @RequestMapping(value = "/about", method = RequestMethod.GET)
  public String about(ModelMap modelMap, User user) {
    modelMap.put("user", user);
    return "about";
  }



}
