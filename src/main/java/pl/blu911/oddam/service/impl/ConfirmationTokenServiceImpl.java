package pl.blu911.oddam.service.impl;

import org.springframework.stereotype.Service;
import pl.blu911.oddam.registration.ConfirmationToken;
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
}
