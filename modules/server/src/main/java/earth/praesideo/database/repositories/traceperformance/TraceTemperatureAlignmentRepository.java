package earth.praesideo.database.repositories.traceperformance;

import earth.praesideo.database.entities.impactperformance.ImpactTemperatureAlignment;
import earth.praesideo.models.restapi.traceperformance.ScoreChainNumbers;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface TraceTemperatureAlignmentRepository extends JpaRepository<ImpactTemperatureAlignment, Long> {
}
