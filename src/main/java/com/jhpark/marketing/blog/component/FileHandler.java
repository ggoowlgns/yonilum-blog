package com.jhpark.marketing.blog.component;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;
import org.springframework.util.ObjectUtils;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;

/**
 * https://velog.io/@pyo-sh/Spring-Boot-%ED%8C%8C%EC%9D%BC%EC%9D%B4%EB%AF%B8%EC%A7%80-%EC%97%85%EB%A1%9C%EB%93%9C-%EA%B5%AC%ED%98%84%ED%95%98%EA%B8%B0
 */

@Component
public class FileHandler {
  Logger LOG = LoggerFactory.getLogger(FileHandler.class);

  @Value("${server.tomcat.basedir}")
  String baseDir;

  public String storeAndGetPath(
      MultipartFile multipartFile
  ) throws Exception {
    String path = "";

    // 파일이 빈 것이 들어오면 빈 것을 반환
    if (multipartFile.isEmpty()) {
      LOG.error("multipartFile is empty");
      return null;
    }

    // 파일 이름을 업로드 한 날짜로 바꾸어서 저장할 것이다
    SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyyMMdd");
    String current_date = simpleDateFormat.format(new Date());

    // 프로젝트 폴더에 저장하기 위해 절대경로를 설정 (Window 의 Tomcat 은 Temp 파일을 이용한다)
    String absolutePath = new File(baseDir).getAbsolutePath() + "/";

    // 경로를 지정하고 그곳에다가 저장할 심산이다
    String tempPath = "images/" + current_date;
    File file = new File(tempPath);

    // 저장할 위치의 디렉토리가 존지하지 않을 경우
    if (!file.exists()) {
      // mkdir() 함수와 다른 점은 상위 디렉토리가 존재하지 않을 때 그것까지 생성
      file.mkdirs();
    }

    // 파일이 비어 있지 않을 때 작업을 시작해야 오류가 나지 않는다
    if (!multipartFile.isEmpty()) {
      // jpeg, png, gif 파일들만 받아서 처리할 예정
      String contentType = multipartFile.getContentType();
      String originalFileExtension = "";
      // 확장자 명이 없으면 이 파일은 잘 못 된 것이다
      if (ObjectUtils.isEmpty(contentType)) {
        LOG.error("확장자명이 없음");
      } else {
        if (contentType.contains("image/jpeg")) {
          originalFileExtension = ".jpg";
        } else if (contentType.contains("image/png")) {
          originalFileExtension = ".png";
        } else if (contentType.contains("image/gif")) {
          originalFileExtension = ".gif";
        }
        // 다른 파일 명이면 아무 일 하지 않는다
        else {
          LOG.error("예측하지 못한 확장자");
          return null;
        }
      }

      String newFileName = UUID.randomUUID().toString() + originalFileExtension;

      // 경로에 dir 존재하지 않으면
      File fileDir = new File(absolutePath + tempPath);
      if (!fileDir.exists()) {
        fileDir.mkdirs();
      }
      file = new File(absolutePath + tempPath + "/" + newFileName);
      multipartFile.transferTo(file);

      tempPath = file.getPath();
      LOG.info("file upload complete : {}", tempPath);
    }

    return tempPath;
  }
}