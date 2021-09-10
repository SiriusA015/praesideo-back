package earth.praesideo.database.repositories.impactperformance;

import earth.praesideo.database.entities.impactperformance.ImpactTemperatureAlignment;

import earth.praesideo.database.entities.impactperformance.TemperatureAlignmentRecordType;
import earth.praesideo.models.restapi.traceperformance.ScoreChainNumbers;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface ImpactTemperatureAlignmentRepository extends JpaRepository<ImpactTemperatureAlignment, Long> {

    Optional<ImpactTemperatureAlignment> findByKeyOrganisationCompanyIdAndKeyYearAndKeyRecordTypeAndKeyIsScenarioAndKeyIsSupplyChainAggregated(Integer organisationId, Integer year, TemperatureAlignmentRecordType recordType, Boolean scenario, Boolean isSupplychainAggregated);

    Optional<ImpactTemperatureAlignment> findFirstByKeyOrganisationCompanyIdAndKeyRecordTypeAndKeyIsScenarioAndKeyIsSupplyChainAggregatedOrderByKeyYearDesc(Integer organisationId, TemperatureAlignmentRecordType recordType, Boolean scenario, Boolean isSupplychainAggregated);

    @Query("select distinct ita.key.year from ImpactTemperatureAlignment ita"
            + " where ita.key.organisation.companyId = :organisationId" +
            " and ita.key.recordType = :recordType and ita.key.isScenario = :scenario and ita.key.isSupplyChainAggregated = :supplyChainAggregated"
            + " order by ita.key.year asc")
    List<Integer> findYears(@Param("organisationId") Integer organisationId,
                            @Param("recordType") TemperatureAlignmentRecordType recordType,
                            @Param("scenario") Boolean scenario,
                            @Param("supplyChainAggregated") Boolean isSupplyChainAggregated
    );

    List<ImpactTemperatureAlignment> findByKeyOrganisationCompanyIdAndKeyYearAndKeyIsScenario(Integer companyId, Integer year, boolean isScenario);
}
