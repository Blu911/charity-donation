package pl.blu911.oddam.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import pl.blu911.oddam.registration.ConfirmationToken;

public interface ConfirmationTokenRepository extends JpaRepository<ConfirmationToken, String> {
    ConfirmationToken findByConfirmationToken(String confirmationToken);
}
