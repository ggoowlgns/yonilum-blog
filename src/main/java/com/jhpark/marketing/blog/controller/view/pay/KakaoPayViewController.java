package com.jhpark.marketing.blog.controller.view.pay;

import com.jhpark.marketing.blog.controller.BaseViewController;
import com.jhpark.marketing.blog.payload.response.pay.KakaoPayApprovalResponse;
import com.jhpark.marketing.blog.service.pay.KakaoPayService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;

@Slf4j
@RequestMapping(path = "/kakaopay")
@Controller
@RequiredArgsConstructor
public class KakaoPayViewController extends BaseViewController {
  private final KakaoPayService kakaoPayService;

  @GetMapping("/prepareSuccess")
  public String kakaoPaySuccess(@RequestParam("pg_token") String pgToken, ModelMap modelMap,
                                HttpServletRequest request) {
    Cookie[] cookies = request.getCookies();

    String tid = getTidFromCookies(cookies);
    log.info("kakaoPaySuccess get............................................");
    log.info("kakaoPaySuccess pg_token : {}, tid : {}", pgToken, tid );


    KakaoPayApprovalResponse approvalResponse = kakaoPayService.kakaoPayApprove(tid, pgToken);
    modelMap.put("approval", approvalResponse);
    return "about";
  }
  private String getTidFromCookies(Cookie[] cookies) {
    for (Cookie cookie : cookies) {
      if ("kakao_tid".equals(cookie.getName())) return cookie.getValue();
    }
    return null;
  }
}
