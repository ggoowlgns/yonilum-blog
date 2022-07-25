package com.jhpark.marketing.blog.configuration;

import com.jhpark.marketing.blog.component.handler.OAuth2AuthenticationFailureHandler;
import com.jhpark.marketing.blog.component.handler.OAuth2AuthenticationSuccessHandler;
import com.jhpark.marketing.blog.filter.TokenAuthenticationFilter;
import com.jhpark.marketing.blog.repository.oauth2.HttpCookieOAuth2AuthorizationRequestRepository;

import com.jhpark.marketing.blog.service.TokenService;
import com.jhpark.marketing.blog.service.oauth2.CustomOAuth2UserService;
import com.jhpark.marketing.blog.service.oauth2.CustomUserDetailsService;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.config.BeanIds;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.config.http.SessionCreationPolicy;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;

/**
 * UsernamePasswordAuthenticationFilter필터 앞에 만든 JwtAuthFilter를 등록
 *  토큰이 만료되어 인증을 하지 못하면 /token/expired로 리다이렉트하여 Refresh요청을 해야한다는 것을 알려주고
 *  Refresh를 할 수 있도록 /token/** 을 전체 허용
 */
@RequiredArgsConstructor
@Configuration
@EnableWebSecurity
@EnableGlobalMethodSecurity (
    securedEnabled = true,
    jsr250Enabled = true,
    prePostEnabled = true
)
public class OAuth2LoginSecurityConfig extends WebSecurityConfigurerAdapter {

  private final CustomOAuth2UserService oAuth2UserService;
  private final CustomUserDetailsService userDetailService;

  private final OAuth2AuthenticationSuccessHandler successHandler;
  private final OAuth2AuthenticationFailureHandler failureHandler;

  private final TokenService tokenService;
  private final TokenAuthenticationFilter tokenAuthenticationFilter;

  public static String ACCESS_TOKEN;

  @Override
  protected void configure(HttpSecurity http) throws Exception {
    http.httpBasic().disable()
          .cors()
        .and()
          .csrf().disable()
          .formLogin().disable()
          //토큰 사용을 위해 session 비활성화
          .sessionManagement().sessionCreationPolicy(SessionCreationPolicy.STATELESS)


        .and()
          .authorizeRequests()
            .antMatchers("/",
                "/error",
                "/favicon.ico",
                "/**/*.png",
                "/**/*.gif",
                "/**/*.svg",
                "/**/*.jpg",
                "/**/*.html",
                "/**/*.css",
                "/**/*.js")
            .permitAll()
            .antMatchers("/about").permitAll()
            .antMatchers("/category", "/category/**").permitAll()
            .antMatchers("/posting", "/posting/**").permitAll()
//            .antMatchers("/api/**").hasAnyRole(Role.GUEST.name(), Role.USER.name(), Role.ADMIN.name())
            .antMatchers("/api/**").permitAll()
            .antMatchers("/auth/**", "/oauth2/**").permitAll()
            .antMatchers("/login/oauth2/**").permitAll()
            .antMatchers("/swagger-resources/**").permitAll() //for swagger

            .anyRequest().authenticated()
//        .and()
//          .exceptionHandling()
//            .authenticationEntryPoint(new RestAuthenticationEntryPoint())

        .and()
          .oauth2Login()
            .authorizationEndpoint()
              //client 처음 로그인 시도 uri
              .baseUri("/oauth2/authorize")
              .authorizationRequestRepository(cookieAuthorizationRequestRepository())
          .and()
            .userInfoEndpoint()
              .userService(oAuth2UserService)
          .and()
            .successHandler(successHandler)
            .failureHandler(failureHandler);


    http.addFilterBefore(tokenAuthenticationFilter, UsernamePasswordAuthenticationFilter.class );
  }


  /**
   * 서비스를 stateless 로 두고 있기 떄문에,
   * JWT 를 사용하기 떄문에 session 에 저장할 필요가 없어져, Auth Request 를 Based64 encoded coockie로 저장
   * @return
   */
  @Bean
  public HttpCookieOAuth2AuthorizationRequestRepository cookieAuthorizationRequestRepository() {
    return new HttpCookieOAuth2AuthorizationRequestRepository();
  }

  /**
   * Authorization 에 사용할 detailService, pw encoder 정의
   * @param auth
   * @throws Exception
   */
  @Override
  protected void configure(AuthenticationManagerBuilder auth) throws Exception {
    auth
        .userDetailsService(userDetailService)
        .passwordEncoder(passwordEncoder());
  }

  @Bean
  PasswordEncoder passwordEncoder() {
    return new BCryptPasswordEncoder();
  }

  @Bean(BeanIds.AUTHENTICATION_MANAGER)
  @Override
  public AuthenticationManager authenticationManagerBean() throws Exception {
    return super.authenticationManagerBean();
  }

  @Value("${yonilum.access.token.key}")
  public void setAccessToken(String value) {
    this.ACCESS_TOKEN = value;
  }
}
