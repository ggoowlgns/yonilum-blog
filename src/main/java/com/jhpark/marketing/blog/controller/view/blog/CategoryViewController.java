package com.jhpark.marketing.blog.controller.view.blog;

import com.jhpark.marketing.blog.controller.view.BaseViewController;
import com.jhpark.marketing.blog.domain.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(path = "/category")
public class CategoryViewController extends BaseViewController {

  @RequestMapping(method = RequestMethod.GET)
  public String list(ModelMap modelMap, User user) {
    modelMap.put("user", user);
    return "category/blog-category-list";
  }
}
