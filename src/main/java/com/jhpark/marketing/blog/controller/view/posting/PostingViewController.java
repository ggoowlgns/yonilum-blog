package com.jhpark.marketing.blog.controller.view.posting;

import com.jhpark.marketing.blog.controller.BaseController;
import com.jhpark.marketing.blog.controller.rest.posting.PostingRestController;
import com.jhpark.marketing.blog.entity.User;
import com.jhpark.marketing.blog.service.posting.PostingService;
import lombok.NoArgsConstructor;
import lombok.RequiredArgsConstructor;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(path = "/view/posting")
@RequiredArgsConstructor
public class PostingViewController extends BaseController {
  Logger LOG = LoggerFactory.getLogger(PostingViewController.class);
  private final PostingService postingService;

  @RequestMapping(path = "/{postingId}", method = RequestMethod.GET)
  public String deatail(@PathVariable("postingId")long postingId,
                        ModelMap modelMap, User user) {
    LOG.info("posting id : {}", postingId);
    modelMap.put("user", user);

    return "posting/post_gallery";
  }
}
