package pl.blu911.oddam.service;

import pl.blu911.oddam.domain.ConfirmationToken;
import pl.blu911.oddam.domain.User;

public interface ConfirmationTokenService {
    ConfirmationToken findByConfirmationToken(String ConfirmationToken);

    ConfirmationToken generateToken(User user);

    void saveToken(ConfirmationToken token);
}
