package pl.blu911.oddam.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.DisabledException;
import org.springframework.security.authentication.LockedException;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import pl.blu911.oddam.domain.CurrentUser;
import pl.blu911.oddam.domain.Role;
import pl.blu911.oddam.domain.User;
import pl.blu911.oddam.service.UserService;

import java.util.HashSet;
import java.util.Set;

public class SpringDataUserDetailsService implements UserDetailsService {

    private UserService userService;

    @Autowired
    public void setUserRepository(UserService userService) {
        this.userService = userService;
    }

    @Override
    public UserDetails loadUserByUsername(String username) {


        User user = userService.findByUserUsername(username);

        if (user == null) {
            throw new UsernameNotFoundException(username);
        } else if (user.getEnabled() == 0) {
            throw new DisabledException("Account disabled");
        }
        Set<GrantedAuthority> grantedAuthorities = new HashSet<>();
        for (Role role : user.getRoles()) {
            grantedAuthorities.add(new SimpleGrantedAuthority(role.getName()));
        }
        return new CurrentUser(user.getUsername(), user.getPassword(),
                grantedAuthorities, user);
    }
}
