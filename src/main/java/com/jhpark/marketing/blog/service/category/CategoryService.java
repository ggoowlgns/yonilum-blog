package com.jhpark.marketing.blog.service.category;

import com.jhpark.marketing.blog.payload.response.CategoryListElementResponse;
import com.jhpark.marketing.blog.payload.response.CategoryWithUrlElement;
import com.jhpark.marketing.blog.repository.category.CategoryRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Slice;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
public class CategoryService {
  private final CategoryRepository categoryRepository;


  public Slice<CategoryListElementResponse> getTopCategoryByView(int count) {
    Slice<CategoryListElementResponse> topCategories = categoryRepository.getTopCategoriesWithJPQL(PageRequest.of(0,count));
    List<CategoryWithUrlElement> categoryWithUrls = categoryRepository.getCategoryImageUrlByCategoryName(topCategories.stream()
                                                                    .map(CategoryListElementResponse::getCategory)
                                                                    .collect(Collectors.toList()));
    topCategories.getContent().stream().forEach( e-> {
      for (CategoryWithUrlElement categoryWithUrl  : categoryWithUrls) {
        if (e.getCategory().equals(categoryWithUrl.getCategory())) {
          e.setCategoryImageUrl(categoryWithUrl.getCategoryImageUrl());
        }
      }
    });
    return topCategories;
  }


}
