package pl.blu911.oddam.domain;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.User;

import java.util.Collection;

public class CurrentUser extends User {
    private final pl.blu911.oddam.domain.User user;

    public CurrentUser(String email, String password, Collection<?
            extends GrantedAuthority> authorities,
                       pl.blu911.oddam.domain.User user) {
        super(email, password, authorities);
        this.user = user;
    }

    public pl.blu911.oddam.domain.User getUser() {
        return user;
    }
}

