package com.jhpark.marketing.blog.controller.rest.posting;

import com.jhpark.marketing.blog.entity.Posting;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletResponse;

@RestController
@RequestMapping(path = "/api/image", produces = "application/json")
@RequiredArgsConstructor
public class ImageRestController {

  @RequestMapping(path = "/uploads", method = RequestMethod.POST)
  public void upload(HttpServletResponse response) {
    //TODO : Image upload & return urls
    response.setStatus(HttpStatus.CREATED.value());
//    response.setHeader("Location", "/posting/" + postingId);
    //TODO : response 로 urls 넣어주기
  }
}
