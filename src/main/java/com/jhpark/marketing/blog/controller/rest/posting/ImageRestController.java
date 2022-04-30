package com.jhpark.marketing.blog.controller.rest.posting;

import com.jhpark.marketing.blog.component.FileHandler;
import com.jhpark.marketing.blog.entity.Posting;
import com.jhpark.marketing.blog.payload.response.ImageUploadResponse;
import lombok.RequiredArgsConstructor;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.server.ServerErrorException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.InputStream;
import java.util.List;

@RestController
@RequestMapping(path = "/api/image", produces = "application/json")
@RequiredArgsConstructor
public class ImageRestController {
  Logger LOG = LoggerFactory.getLogger(ImageRestController.class);
  private final FileHandler fileHandler;

  @RequestMapping(path = "/uploads", method = RequestMethod.POST, consumes = "multipart/form-data")
  public ImageUploadResponse upload(MultipartHttpServletRequest multipartHttpServletRequest,
                                    HttpServletRequest request, HttpServletResponse response) {
    MultipartFile file = multipartHttpServletRequest.getFile("file");
    LOG.info("image : {}", file);
    LOG.info("request : {}", request);
    String path = "";
    try {
      path = fileHandler.storeAndGetPath(file);
      response.setStatus(HttpStatus.CREATED.value());
      return new ImageUploadResponse("OK", "Success Uploading File", path);
    } catch (Exception e) {
      LOG.error("upload faile : ", e);
      throw new ServerErrorException("Image upload Fail");
    }
  }
}
