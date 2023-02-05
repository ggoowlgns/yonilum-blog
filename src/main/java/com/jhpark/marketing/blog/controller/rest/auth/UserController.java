package com.jhpark.marketing.blog.controller.rest.auth;

import com.jhpark.marketing.blog.entity.User;
import com.jhpark.marketing.blog.exception.ResourceNotFoundException;
import com.jhpark.marketing.blog.repository.user.UserRepository;
import com.jhpark.marketing.blog.security.CurrentUser;
import com.jhpark.marketing.blog.security.UserPrincipal;
import lombok.RequiredArgsConstructor;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RequiredArgsConstructor
@RestController
@RequestMapping(path = "/user")
public class UserController {
  private final UserRepository userRepository;

  @GetMapping(path = "/me")
  @PreAuthorize("hasRole('USER')")
  public User getCurrentUser(@CurrentUser UserPrincipal userPrincipal) {
    return userRepository.findById(userPrincipal.getId())
                            .orElseThrow(() -> new ResourceNotFoundException("User", "id", userPrincipal.getId()));
  }

}
