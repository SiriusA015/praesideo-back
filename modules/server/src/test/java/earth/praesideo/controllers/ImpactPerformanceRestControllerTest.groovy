package earth.praesideo.controllers

import earth.praesideo.controllers.impactperformance.ImpactPerformanceRestController
import earth.praesideo.database.entities.impactperformance.TemperatureAlignmentRecordType
import earth.praesideo.models.restapi.impactperformance.GranularityLevel
import earth.praesideo.models.restapi.impactperformance.TemperatureAlignmentDto
import earth.praesideo.models.restapi.impactperformance.ImpactPerformanceDto
import earth.praesideo.models.restapi.impactperformance.PerformancePillar
import earth.praesideo.models.restapi.impactperformance.PerformanceType
import earth.praesideo.models.restapi.impactperformance.TransitionPathwayDto
import earth.praesideo.models.security.CustomUserDetailsModel
import earth.praesideo.services.ImpactTemperatureAlignmentService
import org.junit.jupiter.api.Test
import org.junit.jupiter.api.extension.ExtendWith
import org.mockito.InjectMocks
import org.mockito.Mock
import org.mockito.Spy
import org.mockito.junit.jupiter.MockitoExtension
import org.mockito.junit.jupiter.MockitoSettings
import org.mockito.quality.Strictness

import static org.junit.jupiter.api.Assertions.assertEquals
import static org.junit.jupiter.api.Assertions.assertFalse
import static org.junit.jupiter.api.Assertions.assertNotNull
import static org.mockito.Mockito.doReturn
import static org.mockito.Mockito.when

@ExtendWith(MockitoExtension.class)
@MockitoSettings(strictness = Strictness.LENIENT)
class ImpactPerformanceRestControllerTest {

    @Mock
    private ImpactTemperatureAlignmentService impactTemperatureAlignmentService

    @Spy
    @InjectMocks
    private ImpactPerformanceRestController controller

    @Test
    void getYears_shouldReturnResult() throws Exception {
        def companyId = 1
        def recordType = TemperatureAlignmentRecordType.TEMPERATURE_ALIGNMENT
        def userModel = new CustomUserDetailsModel(1, 0, "", "test", "", [], true)

        doReturn(Optional.of(userModel)).when(controller).getLoggedInUser()
        when(impactTemperatureAlignmentService.getImpactPerformanceYears(
                companyId,
                recordType,
                false,
                false)
        ).thenReturn(Arrays.asList(2020, 2021, 2022))

        def result = controller.getYears(Optional.of(companyId), false, false, false)
        assertNotNull result
        assertFalse result.isEmpty()
    }

    @Test
    void getTemperatureAlignment_shouldReturnResult() throws Exception {
        def year = 2021
        def companyId = 1
        def recordType = TemperatureAlignmentRecordType.TEMPERATURE_ALIGNMENT
        def userModel = new CustomUserDetailsModel(1, 0, "", "test", "", [], true)

        doReturn(Optional.of(userModel)).when(controller).getLoggedInUser()
        when(impactTemperatureAlignmentService.getImpactPerformance(
                companyId,
                year,
                recordType,
                false,
                false
            )
        ).thenReturn(
                new TemperatureAlignmentDto()
                        .setImpactPerformance(Arrays.asList(new ImpactPerformanceDto()))
                        .setTransitionPathway(Arrays.asList(new TransitionPathwayDto()))
        )

        def result = controller.getTemperatureAlignment(Optional.of(companyId), Optional.of(year), false, false, false)
        assertNotNull result
        assertFalse result.getImpactPerformance().isEmpty()
        assertFalse result.getTransitionPathway().isEmpty()
    }

    @Test
    void getImpactPerformance_shouldReturnResult() throws Exception {
        def year = 2021
        def companyId = 1
        def performanceType = PerformanceType.TEMPERATURE_ALIGNMENT
        def recordType = TemperatureAlignmentRecordType.TEMPERATURE_ALIGNMENT
        def pillar = PerformancePillar.OVERALL_SCORE
        def userModel = new CustomUserDetailsModel(1, 0, "", "test", "", [], true)

        doReturn(Optional.of(userModel)).when(controller).getLoggedInUser()
        when(impactTemperatureAlignmentService.getImpactPerformance(
                performanceType,
                pillar,
                GranularityLevel.OVERALL,
                companyId,
                year,
                recordType,
                false,
                false
            )
        ).thenReturn(new ImpactPerformanceDto()
                .setStartYear(year)
                .setPerformancePillar(pillar)
                .setPerformanceType(performanceType)
        )

        def result = controller.getImpactPerformance(performanceType, pillar, GranularityLevel.OVERALL, Optional.of(companyId), year, false, false, false)

        assertNotNull result
        assertEquals year, result.getStartYear()
        assertEquals performanceType, result.getPerformanceType()
        assertEquals pillar, result.getPerformancePillar()
    }

    @Test
    void getTransitionPathway_shouldReturnResult() throws Exception {
        def year = 2021
        def companyId = 1
        def recordType = TemperatureAlignmentRecordType.TEMPERATURE_ALIGNMENT

        when(impactTemperatureAlignmentService.getTransitionPathway(
                companyId,
                year,
                recordType,
                false,
                false
        )
        ).thenReturn(Arrays.asList(new TransitionPathwayDto()))

        def result = controller.getTransitionPathway(companyId, false, Optional.of(year), false, false)

        assertNotNull result
        assertEquals 1, result.size()
    }
}
