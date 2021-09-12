package com.jhpark.marketing.blog.controller.rest.auth;

import com.jhpark.marketing.blog.domain.AuthProvider;
import com.jhpark.marketing.blog.domain.User;
import com.jhpark.marketing.blog.exception.BadRequestException;
import com.jhpark.marketing.blog.payload.request.LoginRequest;
import com.jhpark.marketing.blog.payload.request.SignUpRequest;
import com.jhpark.marketing.blog.payload.response.ApiResponse;
import com.jhpark.marketing.blog.payload.response.AuthResponse;
import com.jhpark.marketing.blog.repository.UserRepository;
import com.jhpark.marketing.blog.service.oauth2.TokenProvider;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.support.ServletUriComponentsBuilder;

import java.net.URI;

@RequiredArgsConstructor
@RequestMapping(path = "/auth")
@RestController
public class AuthController {
  private final AuthenticationManager authenticationManager;
  private final UserRepository userRepository;
  private final PasswordEncoder passwordEncoder;
  private final TokenProvider tokenProvider;

  @PostMapping(path = "/login")
  public ResponseEntity<?> authUser(@RequestBody LoginRequest loginRequest) {
    Authentication auth = authenticationManager.authenticate(
        new UsernamePasswordAuthenticationToken(
            loginRequest.getEmail(),
            loginRequest.getPassword()
        )
    );
    SecurityContextHolder.getContext().setAuthentication(auth);
    String token = tokenProvider.createToken(auth);
    return ResponseEntity.ok(new AuthResponse(token));
  }

  @PostMapping(path = "/signup")
  public ResponseEntity<?> registerUser(@RequestBody SignUpRequest signUpRequest) {
    if (userRepository.existsByEmail(signUpRequest.getEmail())) {
      throw new BadRequestException("email is already used");
    }

    // 계정 생성
    User result = userRepository.save(User.builder()
        .name(signUpRequest.getName())
        .email(signUpRequest.getEmail())
        .password(signUpRequest.getPassword())
        .provider(AuthProvider.local)
        .build()
    );

    URI location = ServletUriComponentsBuilder
        .fromCurrentContextPath().path("/user/me")
        .buildAndExpand(result.getEmail()).toUri();

    return ResponseEntity.created(location)
        .body(new ApiResponse(true, "success creating account"));
  }
}
