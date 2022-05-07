package com.jhpark.marketing.blog.controller;

import com.jhpark.marketing.blog.entity.User;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;

import javax.servlet.http.HttpServletRequest;

public class BaseViewController {
  private final Logger LOG = LoggerFactory.getLogger(BaseViewController.class);

  @Value("${yonilum.base.url}")
  private String redirectUri;

  @ModelAttribute("user")
  public User getUser(HttpServletRequest request, ModelMap modelMap) {
    Object attribute = request.getAttribute("user");
    User userInfo;

    if (attribute == null) {
      userInfo = User.builder()
          .userId(99999L)
          .email("guest")
          .name("guest")
          .emailVerified(true)
          .imageUrl("")
          .build();
    } else {
      userInfo = (User) attribute;
    }

    LOG.debug("user : {}", userInfo);
    modelMap.put("user", userInfo);

    return (User) userInfo;
  }

  @ModelAttribute("redirectUri")
  public String getRedirectUri(HttpServletRequest request, ModelMap modelMap) {
    modelMap.put("redirect_uri", redirectUri);
    return redirectUri;
  }

}
