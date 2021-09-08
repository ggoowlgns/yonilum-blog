package com.jhpark.marketing.blog.configuration;

import com.jhpark.marketing.blog.component.OAuth2SuccessHandler;
import com.jhpark.marketing.blog.service.CustomOAuth2UserService;
import lombok.RequiredArgsConstructor;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.config.http.SessionCreationPolicy;

@RequiredArgsConstructor
@Configuration
public class SecurityConfig extends WebSecurityConfigurerAdapter {
  private final CustomOAuth2UserService oAuth2UserService;
  private final OAuth2SuccessHandler successHandler;

  @Override
  protected void configure(HttpSecurity http) throws Exception {
    http.httpBasic().disable()
        .csrf().disable()
        .sessionManagement().sessionCreationPolicy(SessionCreationPolicy.STATELESS)

        .and()
          .authorizeRequests()
            .anyRequest().authenticated()

        .and()
          .oauth2Login()
            .successHandler(successHandler)
            .userInfoEndpoint().userService(oAuth2UserService);;
  }
}
