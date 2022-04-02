package com.jhpark.marketing.blog.service.posting;

import com.jhpark.marketing.blog.entity.*;
import com.jhpark.marketing.blog.payload.request.PostingRequest;
import com.jhpark.marketing.blog.repository.category.CategoryRepository;
import com.jhpark.marketing.blog.repository.posting.*;
import lombok.RequiredArgsConstructor;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Slice;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

@Service
@RequiredArgsConstructor
public class PostingService {
  Logger LOG = LoggerFactory.getLogger(PostingService.class);

  private final PostingRepository postingRepository;
  private final PostingImagesRepository postingImagesRepository;
  private final PostingCommentRepository postingCommentRepository;
  private final PostingContentRepository postingContentRepository;

  private final CategoryRepository categoryRepository;

  public List<Posting> getAllPosting() {
    return postingRepository.findAllByOrderByPostingIdDesc();
  }

  public Page<Posting> getAllPosting(Pageable pageable) {
    return postingRepository.findAllByOrderByPostingIdDesc(pageable);
  }

  public Slice<Posting> getLatestPosting(int start, int end) {
    return postingRepository.findAllByOrderByCreatedDatetimeDesc(PageRequest.of(start,end));
  }

  public Slice<Posting> getLatestPostingFrom(long postingId) {
    return postingRepository.findAllByPostingIdIsLessThanOrderByCreatedDatetimeDesc(postingId, PageRequest.of(0,4));
  }

  public Slice<Posting> getTopViewsPosting(int limit) {
    return postingRepository.findAllByOrderByViewsDesc(PageRequest.of(0, limit));
  }

  public Posting getPosting(long postingId) {
    return postingRepository.findPostingByPostingId(postingId);
  }

  public List<Posting> getPostingsByCategory(Pageable pageable, String categoryName) {
    List<Posting> postings = new ArrayList<>();
    Page<Category> categories;

    categories = categoryRepository.findAllByCategoryOrderByPostingIdDesc(pageable,categoryName);
    categories.getContent().stream()
        .forEach(category -> postings.add(category.getPostingId()));

    return postings;
  }

  @Transactional
  public int addPosting(PostingRequest request) {
    // insert tb_posting
    long postingId = postingRepository.save(Posting.builder()
        .user(User.builder().userId(request.getUserId()).build())
        .title(request.getTitle())
        .thumbnailUrl(request.getThumbnailUrl())
        .postingType(request.getPostingType())
        .build()).getPostingId();
    LOG.info("posting insert success, postingId : {}", postingId);

    List<PostingImage> postingImages = new ArrayList<>();
    for (String imageUrl : request.getImages()) {
      postingImages.add(PostingImage.builder()
          .postingId(Posting.builder().postingId(postingId).build())
          .imageUrl(imageUrl)
          .build());
    }
    postingImagesRepository.saveAll(postingImages);
    LOG.info("posting_image insert success");



    postingContentRepository.save(PostingContent.builder()
        .content(request.getContent())
        .postingId(Posting.builder().postingId(postingId).build())
        .build());
    LOG.info("tb_posting_paragraph insert success");


    int index = 0;
    List<Category> categories = new ArrayList<>();
    for (String category : request.getCategories()) {
      categories.add(Category.builder()
          .category(category)
          .categoryIndex(index)
          .postingId(Posting.builder().postingId(postingId).build())
          .build());
      index++;
    }
    categoryRepository.saveAll(categories);
    LOG.info("tb_category insert success");

    return (int) postingId;
  }
}
