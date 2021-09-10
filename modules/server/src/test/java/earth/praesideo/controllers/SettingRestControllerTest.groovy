package earth.praesideo.controllers

import earth.praesideo.controllers.permission.SettingRestController
import earth.praesideo.database.entities.users.PermissionEntity
import earth.praesideo.database.repositories.users.PermissionRepository
import earth.praesideo.models.restapi.permission.PermissionModel
import earth.praesideo.services.PermissionService
import earth.praesideo.utils.PermissionEnum
import org.junit.jupiter.api.Test
import org.junit.jupiter.api.extension.ExtendWith
import org.mockito.InjectMocks
import org.mockito.Mock
import org.mockito.junit.jupiter.MockitoExtension
import org.mockito.junit.jupiter.MockitoSettings
import org.mockito.quality.Strictness

import static org.junit.jupiter.api.Assertions.assertEquals
import static org.junit.jupiter.api.Assertions.assertNotNull
import static org.mockito.Mockito.times
import static org.mockito.Mockito.verify
import static org.mockito.Mockito.when

/**
 * @author Koshman Vadim
 */
@ExtendWith(MockitoExtension.class)
@MockitoSettings(strictness = Strictness.LENIENT)
class SettingRestControllerTest {

    @Mock
    private PermissionService permissionService
    @Mock
    private PermissionRepository permissionRepository;

    @InjectMocks
    private SettingRestController controller

    @Test
    void getUsersWithPermissions_shouldReturnResult() throws Exception {
        def companyId = 1
        List<PermissionModel> permissionModelList = new ArrayList<>();
        PermissionModel model = new PermissionModel()
        model.setCompanyId(companyId)
        model.setUsername("test@test.com")
        model.setEnabled(true)
        model.setPermission(PermissionEnum.EDITOR.name())
        permissionModelList.add(model)
        when(permissionService.getUsersWithPermissions(companyId)
        ).thenReturn(Arrays.asList(model))

        List<PermissionModel> result = controller.getUsersWithPermissions(companyId)

        assertNotNull result
        assertEquals 1, result.size()
    }

    @Test
    void changeUserPermission() throws Exception{
        PermissionModel model = new PermissionModel()
        model.setCompanyId(1)
        model.setUsername("test@test.com")
        model.setEnabled(true)
        model.setPermission(PermissionEnum.EDITOR.name())

        PermissionEntity permissionEntity = new PermissionEntity()
        permissionEntity.setPermission("EDITOR")
        when(permissionRepository.findByUsername("username"))
                .thenReturn(Optional.of(permissionEntity))

        controller.changeUserPermission(model)

        verify(permissionService, times(1)).changeUserPermission(model)
    }
}
