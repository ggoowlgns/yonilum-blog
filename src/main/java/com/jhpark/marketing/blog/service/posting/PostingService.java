package com.jhpark.marketing.blog.service.posting;

import com.jhpark.marketing.blog.entity.*;
import com.jhpark.marketing.blog.payload.request.PostingRequest;
import com.jhpark.marketing.blog.payload.response.CategoryListElementResponse;
import com.jhpark.marketing.blog.repository.posting.*;
import lombok.RequiredArgsConstructor;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.data.domain.PageRequest;
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
  private final PostingParagraphRepository postingParagraphRepository;

  private final CategoryRepository categoryRepository;

  public List<Posting> getAllPosting() {
    return postingRepository.findAll();
  }

  public Slice<Posting> getLatestPosting(int limit) {
    return postingRepository.findAllByOrderByCreatedDatetimeDesc(PageRequest.of(0,limit));
  }

  public List<Posting> getTopViewsPosting(int limit) {
    return postingRepository.findAllByOrderByViewsDesc(PageRequest.of(0, limit));
  }

  public Posting getPosting(long postingId) {
    return postingRepository.findPostingByPostingId(postingId);
  }

  public List<CategoryListElementResponse> getCategoryGroupByCount() {
    return categoryRepository.findGroupByCategoryWithJPQL();
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

    List<PostingContentParagraph> contentParagraphs = new ArrayList<>();
    int index = 0;
    for(String content : request.getParagraphs()) {
      contentParagraphs.add(
        PostingContentParagraph.builder()
            .content(content)
            .postingId(Posting.builder().postingId(postingId).build())
            .paragraphIndex(index)
            .build()
      );
      index++;
    }
    postingParagraphRepository.saveAll(contentParagraphs);
    LOG.info("tb_posting_paragraph insert success");

    List<Category> categories = new ArrayList<>();
    index=0;
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
