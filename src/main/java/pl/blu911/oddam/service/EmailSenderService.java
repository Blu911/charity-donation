package pl.blu911.oddam.service;

import pl.blu911.oddam.domain.User;
import pl.blu911.oddam.domain.ConfirmationToken;

public interface EmailSenderService {
    void sendActivationEmail(User user, ConfirmationToken confirmationToken);

    void sendResetPasswordEmail(User user, ConfirmationToken confirmationToken);
}
