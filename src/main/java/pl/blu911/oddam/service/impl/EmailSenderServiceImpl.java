package pl.blu911.oddam.service.impl;

import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;
import pl.blu911.oddam.domain.User;
import pl.blu911.oddam.registration.ConfirmationToken;
import pl.blu911.oddam.service.EmailSenderService;

@Service
public class EmailSenderServiceImpl implements EmailSenderService {
    private final JavaMailSender javaMailSender;

    public EmailSenderServiceImpl(JavaMailSender javaMailSender) {
        this.javaMailSender = javaMailSender;
    }

    @Override
    public void sendEmail(User user, ConfirmationToken confirmationToken) {
        SimpleMailMessage mailMessage = new SimpleMailMessage();
        mailMessage.setTo(user.getEmail());
        mailMessage.setSubject("Aktywuj konto!");
        mailMessage.setText("Aby aktywować swoje konto, kliknij tutaj: "
                + "http://localhost:8080/register/confirm-account?token=" + confirmationToken.getConfirmationToken());
        javaMailSender.send(mailMessage);
    }
}
