package earth.praesideo.database.repositories.users;

import earth.praesideo.database.entities.users.CompanyCategoryEntity;
import org.springframework.data.jpa.repository.JpaRepository;

public interface CompanyCategoryRepository extends JpaRepository<CompanyCategoryEntity, Integer> {
}
