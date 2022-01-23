package com.jhpark.marketing.blog.controller.view.category;

import com.jhpark.marketing.blog.entity.Category;
import com.jhpark.marketing.blog.entity.Posting;
import com.jhpark.marketing.blog.payload.response.CategoryListElementResponse;
import com.jhpark.marketing.blog.service.category.CategoryService;
import com.jhpark.marketing.blog.service.posting.PostingService;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
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
  private final PostingService postingService;
  private final CategoryService categoryService;

  @RequestMapping(path = "/list", method = RequestMethod.GET)
  public List<CategoryListElementResponse> categoryList() {
    List<CategoryListElementResponse> categories = postingService.getCategoryGroupByCount();
    return categories;
  }

  @RequestMapping(method = RequestMethod.GET)
  public List<Posting> postingsByCategory(@RequestParam(value = "categoryName", required = false)Optional<String> categoryName) {
    List<Posting> postings = new ArrayList<>();
    if (categoryName.isPresent()) postings = categoryService.getPostingsByCategory(categoryName.get());
    else postings = categoryService.getPostingsByCategory(null);
    return postings;
  }
}
