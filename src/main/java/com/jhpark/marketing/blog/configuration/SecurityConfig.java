package com.jhpark.marketing.blog.configuration;

import com.jhpark.marketing.blog.component.OAuth2SuccessHandler;
import com.jhpark.marketing.blog.filter.JwtAuthFilter;
import com.jhpark.marketing.blog.service.CustomOAuth2UserService;
import com.jhpark.marketing.blog.service.TokenService;
import lombok.RequiredArgsConstructor;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.config.http.SessionCreationPolicy;
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;

/**
 * UsernamePasswordAuthenticationFilter필터 앞에 만든 JwtAuthFilter를 등록
 *  토큰이 만료되어 인증을 하지 못하면 /token/expired로 리다이렉트하여 Refresh요청을 해야한다는 것을 알려주고
 *  Refresh를 할 수 있도록 /token/** 을 전체 허용
 */
@RequiredArgsConstructor
@Configuration
public class SecurityConfig extends WebSecurityConfigurerAdapter {
  private final CustomOAuth2UserService oAuth2UserService;
  private final OAuth2SuccessHandler successHandler;
  private final TokenService tokenService;

  @Override
  protected void configure(HttpSecurity http) throws Exception {
    http.httpBasic().disable()
          .csrf().disable()
          .sessionManagement().sessionCreationPolicy(SessionCreationPolicy.STATELESS)

        .and()
          .authorizeRequests()
          .antMatchers("/token/**").permitAll()
          .anyRequest().authenticated()

        .and()
          .oauth2Login().loginPage("/token/expired")
            .successHandler(successHandler)
            .userInfoEndpoint().userService(oAuth2UserService);

    http.addFilterBefore(new JwtAuthFilter(tokenService), UsernamePasswordAuthenticationFilter.class );
  }
}
