package com.jhpark.marketing.blog.filter;

import com.jhpark.marketing.blog.configuration.OAuth2LoginSecurityConfig;
import com.jhpark.marketing.blog.service.oauth2.TokenProvider;
import com.jhpark.marketing.blog.service.oauth2.CustomUserDetailsService;
import com.jhpark.marketing.blog.util.CookieUtils;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.web.authentication.WebAuthenticationDetailsSource;
import org.springframework.util.StringUtils;
import org.springframework.web.filter.OncePerRequestFilter;
import org.springframework.web.util.ContentCachingRequestWrapper;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
@Slf4j
@RequiredArgsConstructor
@Configuration
public class TokenAuthenticationFilter extends OncePerRequestFilter {

  private final TokenProvider tokenProvider;
  private final CustomUserDetailsService customUserDetailsService;

  @Override
  protected void doFilterInternal(HttpServletRequest request, HttpServletResponse response, FilterChain filterChain) throws ServletException, IOException {
    ContentCachingRequestWrapper contentRequestWrapper = new ContentCachingRequestWrapper(request);

    try {
      String jwt = getJwtFromRequest(request);
      if (StringUtils.hasText(jwt) && tokenProvider.validateToken(jwt)) {
        Long userId = tokenProvider.getUserIdFromToken(jwt);

        UserDetails userDetails = customUserDetailsService.loadUserById(userId);
        UsernamePasswordAuthenticationToken authentication = new UsernamePasswordAuthenticationToken(userDetails, null, userDetails.getAuthorities());
        authentication.setDetails(new WebAuthenticationDetailsSource().buildDetails(request));
        SecurityContextHolder.getContext().setAuthentication(authentication);
        request.setAttribute("user", customUserDetailsService.getUserById(userId));
      }
    } catch (Exception ex) {
      log.error("Could not set user authentication in security context", ex);
    }

    filterChain.doFilter(request, response);
//    log.info("http uri : {}", contentRequestWrapper.getRequestURI());
  }

  /**
   * JWT 를 어떻게 보관하는지 여러 방법이 있지만
   * 나는 : access token은 cookie에 저장해서 관리하는 방법을 채택했다. csrf 공격에 취약하기는 하나, 구현이 간편하기 때문이다.
   * @param request
   * @return
   */
  private String getJwtFromRequest(HttpServletRequest request) {

//        String queryString = request.getQueryString();
//
//        if (StringUtils.hasText(queryString) && queryString.startsWith("token=")) {
//            return queryString.substring(6,queryString.length());
//        }

//        String bearerToken = request.getHeader("Authorization");
//        if (StringUtils.hasText(bearerToken) && bearerToken.startsWith("Bearer ")) {
//            return bearerToken.substring(7, bearerToken.length());
//        }

    String token = CookieUtils.getCookie(request, OAuth2LoginSecurityConfig.ACCESS_TOKEN)
        .map(Cookie::getValue)
        .orElse((null));;
    if (StringUtils.hasText(token)) {
      return token;
    }
    return null;
  }

  @Override
  protected boolean shouldNotFilter(HttpServletRequest request) throws ServletException {
    String path = request.getRequestURI();
    return isPathFiltalbe(path);
  }
  private boolean isPathFiltalbe(String path) {
    return path.indexOf("/assets") >= 0;
  }
}
