package pl.blu911.oddam.service.impl;

import org.springframework.stereotype.Service;
import pl.blu911.oddam.domain.User;
import pl.blu911.oddam.domain.ConfirmationToken;
import pl.blu911.oddam.repository.ConfirmationTokenRepository;
import pl.blu911.oddam.service.ConfirmationTokenService;

@Service
public class ConfirmationTokenServiceImpl implements ConfirmationTokenService {
    private final ConfirmationTokenRepository confirmationTokenRepository;

    public ConfirmationTokenServiceImpl(ConfirmationTokenRepository confirmationTokenRepository) {
        this.confirmationTokenRepository = confirmationTokenRepository;
    }

    @Override
    public ConfirmationToken findByConfirmationToken(String confirmationToken) {
        return confirmationTokenRepository.findByConfirmationToken(confirmationToken);
    }

    public ConfirmationToken generateToken(User user) {
        return new ConfirmationToken(user);
    }

    public void saveToken(ConfirmationToken token) {
        confirmationTokenRepository.save(token);
    }
}
