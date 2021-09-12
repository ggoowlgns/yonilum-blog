package com.jhpark.marketing.blog.security;

import org.springframework.security.core.annotation.AuthenticationPrincipal;

import java.lang.annotation.*;

/**
 * 자신이 만든 어노테이션이 사용될 자바 요소를 지정할 수 있다.
 * 요 class 를 어노테이션으로 사용할 수 있다.
 */
@Target({ElementType.PARAMETER, ElementType.TYPE})
@Retention(RetentionPolicy.RUNTIME) //retention : 보유 정책 설정
@Documented // 요 class 의 JavaDoc에 이 어노테이션의 존재를 표기
@AuthenticationPrincipal //** 로그인한 사용자의 정보를 파라미터로 받을 떄 사용 **
public @interface CurrentUser {

}