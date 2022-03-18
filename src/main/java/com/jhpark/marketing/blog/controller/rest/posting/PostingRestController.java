package com.jhpark.marketing.blog.controller.rest.posting;

import com.jhpark.marketing.blog.controller.BaseViewController;
import com.jhpark.marketing.blog.entity.Posting;
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
import java.util.ArrayList;
import java.util.List;

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



  @RequestMapping(path = "", method = RequestMethod.POST)
  public void add(@RequestBody PostingRequest postingRequest,
                       HttpServletResponse response) {
    LOG.info("posting : {}", postingRequest);
    //TODO : add posting with postingRequest & return postingId

    int postingId = postingService.addPosting(postingRequest);

    response.setStatus(HttpStatus.CREATED.value());
    response.setHeader("Location", "/posting/" + postingId);
  }

  @RequestMapping(path = "/{postingId}", method = RequestMethod.PUT)
  public Posting edit(@RequestBody Posting posting) {
    LOG.info("posting : {}", posting);
    //TODO : edit posting

    return posting;
  }
}
