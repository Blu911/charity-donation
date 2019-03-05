package pl.blu911.oddam.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import pl.blu911.oddam.domain.Donation;

import java.util.List;

@Repository
public interface DonationRepository extends JpaRepository<Donation, Long> {
    @Query("select u from Donation u where u.institutionDetails.id = ?1")
    List<Donation> findAllByInstitutionDetailsId(long id);
}
