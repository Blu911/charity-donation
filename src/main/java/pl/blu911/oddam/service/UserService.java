package pl.blu911.oddam.service;

import org.springframework.security.core.annotation.AuthenticationPrincipal;
import pl.blu911.oddam.domain.CurrentUser;
import pl.blu911.oddam.domain.User;

import javax.validation.Valid;

public interface UserService {
    User findByUserUsername(String username);

    void saveUser(User user, String role);

    void updateUser(@AuthenticationPrincipal CurrentUser customUser, @Valid User user);

    void updateUser(@Valid User user);

    User findByUserEmail(String email);
}
