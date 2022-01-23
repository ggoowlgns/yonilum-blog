package com.jhpark.marketing.blog.controller.view.category;

import com.jhpark.marketing.blog.controller.BaseViewController;
import com.jhpark.marketing.blog.entity.User;
import com.jhpark.marketing.blog.service.category.CategoryService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.Optional;

@Controller
@RequestMapping(path = "/category")
@RequiredArgsConstructor
public class CategoryViewController extends BaseViewController {
  private final CategoryService categoryService;

  @RequestMapping(method = RequestMethod.GET)
  public String list(@RequestParam(value = "categoryName", required = false) Optional<String> categoryName,
                     ModelMap modelMap, User user) {
    modelMap.put("user", user);
    if (categoryName.isPresent()) modelMap.put("categoryName", categoryName.get());
    else modelMap.put("categoryName", "default");

    return "category/blog-category-list";
  }

  @Deprecated
  @RequestMapping(path = "/{categoryName}",method = RequestMethod.GET)
  public String listCategory(@PathVariable(value = "categoryName") String categoryName,
                     ModelMap modelMap, User user) {
    modelMap.put("user", user);
    modelMap.put("categoryName", categoryName);
    return "category/blog-category-list";
  }
}
