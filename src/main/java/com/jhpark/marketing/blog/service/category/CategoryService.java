package com.jhpark.marketing.blog.service.category;

import com.jhpark.marketing.blog.entity.Category;
import com.jhpark.marketing.blog.entity.Posting;
import com.jhpark.marketing.blog.payload.response.CategoryListElementResponse;
import com.jhpark.marketing.blog.repository.category.CategoryRepository;
import com.jhpark.marketing.blog.repository.posting.PostingRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Slice;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
@RequiredArgsConstructor
public class CategoryService {
  private final CategoryRepository categoryRepository;


  public Slice<CategoryListElementResponse> getTopCategoryByView(int count) {
    return categoryRepository.findAllWithJPQL(PageRequest.of(0,count));
  }


}
