package earth.praesideo.database.repositories.common;

import earth.praesideo.database.entities.common.RefConfigEmissionsTypeEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Collection;
import java.util.List;
@Repository
public interface RefConfigEmissionsTypeRepository extends JpaRepository<RefConfigEmissionsTypeEntity, Integer> {
    List<RefConfigEmissionsTypeEntity> findByEtypeIdAndEtypeattrId1 (Integer eTypeId,Integer eTypeattr1Id);
    RefConfigEmissionsTypeEntity findByEtypeIdAndEtypeattrId1AndEtypeattrId2
            (Integer eTypeId,Integer eTypeattr1Id, Integer eTypeattr2Id );
}