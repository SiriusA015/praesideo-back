package earth.praesideo.database.repositories.common;

import earth.praesideo.database.entities.common.BaseCurrencyEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface BaseCurrencyRepository extends JpaRepository<BaseCurrencyEntity, Integer> {
    List<BaseCurrencyEntity> findAllByOrderByCodeAsc();
    List<BaseCurrencyEntity> findAllByOrderByOrderingAsc();
}
