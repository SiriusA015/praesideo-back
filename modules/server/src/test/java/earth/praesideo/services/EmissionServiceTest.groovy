package earth.praesideo.services

import earth.praesideo.database.entities.datasets.DataSetEmissionsReductionEntity
import earth.praesideo.database.entities.datasets.DataSetEmissionsReductionShortTermEntity
import earth.praesideo.database.entities.datasets.DataSetEmissionsReductionTargetsEntity
import earth.praesideo.database.repositories.common.YearRepresentationRepository
import earth.praesideo.database.repositories.datasets.DataSetEmissionsReductionRepository
import earth.praesideo.database.repositories.datasets.DataSetEmissionsReductionTargetsRepository
import earth.praesideo.models.security.CustomUserDetailsModel
import org.junit.jupiter.api.Test
import org.junit.jupiter.api.extension.ExtendWith
import org.mockito.InjectMocks
import org.mockito.Mock
import org.mockito.junit.jupiter.MockitoExtension

import static org.mockito.Mockito.when

@ExtendWith(MockitoExtension.class)
class EmissionServiceTest {

    @Mock
    private YearRepresentationRepository yearRepresentationRepository

    @Mock
    private DataSetEmissionsReductionRepository dataSetEmissionsReductionRepository

    @Mock
    private DataSetEmissionsReductionTargetsRepository dataSetEmissionsReductionTargetsRepository

    @Mock
    private UsersService usersService

    @InjectMocks
    private EmissionService emissionService

    @Test
    void calculatePercentage_shouldGetPercentage_whenDataExist() {
        def userId = 12
        def model = new CustomUserDetailsModel(userId, 0, "", "test", "", [], true)

        when(dataSetEmissionsReductionRepository.findFirstByUserDataSetUserIdOrderByUserDataSetInsertedDateDesc(userId))
                .thenReturn(new DataSetEmissionsReductionEntity())

        def result = emissionService.calculatePercentage(model)

        assert result.ghgTargetSettingPercentageTotal == 5
        assert result.ghgTargetSettingPercentageCompleted == 0
        assert result.ghgTargetSettingMissingFields.size() == 5
        assert result.ghgTargetSettingPercentage == 0
    }

    @Test
    void calculatePercentage_shouldGetPercentage_whenDataNotExist() {
        def userId = 12
        def model = new CustomUserDetailsModel(userId, 0, "", "test", "", [], true)

        when(dataSetEmissionsReductionRepository.findFirstByUserDataSetUserIdOrderByUserDataSetInsertedDateDesc(userId))
                .thenReturn(null)

        def result = emissionService.calculatePercentage(model)

        assert result.ghgTargetSettingPercentageTotal == 5
        assert result.ghgTargetSettingPercentageCompleted == 0
        assert result.ghgTargetSettingMissingFields.size() == 5
        assert result.ghgTargetSettingPercentage == 0
    }

    @Test
    void calculatePercentage_shouldGetPercentage_whenIsNotEmissionsReductionPresent() {
        def userId = 12
        def model = new CustomUserDetailsModel(userId, 0, "", "test", "", [], true)

        when(dataSetEmissionsReductionRepository.findFirstByUserDataSetUserIdOrderByUserDataSetInsertedDateDesc(userId))
                .thenReturn(new DataSetEmissionsReductionEntity(isEmissionsReductionPresent: false))

        def result = emissionService.calculatePercentage(model)

        assert result.ghgTargetSettingPercentageTotal == 5
        assert result.ghgTargetSettingPercentageCompleted == 5
        assert result.ghgTargetSettingMissingFields.size() == 0
        assert result.ghgTargetSettingPercentage == 100
    }

    @Test
    void calculatePercentage_shouldGetPercentage_whenIsFinancialYear() {
        def userId = 12
        def model = new CustomUserDetailsModel(userId, 0, "", "test", "", [], true)

        when(dataSetEmissionsReductionRepository.findFirstByUserDataSetUserIdOrderByUserDataSetInsertedDateDesc(userId))
                .thenReturn(new DataSetEmissionsReductionEntity(isFinancialYear: true))

        def result = emissionService.calculatePercentage(model)

        assert result.ghgTargetSettingPercentageTotal == 6
        assert result.ghgTargetSettingPercentageCompleted == 1
        assert result.ghgTargetSettingMissingFields.size() == 5
        assert result.ghgTargetSettingPercentage == 17
    }

    @Test
    void calculatePercentage_shouldGetPercentage_whenEmissionsReductionTargetsIsPresent() {
        def userId = 12
        def model = new CustomUserDetailsModel(userId, 0, "", "test", "", [], true)

        when(dataSetEmissionsReductionRepository.findFirstByUserDataSetUserIdOrderByUserDataSetInsertedDateDesc(userId))
                .thenReturn(new DataSetEmissionsReductionEntity(emissionsReductionTargets: [new DataSetEmissionsReductionTargetsEntity()],
                        emissionsReductionShortTerms: [new DataSetEmissionsReductionShortTermEntity()]))

        def result = emissionService.calculatePercentage(model)

        assert result.ghgTargetSettingPercentageTotal == 13
        assert result.ghgTargetSettingPercentageCompleted == 0
        assert result.ghgTargetSettingMissingFields.size() == 13
        assert result.ghgTargetSettingPercentage == 0
    }

}
