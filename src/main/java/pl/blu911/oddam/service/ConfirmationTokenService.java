package pl.blu911.oddam.service;

import pl.blu911.oddam.registration.ConfirmationToken;

public interface ConfirmationTokenService {
    ConfirmationToken findByConfirmationToken(String ConfirmationToken);
}
