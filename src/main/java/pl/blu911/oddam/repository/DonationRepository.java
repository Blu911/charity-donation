package pl.blu911.oddam.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import pl.blu911.oddam.domain.Donation;

@Repository
public interface DonationRepository extends JpaRepository<Donation, Long> {

}
