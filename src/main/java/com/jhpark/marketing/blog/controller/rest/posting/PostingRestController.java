package com.jhpark.marketing.blog.controller.rest.posting;

import com.jhpark.marketing.blog.controller.BaseViewController;
import com.jhpark.marketing.blog.entity.Posting;
import com.jhpark.marketing.blog.payload.request.PostingRequest;
import com.jhpark.marketing.blog.payload.response.CategoryListElementResponse;
import com.jhpark.marketing.blog.service.posting.PostingService;
import lombok.RequiredArgsConstructor;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.data.domain.Slice;
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

  @RequestMapping(path = "/{postingId}", method = RequestMethod.GET)
  public Posting detail(@PathVariable("postingId") long postingId) {
    Posting posting = postingService.getPosting(postingId);
    return posting;
  }

  @RequestMapping(path = "/list", method = RequestMethod.GET)
  public List<Posting> list(@RequestParam(value = "category", required = false, defaultValue = "") String category) {
    List<Posting> postings = new ArrayList();
    if (category.equals("")) {
      //TODO : posting 전체 list
      postings = postingService.getAllPosting();
    } else {
      //TODO : posting list by category
    }
    return postings;
  }

  @RequestMapping(path = "/categoryList", method = RequestMethod.GET)
  public List<CategoryListElementResponse> categoryList() {
    List<CategoryListElementResponse> categories = postingService.getCategoryGroupByCount();
    return categories;
  }

  @RequestMapping(path = "/latest", method = RequestMethod.GET)
  public Slice<Posting> latest(@RequestParam(value = "count", required = false, defaultValue = "5") int count) {
    Slice<Posting> latestPosting = postingService.getLatestPosting(count);
    return latestPosting;
  }

  @RequestMapping(path = "/top", method = RequestMethod.GET)
  public List<Posting> top(@RequestParam(value = "count", required = false, defaultValue = "10") int count) {
    List<Posting> postings = postingService.getTopViewsPosting(count);
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
