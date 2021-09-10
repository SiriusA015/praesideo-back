package earth.praesideo.services.targetsscenario

import earth.praesideo.database.entities.datasets.DataSetEmissionsReductionEntity
import earth.praesideo.database.entities.datasets.DataSetEmissionsReductionTargetsEntity
import earth.praesideo.database.repositories.datasets.DataSetEmissionsReductionRepository
import earth.praesideo.database.repositories.targetsscenario.DataEmissionsReductionTargetsScenarioRepository
import earth.praesideo.models.restapi.datasets.DataSetEmissionsReductionModel
import earth.praesideo.models.security.CustomUserDetailsModel
import earth.praesideo.services.TargetsScenarioService
import earth.praesideo.services.UsersService
import org.junit.jupiter.api.Test
import org.junit.jupiter.api.extension.ExtendWith
import org.mockito.InjectMocks
import org.mockito.Mock
import org.mockito.junit.jupiter.MockitoExtension

import static org.junit.jupiter.api.Assertions.assertEquals
import static org.junit.jupiter.api.Assertions.assertNotNull
import static org.mockito.Mockito.when

@ExtendWith(MockitoExtension.class)
class TargetsScenarioServiceTest {

    @Mock
    private DataSetEmissionsReductionRepository dataSetEmissionsReductionRepository
    @Mock
    private DataEmissionsReductionTargetsScenarioRepository targetsScenarioRepository
    @Mock
    private UsersService usersService

    @InjectMocks
    private TargetsScenarioService service

    @Test
    void getEmissionsReduction() {
        def userId = 1
        def model = Optional.of(new CustomUserDetailsModel(userId, 0, "", "test", "", [], true))

        when(dataSetEmissionsReductionRepository.findFirstByUserDataSetUserIdOrderByUserDataSetInsertedDateDesc(userId))
                .thenReturn(new DataSetEmissionsReductionEntity(emissionsReductionTargets: [new DataSetEmissionsReductionTargetsEntity()]))

        def result = service.getEmissionsReduction(model)
        assertNotNull result
        assertNotNull result.getEmissionsReduction()
        assertNotNull result.getEmissionsReduction().getEmissionsReductionTargets()
    }

    @Test
    void saveEmissionsReduction() {
        def userId = 1
        def model = Optional.of(new CustomUserDetailsModel(userId, 0, "", "test", "", [], true))
        def reduction = new DataSetEmissionsReductionEntity(emissionsReductionTargets: [new DataSetEmissionsReductionTargetsEntity()])
        def data = new DataSetEmissionsReductionModel()
        data.setEmissionsReduction(new DataSetEmissionsReductionEntity())

        when(dataSetEmissionsReductionRepository.findFirstByUserDataSetUserIdOrderByUserDataSetInsertedDateDesc(userId))
                .thenReturn(reduction)
        when(dataSetEmissionsReductionRepository.save(data.getEmissionsReduction())).thenReturn(reduction)

        def result = service.saveEmissionsReduction(model, data)
        assertNotNull result
        assertNotNull result.getEmissionsReduction()
        assertEquals reduction, result.getEmissionsReduction()
    }
}
