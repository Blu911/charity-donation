package pl.blu911.oddam.service;

import org.springframework.mail.SimpleMailMessage;

public interface EmailSenderService {
    void sendEmail(SimpleMailMessage email);
}
