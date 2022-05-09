package com.jhpark.marketing.blog.service.pay;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.ActiveProfiles;
import org.springframework.test.context.junit4.SpringRunner;

import static org.junit.jupiter.api.Assertions.*;

@AutoConfigureMockMvc
@SpringBootTest()
@ActiveProfiles("local")
class KakaoPayServiceTest {

  @Autowired
  KakaoPayService service;

  @BeforeEach
  void setUp() {
  }

  @Test
  void prepare() {
    service.prepare();
  }
}