package earth.praesideo.services.impactperformance

import earth.praesideo.database.entities.impactperformance.ImpactTemperatureAlignment
import earth.praesideo.database.entities.impactperformance.ImpactTemperatureAlignmentKey
import earth.praesideo.database.entities.impactperformance.TemperatureAlignmentRecordType
import earth.praesideo.database.entities.impactperformance.TemperatureAlignmentScore
import earth.praesideo.database.repositories.impactperformance.ImpactTemperatureAlignmentRepository
import earth.praesideo.exceptions.TemperatureAlignmentNotFoundException
import earth.praesideo.models.restapi.impactperformance.GranularityLevel
import earth.praesideo.models.restapi.impactperformance.PerformancePillar
import earth.praesideo.models.restapi.impactperformance.PerformanceType
import earth.praesideo.services.ImpactTemperatureAlignmentService
import org.junit.jupiter.api.Test
import org.junit.jupiter.api.extension.ExtendWith
import org.mockito.InjectMocks
import org.mockito.Mock
import org.mockito.junit.jupiter.MockitoExtension

import static org.junit.jupiter.api.Assertions.assertEquals
import static org.junit.jupiter.api.Assertions.assertFalse
import static org.junit.jupiter.api.Assertions.assertNotNull
import static org.junit.jupiter.api.Assertions.assertThrows
import static org.mockito.Mockito.when

@ExtendWith(MockitoExtension.class)
class ImpactTemperatureAlignmentServiceTest {

    @Mock
    private ImpactTemperatureAlignmentRepository impactTemperatureAlignmentRepository

    @InjectMocks
    private ImpactTemperatureAlignmentService service

    @Test
    void getImpactPerformanceYears_whenDataExist() {
        def year = 2021
        def companyId = 1
        def recordType = TemperatureAlignmentRecordType.TEMPERATURE_ALIGNMENT

        when(impactTemperatureAlignmentRepository
                .findYears(companyId, recordType, false, false))
                .thenReturn(Arrays.asList(year))

        def result = service.getImpactPerformanceYears(
                companyId,
                recordType,
                false,
                false
        )

        assertNotNull result
        assertEquals 1, result.size()
    }

    @Test
    void getImpactPerformance_TemperatureAlignment_whenDataExist() throws
            TemperatureAlignmentNotFoundException {
        def year = 2021
        def companyId = 1
        def recordType = TemperatureAlignmentRecordType.TEMPERATURE_ALIGNMENT
        def overall = 3.20

        when(impactTemperatureAlignmentRepository
                .findByKeyOrganisationCompanyIdAndKeyYearAndKeyRecordTypeAndKeyIsScenarioAndKeyIsSupplyChainAggregated(companyId, year, recordType, false, false))
                .thenReturn(Optional.of(new ImpactTemperatureAlignment()
                        .setTemperatureAlignmentScore(new TemperatureAlignmentScore()
                                .setOverall(overall)
                        )))

        def result = service.getImpactPerformance(
                companyId,
                year,
                recordType,
                false,
                false
        )

        assertNotNull result
        assertEquals 3, result.getImpactPerformance().size()
        assertEquals 4, result.getTransitionPathway().size()
    }

    @Test
    void getImpactPerformance_whenDataNotExist() {
        def year = 2021
        def companyId = 1
        def recordType = TemperatureAlignmentRecordType.TEMPERATURE_ALIGNMENT

        when(impactTemperatureAlignmentRepository.findByKeyOrganisationCompanyIdAndKeyYearAndKeyRecordTypeAndKeyIsScenarioAndKeyIsSupplyChainAggregated(companyId, year, recordType, false, false))
                .thenReturn(Optional.empty())

        assertThrows(TemperatureAlignmentNotFoundException.class, () -> service.getImpactPerformance(
                PerformanceType.TEMPERATURE_ALIGNMENT,
                PerformancePillar.OVERALL_SCORE,
                GranularityLevel.OVERALL,
                companyId,
                year,
                recordType,
                false,
                false
        ))
    }

    @Test
    void getImpactPerformance_TemperatureAlignment_OverallScore_whenDataExist() throws
            TemperatureAlignmentNotFoundException {
        def year = 2021
        def companyId = 1
        def performanceType = PerformanceType.TEMPERATURE_ALIGNMENT
        def recordType = TemperatureAlignmentRecordType.TEMPERATURE_ALIGNMENT
        def pillar = PerformancePillar.OVERALL_SCORE
        def overall = 3.20

        when(impactTemperatureAlignmentRepository
                .findByKeyOrganisationCompanyIdAndKeyYearAndKeyRecordTypeAndKeyIsScenarioAndKeyIsSupplyChainAggregated(companyId, year, recordType, false, false))
                .thenReturn(Optional.of(new ImpactTemperatureAlignment()
                        .setTemperatureAlignmentScore(new TemperatureAlignmentScore()
                                .setOverall(overall)
                        )
                        .setKey(new ImpactTemperatureAlignmentKey().setYear(year))
                ))

        def result = service.getImpactPerformance(
                performanceType,
                pillar,
                GranularityLevel.OVERALL,
                companyId,
                year,
                recordType,
                false,
                false
        )

        assertNotNull result
        assertEquals year, result.getStartYear()
        assertEquals performanceType, result.getPerformanceType()
        assertEquals pillar, result.getPerformancePillar()
        assertEquals overall, result.getPerformanceValue()
    }

    @Test
    void getTransitionPathway_whenDataExist() throws TemperatureAlignmentNotFoundException {
        def year = 2021
        def companyId = 1
        def recordType = TemperatureAlignmentRecordType.TEMPERATURE_ALIGNMENT

        when(impactTemperatureAlignmentRepository
                .findByKeyOrganisationCompanyIdAndKeyYearAndKeyRecordTypeAndKeyIsScenarioAndKeyIsSupplyChainAggregated(companyId, year, recordType, false, false))
                .thenReturn(Optional.of(new ImpactTemperatureAlignment()))

        def result = service.getTransitionPathway(
                companyId,
                year,
                recordType,
                false,
                false
        )

        assertNotNull result
        assertFalse result.isEmpty()
        assertEquals 4, result.size()
    }
}
