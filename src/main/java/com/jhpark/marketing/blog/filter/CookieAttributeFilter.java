package com.jhpark.marketing.blog.filter;

import lombok.extern.slf4j.Slf4j;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpHeaders;

import javax.servlet.*;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Collection;

@Slf4j
class CookieAttributeFilter implements Filter {
  @Override public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
      throws IOException, ServletException {
    HttpServletResponse httpServletResponse = (HttpServletResponse) response;
    chain.doFilter(request, response);
    addSameSite(httpServletResponse , "None");
  }

  @Override public void init(FilterConfig filterConfig) throws ServletException {
    // TODO Auto-generated method stub
  }

  @Override public void destroy() {
    // TODO Auto-generated method stub
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
