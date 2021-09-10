package earth.praesideo.database.repositories.common;

import earth.praesideo.database.entities.common.CustomerTypeEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface CustomerTypeRepository extends JpaRepository<CustomerTypeEntity, Integer> {

}
