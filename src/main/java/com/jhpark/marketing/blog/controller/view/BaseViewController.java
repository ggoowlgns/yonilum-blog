package com.jhpark.marketing.blog.controller.view;

import com.jhpark.marketing.blog.entity.User;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;

import javax.servlet.http.HttpServletRequest;

public class BaseViewController {
  private final Logger LOG = LoggerFactory.getLogger(BaseViewController.class);

  @ModelAttribute("user")
  public User getUser(HttpServletRequest request, ModelMap modelMap) {
    Object attribute = request.getAttribute("user");
    User userInfo;

    if (attribute == null) {
      userInfo = User.builder()
          .id(99999L)
          .email("guest")
          .name("guest")
          .emailVerified(true)
          .imageUrl("")
          .build();
    } else {
      userInfo = (User) attribute;
    }

    modelMap.put("user", userInfo);

    return (User) userInfo;
  }

}
