package com.jhpark.marketing.blog.controller.view.blog;

import com.jhpark.marketing.blog.controller.view.BaseViewController;
import com.jhpark.marketing.blog.entity.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(path = "/blog")
public class BlogViewController extends BaseViewController {

  @RequestMapping
  public String home(ModelMap modelMap, User user) {
    modelMap.put("user", user);
    return "blog";
  }

  @RequestMapping(path = "/detail")
  public String detail(ModelMap modelMap, User user) {
    modelMap.put("user", user);
    return "blog-detail";
  }

}
