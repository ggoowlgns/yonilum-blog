package com.jhpark.marketing.blog.filter;

import com.jhpark.marketing.blog.domain.User;
import com.jhpark.marketing.blog.service.TokenService;
import lombok.RequiredArgsConstructor;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.filter.GenericFilterBean;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.util.Arrays;

/**
 * API 서버에 접근할 떄 Auth헤더에 발급받은 토큰을 함께 보내면
 * 토큰값에서 유저정보를 가져와 회원가입이 되었는지 검증 후 인증
 */
@RequiredArgsConstructor
public class JwtAuthFilter extends GenericFilterBean {
  private final TokenService tokenService;

  @Override
  public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
    //request header 에서 Auth 까봄
    String token = ((HttpServletRequest)request).getHeader("Auth");

    if (token != null && tokenService.verifyToken(token)) {
      String email = tokenService.getUid(token);

      //TODO :  DB 를 보고 selectUserByEmail()
      // DB연동을 안했으니 이메일 정보로 유저를 만들어주겠습니다
      User user = User.builder()
          .email(email)
          .name("이름이에용")
          .picture("프로필 이미지에요").build();

      Authentication auth = getAuthentication(user);
      SecurityContextHolder.getContext().setAuthentication(auth);
    }

    chain.doFilter(request, response);
  }

  public Authentication getAuthentication(User user) {
    return new UsernamePasswordAuthenticationToken(user, "",
        Arrays.asList(new SimpleGrantedAuthority("ROLE_USER")));
  }
}