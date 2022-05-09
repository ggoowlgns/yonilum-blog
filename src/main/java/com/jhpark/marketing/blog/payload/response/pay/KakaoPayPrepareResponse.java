package com.jhpark.marketing.blog.payload.response.pay;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;

import java.time.LocalDateTime;
import java.util.Date;

@Data
public class KakaoPayPrepareResponse {
  private String tid, next_redirect_pc_url;
  private Date created_at;
}
