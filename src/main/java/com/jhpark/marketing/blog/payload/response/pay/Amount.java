package com.jhpark.marketing.blog.payload.response.pay;

import lombok.Data;

@Data
public class Amount {
  private Integer total, tax_free, vat, point, discount;
}
