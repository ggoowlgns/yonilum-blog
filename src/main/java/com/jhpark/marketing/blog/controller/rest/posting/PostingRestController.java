package com.jhpark.marketing.blog.controller.rest.posting;

import com.jhpark.marketing.blog.controller.BaseViewController;
import com.jhpark.marketing.blog.entity.Posting;
import com.jhpark.marketing.blog.entity.PostingImage;
import com.jhpark.marketing.blog.entity.User;
import com.jhpark.marketing.blog.payload.request.PostingRequest;
import com.jhpark.marketing.blog.service.category.CategoryService;
import com.jhpark.marketing.blog.service.posting.PostingService;
import lombok.RequiredArgsConstructor;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.data.domain.*;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletResponse;
import java.util.*;
import java.util.stream.Collectors;

@RestController
@RequestMapping(path = "/api/posting", produces = "application/json")
@RequiredArgsConstructor
public class PostingRestController extends BaseViewController {
  Logger LOG = LoggerFactory.getLogger(PostingRestController.class);
  private final PostingService postingService;
  private final CategoryService categoryService;

  @RequestMapping(path = "/{postingId}", method = RequestMethod.GET)
  public Posting detail(@PathVariable("postingId") long postingId) {
    Posting posting = postingService.getPosting(postingId);
    LinkedHashSet<PostingImage> postingImagesOrdered = posting.getPostingImages().stream()
        .sorted(Comparator.comparingLong(PostingImage::getPostingImageId))
        .collect(Collectors.toCollection(()->new LinkedHashSet<>()));
    posting.setPostingImages(postingImagesOrdered);;
    return posting;
  }

  @RequestMapping(path = "/list", method = RequestMethod.GET)
  public Page<Posting> list(@RequestParam(value = "category", required = false, defaultValue = "") String category,
                            Pageable pageable) {
    List<Posting> postings = new ArrayList();
    Page<Posting> pagePostings;
    if (category.equals("")) {
      pagePostings = postingService.getAllPosting(pageable);
    } else {
      postings = postingService.getPostingsByCategory(pageable, category);
      pagePostings = new PageImpl<>(postings, pageable, postings.size());
    }
    return pagePostings;
  }

  @RequestMapping(path = "/latest", method = RequestMethod.GET)
  public Slice<Posting> latest(@RequestParam(value = "start", required = false, defaultValue = "0") int start,
          @RequestParam(value = "end", required = false, defaultValue = "5") int end) {
    Slice<Posting> latestPosting = postingService.getLatestPosting(start, end);
    return latestPosting;
  }

  @RequestMapping(path = "/latestFrom", method = RequestMethod.GET)
  public Slice<Posting> latestFromPosting(@RequestParam(value = "postingId", required = true) int postingId) {
    Slice<Posting> latestPosting = postingService.getLatestPostingFrom(postingId);
    return latestPosting;
  }

  @RequestMapping(path = "/top", method = RequestMethod.GET)
  public Slice<Posting> top(@RequestParam(value = "count", required = false, defaultValue = "10") int count) {
    Slice<Posting> postings = postingService.getTopViewsPosting(count);
    return postings;
  }


  /**
   * add posting with postingRequest & return url with created postingId
   * @param postingRequest
   * @param response
   */
  @RequestMapping(path = "", method = RequestMethod.POST)
  public void add(@RequestBody PostingRequest postingRequest,
                       HttpServletResponse response) {
    LOG.info("posting : {}", postingRequest);

    int postingId = postingService.addPosting(postingRequest);

    response.setStatus(HttpStatus.CREATED.value());
    response.setHeader("Location", "/posting/" + postingId);
  }

  @RequestMapping(path = "", method = RequestMethod.PUT)
  public void edit(@RequestBody PostingRequest postingRequest,
                      User user,
                      HttpServletResponse response) {
    LOG.info("posting : {}", postingRequest);

    postingService.updatePosting(postingRequest, user);
    response.setHeader("Location", "/posting/" + postingRequest.getPostingId());
  }
}
