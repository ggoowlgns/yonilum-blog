package com.jhpark.marketing.blog.controller.rest.pay;

import com.jhpark.marketing.blog.payload.response.pay.KakaoPayPrepareResponse;
import com.jhpark.marketing.blog.service.pay.KakaoPayService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpHeaders;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.view.RedirectView;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Collection;

@Slf4j
@RestController
@RequestMapping(path = "/api/kakaopay", produces = "application/json")
@RequiredArgsConstructor
public class KakaoPayRestController {


  @Autowired
  private KakaoPayService kakaoPayService;

  @RequestMapping(path = "/prepare", method = RequestMethod.GET)
  public RedirectView prepareKakaoPay(HttpServletRequest request, HttpServletResponse response) {
    KakaoPayPrepareResponse prepareResponse =  kakaoPayService.prepare();
    response.addCookie(makeTidCookie(prepareResponse.getTid()));
    addSameSite(response , "None");
    return new RedirectView(prepareResponse.getNext_redirect_pc_url());
  }
  private Cookie makeTidCookie(String tid) {
    Cookie cookie = new Cookie("kakao_tid", tid);
    cookie.setMaxAge(10000);
    cookie.setPath("/");
    return cookie;
  }

  private void addSameSite(HttpServletResponse response, String sameSite) {
    Collection<String> headers = response.getHeaders(HttpHeaders.SET_COOKIE);
    boolean firstHeader = true;
    for (String header : headers) { // there can be multiple Set-Cookie attribute
      if (firstHeader) {
        response.setHeader(HttpHeaders.SET_COOKIE, String.format("%s; Secure; %s", header, "SameSite=" + sameSite));
        firstHeader = false;
        continue;
      }
      response.addHeader(HttpHeaders.SET_COOKIE, String.format("%s; Secure; %s", header, "SameSite=" + sameSite));
    }
  }

}
