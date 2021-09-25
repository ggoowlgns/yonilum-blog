package com.jhpark.marketing.blog.controller.view.posting;

import com.jhpark.marketing.blog.controller.view.BaseViewController;
import com.jhpark.marketing.blog.entity.User;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(path = "/posting")
public class PostingViewController extends BaseViewController {
  Logger LOG = LoggerFactory.getLogger(PostingViewController.class);

  @RequestMapping(path = "/{postingNum}", method = RequestMethod.GET)
  public String posting(@PathVariable("postingNum")String postingNum,
                        ModelMap modelMap, User user) {
    LOG.info("posting num : {}", postingNum);
    modelMap.put("user", user);
    return "posting/post_gallery";
  }
}
