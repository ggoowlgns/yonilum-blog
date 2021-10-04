package com.jhpark.marketing.blog.service.posting;

import com.jhpark.marketing.blog.entity.Posting;
import com.jhpark.marketing.blog.payload.response.CategoryListElementResponse;
import com.jhpark.marketing.blog.repository.posting.CategoryRepository;
import com.jhpark.marketing.blog.repository.posting.PostingRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class PostingService {
  private final PostingRepository postingRepository;
  private final CategoryRepository categoryRepository;

  public List<Posting> getAllPosting() {
    return postingRepository.findAll();
  }

  public Posting getPosting(long postingId) {
    return postingRepository.findPostingByPostingId(postingId);
  }

  public List<CategoryListElementResponse> getCategoryGroupByCount() {
    return categoryRepository.findGroupByCategoryWithJPQL();
  }
}
