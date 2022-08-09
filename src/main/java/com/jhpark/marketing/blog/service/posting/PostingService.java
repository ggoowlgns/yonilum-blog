package com.jhpark.marketing.blog.service.posting;

import com.jhpark.marketing.blog.entity.*;
import com.jhpark.marketing.blog.exception.PostingNotAuthorizedException;
import com.jhpark.marketing.blog.payload.request.PostingRequest;
import com.jhpark.marketing.blog.repository.category.CategoryRepository;
import com.jhpark.marketing.blog.repository.posting.*;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
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

@Slf4j
@Service
@RequiredArgsConstructor
public class PostingService {

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
    savePostingAndSetPostingId(request);
    savePostingImages(request);
    savePostingContent(request);
    saveCategory(request);
    return (int)request.getPostingId();
  }

  private void savePostingAndSetPostingId(PostingRequest postingRequest) {
    // insert tb_posting
    long postingId = postingRepository.save(Posting.builder()
        .user(User.builder().userId(postingRequest.getUserId()).build())
        .title(postingRequest.getTitle())
        .thumbnailUrl(postingRequest.getThumbnailUrl())
        .postingType(postingRequest.getPostingType())
        .build()).getPostingId();
    postingRequest.setPostingId(postingId);
    log.info("posting insert success, posting : {}", postingRequest);
  }

  private void savePostingImages(PostingRequest postingRequest) {
    List<PostingImage> postingImages = new ArrayList<>();
    for (String imageUrl : postingRequest.getImages()) {
      postingImages.add(PostingImage.builder()
          .postingId(Posting.builder().postingId(postingRequest.getPostingId()).build())
          .imageUrl(imageUrl)
          .build());
    }
    postingImagesRepository.saveAll(postingImages);
    log.info("posting_image insert success postingImages : {}", postingImages);
  }

  private void savePostingContent(PostingRequest postingRequest) {
    PostingContent existingPostingContent = postingContentRepository.findPostingContentByPostingId(Posting.builder().postingId(postingRequest.getPostingId()).build());
    PostingContent postingContent = PostingContent.builder()
        .content(postingRequest.getContent())
        .postingId(Posting.builder().postingId(postingRequest.getPostingId()).build())
        .build();
    if (existingPostingContent != null) {
      log.info("PostingContent exists for this postingId : {}, existingPostingContent : {}", postingRequest.getPostingId(), existingPostingContent);
      postingContent.setPostingContentId(existingPostingContent.getPostingContentId());
      postingContent.setCreatedDatetime(existingPostingContent.getCreatedDatetime());
    }
    postingContentRepository.save(postingContent);
    log.info("tb_posting_paragraph insert success - postingContent : {}", postingContent);
  }

  private void saveCategory(PostingRequest postingRequest) {
    int index = 0;
    List<Category> categories = new ArrayList<>();
    for (String categoryName : postingRequest.getCategories()) {
      Category category = Category.builder()
          .category(categoryName)
          .categoryIndex(index)
          .postingId(Posting.builder().postingId(postingRequest.getPostingId()).build())
          .build();
      Category existingCategory = categoryRepository.findCategoryByPostingIdAndCategoryIndex(
          Posting.builder().postingId(postingRequest.getPostingId()).build(), index);
      if (existingCategory != null) {
        category.setCategoryId(existingCategory.getCategoryId());
      }
      categories.add(category);
      index++;
    }
    categoryRepository.saveAll(categories);
    log.info("tb_category insert success - categories : {}", categories);
  }

  @Transactional
  public void updatePosting(PostingRequest postingRequest, User user) throws PostingNotAuthorizedException {
    checkPostingAuthorization(postingRequest.getPostingId(), user);
    savePostingWithPostingId(postingRequest);

    //TODO : 새로 들어가고 있다. : 기존에 있으면 update 하는식으로 수정 필요
//    savePostingImages(postingRequest);
    savePostingContent(postingRequest);
    saveCategory(postingRequest);
  }

  private void savePostingWithPostingId(PostingRequest postingRequest) {
    Posting existingPosting = postingRepository.findPostingByPostingId(postingRequest.getPostingId());
    postingRepository.save(Posting.builder()
            .postingId(postingRequest.getPostingId())
            .title(postingRequest.getTitle())
            .postingType(postingRequest.getPostingType())
            // 변경되지 않는 정보들
            .user(existingPosting.getUser())
            .thumbnailUrl(existingPosting.getThumbnailUrl())
            .createdDatetime(existingPosting.getCreatedDatetime())
            .build());
    log.info("savePostingWithPostingId PostingRequest : {}", postingRequest );
  }

  private void checkPostingAuthorization(long postingId, User user) throws PostingNotAuthorizedException{
    if (!user.getAuthGrade().equals(new Character('M')) &&
        postingRepository.findPostingByPostingId(postingId)
        .getUser().getUserId() != user.getUserId()) {
      throw new PostingNotAuthorizedException("checkPostingAuthorization - postingId : " + postingId + "User : " + user);
    }

  }
}
