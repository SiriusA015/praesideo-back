package earth.praesideo.database.repositories.common;

import earth.praesideo.database.entities.common.IndustrySubSectorEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface IndustrySubSectorRepository extends JpaRepository<IndustrySubSectorEntity, Integer> {
    List<IndustrySubSectorEntity> findByIndustrySector_IndustrySectorId(Integer industrySectorId);
}
