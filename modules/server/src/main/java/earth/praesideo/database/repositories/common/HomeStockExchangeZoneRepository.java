package earth.praesideo.database.repositories.common;

import earth.praesideo.database.entities.common.HomeStockExchangeZoneEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface HomeStockExchangeZoneRepository extends JpaRepository<HomeStockExchangeZoneEntity, Integer> {
}
