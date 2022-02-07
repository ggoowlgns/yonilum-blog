package com.jhpark.marketing.blog.service.category;

import com.jhpark.marketing.blog.entity.Category;
import com.jhpark.marketing.blog.entity.Posting;
import com.jhpark.marketing.blog.payload.response.CategoryListElementResponse;
import com.jhpark.marketing.blog.repository.category.CategoryRepository;
import com.jhpark.marketing.blog.repository.posting.PostingRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
@RequiredArgsConstructor
public class CategoryService {
  private final CategoryRepository categoryRepository;

  public List<Posting> getPostingsByCategory(String categoryName) {
    List<Posting> postings = new ArrayList<>();
    List<Category> categories;

    categories = categoryRepository.findAllByCategoryOrderByPostingIdDesc(categoryName);
    categories.stream()
        .forEach(category -> postings.add(category.getPostingId()));

    return postings;
  }


}
