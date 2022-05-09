package com.jhpark.marketing.blog.service.pay;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.jhpark.marketing.blog.payload.request.pay.KakaoPayPrepareRequest;
import com.jhpark.marketing.blog.payload.response.pay.KakaoPayApprovalResponse;
import com.jhpark.marketing.blog.payload.response.pay.KakaoPayPrepareResponse;
import com.jhpark.marketing.blog.util.MultiValueMapConverter;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestClientException;
import org.springframework.web.client.RestTemplate;

import java.net.URI;
import java.net.URISyntaxException;
import java.util.Collections;
import java.util.Map;

@Slf4j
@RequiredArgsConstructor
@Service
public class KakaoPayService {
  private final RestTemplate restTemplate;
  private final String kakaoPayUrl = "https://kapi.kakao.com";

  @Value("${yonilum.kakao.cid}")
  private String kakaoCID;

  @Value("${yonilum.kakao.admin}")
  private String kakaoAdminKey;

  @Value("${yonilum.base.url}")
  private String baseUrl;


  @Autowired
  private final ObjectMapper objectMapper;

  public KakaoPayPrepareResponse prepare() {
    HttpHeaders headers = new HttpHeaders();
    headers.add("Authorization", "KakaoAK " + kakaoAdminKey);
    headers.add("Accept", MediaType.APPLICATION_JSON_UTF8_VALUE);
    headers.add("Content-Type", MediaType.APPLICATION_FORM_URLENCODED_VALUE + ";charset=UTF-8");

    HttpEntity<MultiValueMap<String, String>> requestEntity = new HttpEntity<MultiValueMap<String, String>>(makeKakaoPrepareRequest(), headers);
    ResponseEntity<KakaoPayPrepareResponse> responseEntity
        = restTemplate.postForEntity(kakaoPayUrl + "/v1/payment/ready",
              requestEntity,
              KakaoPayPrepareResponse.class
              );
    KakaoPayPrepareResponse response = responseEntity.getBody();
    log.info("KakaoPayPrepareResponse : {}", response);
    return response;
  }

  private MultiValueMap<String, String> makeKakaoPrepareRequest() {
    MultiValueMap<String, String> multiValueMap = new LinkedMultiValueMap<String, String>();
//    Map<String, String> fieldMap = objectMapper.convertValue(KakaoPayPrepareRequest.builder()
//        .cid("TC0ONETIME")
//        .partner_order_id("order")
//        .partner_user_id("user")
//        .item_name("asdfsadf")
//        .item_code("afafa")
//        .quantity(1)
//        .total_amount(2200)
//        .vat_amount(200)
//        .tax_free_amount(0)
//        .approval_url("http://localhost:8080/pay/prepareSuccess")
//        .fail_url("http://localhost:8080/404")
//        .cancel_url("http://localhost:8080/about")
//        .build(), new TypeReference<Map<String, String>>() {});
//    multiValueMap.setAll(fieldMap);
    multiValueMap.add("cid", "TC0ONETIME");
    multiValueMap.add("partner_order_id", "1001");
    multiValueMap.add("partner_user_id", "gorany");
    multiValueMap.add("item_name", "갤럭시S9");
    multiValueMap.add("quantity", "1");
    multiValueMap.add("total_amount", "2100");
    multiValueMap.add("tax_free_amount", "100");
    multiValueMap.add("approval_url", baseUrl+"/kakaopay/prepareSuccess");
    multiValueMap.add("cancel_url", baseUrl+"/kakaoPayCancel");
    multiValueMap.add("fail_url", baseUrl+"/kakaoPaySuccessFail");
    return multiValueMap;
  }

  public KakaoPayApprovalResponse kakaoPayApprove(String tid, String pgToken) {
    log.info("KakaoPayApprovalResponse............................................");
    log.info("-----------------------------");

    // 서버로 요청할 Header
    HttpHeaders headers = new HttpHeaders();
    headers.add("Authorization", "KakaoAK " + kakaoAdminKey);
    headers.add("Accept", MediaType.APPLICATION_JSON_UTF8_VALUE);
    headers.add("Content-Type", MediaType.APPLICATION_FORM_URLENCODED_VALUE + ";charset=UTF-8");

    // 서버로 요청할 Body
    MultiValueMap<String, String> params = new LinkedMultiValueMap<String, String>();
    params.add("cid", "TC0ONETIME");
    params.add("tid", tid);
    params.add("partner_order_id", "1001");
    params.add("partner_user_id", "gorany");
    params.add("pg_token", pgToken);
    params.add("total_amount", "2100");

    HttpEntity<MultiValueMap<String, String>> body = new HttpEntity<MultiValueMap<String, String>>(params, headers);

    try {
      KakaoPayApprovalResponse kakaoPayApprovalResponse
          = restTemplate.postForObject(new URI( kakaoPayUrl + "/v1/payment/approve"), body, KakaoPayApprovalResponse.class);
      log.info("" + kakaoPayApprovalResponse);

      return kakaoPayApprovalResponse;

    } catch (RestClientException e) {
      // TODO Auto-generated catch block
      e.printStackTrace();
    } catch (URISyntaxException e) {
      // TODO Auto-generated catch block
      e.printStackTrace();
    }

    return null;
  }
}
