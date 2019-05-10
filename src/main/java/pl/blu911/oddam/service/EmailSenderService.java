package pl.blu911.oddam.service;

import pl.blu911.oddam.domain.User;
import pl.blu911.oddam.registration.ConfirmationToken;

public interface EmailSenderService {
    void sendEmail(User user, ConfirmationToken confirmationToken);
}
