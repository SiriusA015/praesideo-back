package earth.praesideo.database.repositories.common;

import earth.praesideo.database.entities.common.CarbonCompensationTypeEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface CarbonCompensationTypeRepository extends JpaRepository<CarbonCompensationTypeEntity, Integer> {
    List<CarbonCompensationTypeEntity> findByCarbonCreditCategory_CarbonCreditCategoryId(Integer carbonCreditCategoryId);
}
