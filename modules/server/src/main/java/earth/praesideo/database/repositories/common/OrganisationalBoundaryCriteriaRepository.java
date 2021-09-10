package earth.praesideo.database.repositories.common;

import earth.praesideo.database.entities.common.OrganisationalBoundaryCriteriaEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;


@Repository
public interface OrganisationalBoundaryCriteriaRepository extends JpaRepository<OrganisationalBoundaryCriteriaEntity, Integer> {
    List<OrganisationalBoundaryCriteriaEntity> findByOrganisationalBoundary_OrganisationalBoundaryId(Integer organisationalBoundaryId);
}
