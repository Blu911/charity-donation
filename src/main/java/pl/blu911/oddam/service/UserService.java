package pl.blu911.oddam.service;

import org.springframework.security.core.annotation.AuthenticationPrincipal;
import pl.blu911.oddam.domain.CurrentUser;
import pl.blu911.oddam.domain.User;

import javax.validation.Valid;

public interface UserService {
    User findByUserUsername(String email);

    void saveUser(User user);

    void saveAdmin(User user);

    void updateUser(@AuthenticationPrincipal CurrentUser customUser, @Valid User user);
}
