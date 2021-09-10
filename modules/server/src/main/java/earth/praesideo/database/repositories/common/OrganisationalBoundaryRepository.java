package earth.praesideo.database.repositories.common;

import earth.praesideo.database.entities.common.OrganisationalBoundaryEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface OrganisationalBoundaryRepository extends JpaRepository<OrganisationalBoundaryEntity, Integer> {
}
