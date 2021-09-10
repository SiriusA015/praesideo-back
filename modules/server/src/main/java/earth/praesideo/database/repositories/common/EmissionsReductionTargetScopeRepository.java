package earth.praesideo.database.repositories.common;

import earth.praesideo.database.entities.common.EmissionsReductionTargetScopeEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface EmissionsReductionTargetScopeRepository extends JpaRepository<EmissionsReductionTargetScopeEntity, Integer> {

}
