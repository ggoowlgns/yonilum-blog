package com.jhpark.marketing.blog.controller.view.blog;

import com.jhpark.marketing.blog.controller.BaseController;
import com.jhpark.marketing.blog.entity.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(path = "/category")
public class CategoryViewController extends BaseController {

  @RequestMapping(path = "/{categoryName}",method = RequestMethod.GET)
  public String list(@PathVariable("categoryName") String categoryName,
                     ModelMap modelMap, User user) {
    modelMap.put("user", user);
    modelMap.put("categoryName", categoryName);
    return "category/blog-category-list";
  }
}
