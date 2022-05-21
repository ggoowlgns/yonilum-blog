package com.jhpark.marketing.blog.controller.view.posting;

import com.jhpark.marketing.blog.controller.BaseViewController;
import com.jhpark.marketing.blog.entity.User;
import com.jhpark.marketing.blog.service.posting.PostingService;
import lombok.RequiredArgsConstructor;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.Optional;

@Controller
@RequestMapping(path = "/posting")
@RequiredArgsConstructor
public class PostingViewController extends BaseViewController {
  Logger LOG = LoggerFactory.getLogger(PostingViewController.class);
  private final PostingService postingService;

  @RequestMapping(path = "/{postingId}", method = RequestMethod.GET)
  public String detail(@PathVariable("postingId")long postingId,
                              ModelMap modelMap, User user) {
    LOG.info("posting id : {}", postingId);
    LOG.info("user info : {}", user);


    modelMap.put("user", user);
    modelMap.put("postingId", postingId);

    return "posting/post_gallery";
  }

  @RequestMapping(path = "/editor", method = RequestMethod.GET)
  public String editor(@RequestParam(value = "postingId", required = false) Optional<Long> postingId,
                       ModelMap modelMap, User user) {
    LOG.info("editor : {}", postingId.orElse(null));

    if (!postingId.isPresent()) {
      LOG.info("NEW POSTING");
    } else {
      LOG.info("EDIT POSTING : {}", postingId.get());
      modelMap.put("postingId", postingId.get());
    }
    modelMap.put("user", user);

    return "posting/post_editor";
  }
}
