package com.jhpark.marketing.blog.controller.rest.posting;

import com.jhpark.marketing.blog.controller.BaseController;
import com.jhpark.marketing.blog.entity.Posting;
import com.jhpark.marketing.blog.service.posting.PostingService;
import lombok.RequiredArgsConstructor;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;

@RestController
@RequestMapping(path = "/api/posting", produces = "application/json")
@RequiredArgsConstructor
public class PostingRestController extends BaseController {
  Logger LOG = LoggerFactory.getLogger(PostingRestController.class);
  private final PostingService postingService;

  @RequestMapping(path = "/{postingId}", method = RequestMethod.GET)
  public Posting detail(@PathVariable("postingId") long postingId) {
    Posting posting = new Posting();
    //TODO : postingId 에 대한 posting 정보
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
  public List<String> categoryList() {
    List<String> categories = new ArrayList<>();
    //TODO : get category list
    return categories;
  }

  @RequestMapping(path = "/top", method = RequestMethod.GET)
  public List<Posting> top(@RequestParam(value = "count", required = false, defaultValue = "10") int count) {
    List<Posting> postings = new ArrayList<>();
    //TODO : count 값 만큼의 top posting 가져오기
    return postings;
  }



  @RequestMapping(path = "", method = RequestMethod.POST)
  public Posting add(@RequestBody Posting posting,
                       HttpServletResponse response) {
    LOG.info("posting : {}", posting);
    //TODO : add posting & return postingId
    int postingId = 0;

    response.setStatus(HttpStatus.CREATED.value());
    response.setHeader("Location", "/posting/" + postingId);

    return posting;
  }

  @RequestMapping(path = "/{postingId}", method = RequestMethod.PUT)
  public Posting edit(@RequestBody Posting posting) {
    LOG.info("posting : {}", posting);
    //TODO : edit posting

    return posting;
  }
}
