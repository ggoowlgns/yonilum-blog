package com.jhpark.marketing.blog.controller.view;

import com.jhpark.marketing.blog.controller.BaseViewController;
import com.jhpark.marketing.blog.entity.Posting;
import com.jhpark.marketing.blog.entity.User;
import com.jhpark.marketing.blog.service.posting.PostingService;
import lombok.RequiredArgsConstructor;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.List;

@Controller
@RequiredArgsConstructor
public class HomeViewController extends BaseViewController {
  private final Logger LOG = LoggerFactory.getLogger(HomeViewController.class);
  private final PostingService postingService;

  @RequestMapping(path = "/", method = RequestMethod.GET)
  public String home(ModelMap modelMap, User user) {
    List<Posting> topPostings = postingService.getTopPosting(5);

    LOG.info("User : {}", user);
    modelMap.put("user", user);
    modelMap.put("postings", topPostings);

    return "index";
  }

//  @RequestMapping(value = "/{file}.ftl")
//  public String forwardRequests(@PathVariable String file) {
//    return file;
//  }

  @RequestMapping(value = "/about", method = RequestMethod.GET)
  public String about(ModelMap modelMap, User user) {
    modelMap.put("user", user);
    return "about";
  }



}
