package earth.praesideo.services

import earth.praesideo.database.entities.datasets.DataSetClimateMechanismsInfluenceEntity
import earth.praesideo.database.entities.datasets.DataSetClimateMechanismsInfluenceMetricEntity
import earth.praesideo.database.repositories.datasets.DataSetClimateMechanismsInfluenceMetricRepository
import earth.praesideo.database.repositories.datasets.DataSetClimateMechanismsInfluenceRepository
import earth.praesideo.models.security.CustomUserDetailsModel
import org.junit.jupiter.api.Test
import org.junit.jupiter.api.extension.ExtendWith
import org.mockito.InjectMocks
import org.mockito.Mock
import org.mockito.junit.jupiter.MockitoExtension

import static org.mockito.Mockito.when

@ExtendWith(MockitoExtension.class)
class ClimateServiceTest {

    @Mock
    private DataSetClimateMechanismsInfluenceRepository dataSetClimateMechanismsInfluenceRepository

    @Mock
    private DataSetClimateMechanismsInfluenceMetricRepository dataSetClimateMechanismsInfluenceMetricRepository

    @Mock
    private UsersService usersService

    @InjectMocks
    private ClimateService climateService;

    @Test
    void calculatePercentage_shouldGetPercentage_whenDataExist() {
        def userId = 12
        def model = new CustomUserDetailsModel(userId, 0, "", "test", "", [], true)

        when(dataSetClimateMechanismsInfluenceRepository.findFirstByUserDataSetUserIdOrderByUserDataSetInsertedDateDesc(userId))
                .thenReturn(new DataSetClimateMechanismsInfluenceEntity(internalCarbonPriceUsed: true,
                        climateMechanismsInfluenceMetrics: [new DataSetClimateMechanismsInfluenceMetricEntity()]))

        def result = climateService.calculatePercentage(model)

        assert result.climateMetricsPercentageTotal == 5
        assert result.climateMetricsPercentageCompleted == 0
        assert result.climateMetricsMissingFields.size() == 5
        assert result.climateMetricsPercentage == 0
    }

    @Test
    void calculatePercentage_shouldGetPercentage_whenDataNotExist() {
        def userId = 12
        def model = new CustomUserDetailsModel(userId, 0, "", "test", "", [], true)

        when(dataSetClimateMechanismsInfluenceRepository.findFirstByUserDataSetUserIdOrderByUserDataSetInsertedDateDesc(userId))
                .thenReturn(null)

        def result = climateService.calculatePercentage(model)

        assert result.climateMetricsPercentageTotal == 1
        assert result.climateMetricsPercentageCompleted == 0
        assert result.climateMetricsMissingFields.size() == 1
        assert result.climateMetricsPercentage == 0
    }

}
