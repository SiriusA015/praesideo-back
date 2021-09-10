package earth.praesideo.controllers

import earth.praesideo.controllers.targets.TargetsScenarioController
import earth.praesideo.models.restapi.datasets.DataSetEmissionsReductionModel
import earth.praesideo.models.security.CustomUserDetailsModel
import earth.praesideo.services.TargetsScenarioService
import org.junit.jupiter.api.Test
import org.junit.jupiter.api.extension.ExtendWith
import org.mockito.InjectMocks
import org.mockito.Mock
import org.mockito.Spy
import org.mockito.junit.jupiter.MockitoExtension
import org.mockito.junit.jupiter.MockitoSettings
import org.mockito.quality.Strictness
import org.springframework.http.HttpStatus

import static org.junit.jupiter.api.Assertions.assertEquals
import static org.junit.jupiter.api.Assertions.assertNotNull
import static org.mockito.Mockito.doReturn
import static org.mockito.Mockito.when

@ExtendWith(MockitoExtension.class)
@MockitoSettings(strictness = Strictness.LENIENT)
class TargetsScenarioControllerTest {

    @Mock
    private TargetsScenarioService service

    @Spy
    @InjectMocks
    private TargetsScenarioController controller

    @Test
    void getEmissionsReductionTarget() {
        def userModel = new CustomUserDetailsModel(1, 0, "", "test", "", [], true)
        def reduction = new DataSetEmissionsReductionModel()
        doReturn(Optional.of(userModel)).when(controller).getLoggedInUser()
        when(service.getEmissionsReduction(userModel)).thenReturn(reduction)

        def result = controller.getEmissionsReductionTarget()
        assertNotNull result
        assertEquals HttpStatus.OK, result.getStatusCode()
    }

    @Test
    void saveEmissionsReductionTarget() {
        def userModel = new CustomUserDetailsModel(1, 0, "", "test", "", [], true)
        def reduction = new DataSetEmissionsReductionModel()
        doReturn(Optional.of(userModel)).when(controller).getLoggedInUser()
        when(service.saveEmissionsReduction(userModel, reduction)).thenReturn(reduction)

        def result = controller.saveEmissionsReductionTarget(reduction)
        assertNotNull result
        assertEquals HttpStatus.OK, result.getStatusCode()
    }
}
