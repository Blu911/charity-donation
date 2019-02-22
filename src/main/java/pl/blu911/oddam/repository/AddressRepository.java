package pl.blu911.oddam.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import pl.blu911.oddam.domain.Address;

@Repository
public interface AddressRepository extends JpaRepository<Address, Long> {

}
