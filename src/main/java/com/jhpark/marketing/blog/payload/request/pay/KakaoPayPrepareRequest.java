package com.jhpark.marketing.blog.payload.request.pay;

import lombok.Builder;
import lombok.Data;
import lombok.NonNull;

import java.util.List;
import java.util.Map;

@Data
@Builder
public class KakaoPayPrepareRequest {
  @NonNull
  private String cid;
  private String cid_secret;

  @NonNull
  private String partner_order_id;
  @NonNull
  private String partner_user_id;
  @NonNull
  private String item_name;
  private String item_code;

  @NonNull
  private Integer quantity;
  @NonNull
  private Integer total_amount;
  @NonNull
  private Integer tax_free_amount;

  private Integer vat_amount;

  @NonNull
  private String approval_url;
  @NonNull
  private String cancel_url;
  @NonNull
  private String fail_url;

  private List available_cards;
  private String payment_method_type;
  private Integer install_month;
  private Map custom_json;
}
