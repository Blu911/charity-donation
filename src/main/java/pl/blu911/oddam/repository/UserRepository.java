package pl.blu911.oddam.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import org.springframework.stereotype.Repository;
import pl.blu911.oddam.domain.User;

import java.util.List;

@Repository
public interface UserRepository extends JpaRepository<User, Long> {
    User findByUsername(String username);

    List<User> findAllByRolesNameOrderByCreatedDesc(String name);

    User findByEmail(String email);

    Integer countAllByRolesName(String name);
}
