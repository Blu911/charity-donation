package pl.blu911.oddam.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import pl.blu911.oddam.domain.Category;


@Repository
public interface CategoryRepository extends JpaRepository<Category, Long> {

}
