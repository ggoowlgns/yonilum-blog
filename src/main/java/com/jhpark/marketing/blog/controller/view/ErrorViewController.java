package com.jhpark.marketing.blog.controller.view;

import com.jhpark.marketing.blog.controller.BaseViewController;
import com.jhpark.marketing.blog.entity.User;
import org.springframework.boot.web.servlet.error.ErrorController;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(path = "/error")
public class ErrorViewController extends BaseViewController implements ErrorController {

  @RequestMapping(method = RequestMethod.GET, produces = "application/xhtml+xml")
  public String error(ModelMap modelMap, User user) {
    modelMap.put("user", user);
    return "error_404";
  }

  public String getErrorPath() {
    return null;
  }
}
