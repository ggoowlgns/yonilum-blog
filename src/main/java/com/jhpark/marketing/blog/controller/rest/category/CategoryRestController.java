package com.jhpark.marketing.blog.controller.rest.category;

import com.jhpark.marketing.blog.entity.Category;
import com.jhpark.marketing.blog.entity.Posting;
import com.jhpark.marketing.blog.payload.response.CategoryListElementResponse;
import com.jhpark.marketing.blog.service.category.CategoryService;
import com.jhpark.marketing.blog.service.posting.PostingService;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Slice;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@RestController
@RequestMapping(path = "/api/category", produces = "application/json")
@RequiredArgsConstructor
public class CategoryRestController {

  private final CategoryService categoryService;

  @RequestMapping(path = "/top", method = RequestMethod.GET)
  public Slice<CategoryListElementResponse> topCategoryListByView(@RequestParam(value = "count", required = false, defaultValue = "5") int count) {
    Slice<CategoryListElementResponse> categories = categoryService.getTopCategoryByView(count);
    return categories;
   }

}
