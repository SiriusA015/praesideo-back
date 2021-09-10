package earth.praesideo.database.repositories.common;

import earth.praesideo.database.entities.common.HomeStockExchangeEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface HomeStockExchangeRepository extends JpaRepository<HomeStockExchangeEntity, Integer> {
}
