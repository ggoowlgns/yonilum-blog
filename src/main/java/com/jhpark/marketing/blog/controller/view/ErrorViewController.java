package com.jhpark.marketing.blog.controller.view;

import org.springframework.boot.web.servlet.error.ErrorController;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(path = "/error")
public class ErrorViewController implements ErrorController {

  @RequestMapping(method = RequestMethod.GET)
  public String error() {
    return "error_404";
  }

  @Override
  public String getErrorPath() {
    return null;
  }
}
