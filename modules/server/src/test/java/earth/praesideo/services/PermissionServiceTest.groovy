package earth.praesideo.services

import earth.praesideo.database.entities.users.PermissionEntity
import earth.praesideo.database.entities.users.UserEntity
import earth.praesideo.database.repositories.users.PermissionRepository
import earth.praesideo.database.repositories.users.UserRepository
import earth.praesideo.models.restapi.permission.PermissionModel
import earth.praesideo.utils.PermissionEnum
import org.junit.jupiter.api.Test
import org.junit.jupiter.api.extension.ExtendWith
import org.mockito.InjectMocks
import org.mockito.Mock
import org.mockito.junit.jupiter.MockitoExtension


import static org.mockito.ArgumentMatchers.any
import static org.mockito.Mockito.times
import static org.mockito.Mockito.verify
import static org.mockito.Mockito.when


/**
 * @author Koshman Vadim
 */
@ExtendWith(MockitoExtension.class)
class PermissionServiceTest {
    @InjectMocks
    private PermissionService permissionService
    @Mock
    private PermissionRepository permissionRepository;

    @Mock
    private UserRepository userRepository;

    @Test
    void changeUserStatus() throws Exception {
        when(userRepository.findByUsername("username")).thenReturn(new UserEntity())
        permissionService.changeUserStatus("username", true)
        verify(userRepository).findByUsername("username")
        verify(userRepository).save(any(UserEntity))
    }

    @Test
    void changeUserPermission_editor() throws Exception{
        PermissionModel model = new PermissionModel()
        model.setCompanyId(1)
        model.setUsername("test@test.com")
        model.setEnabled(true)
        model.setPermission(PermissionEnum.EDITOR.name())

        PermissionEntity permissionEntity = new PermissionEntity()
        permissionEntity.setPermission("EDITOR")

        when(permissionRepository.findByUsername(model.getUsername()))
                .thenReturn(Optional.of(permissionEntity))

        permissionService.changeUserPermission(model)

        verify(permissionRepository, times(1)).findByUsername(model.getUsername())
    }

    @Test
    void changeUserPermission_viewer() throws Exception{
        PermissionModel model = new PermissionModel()
        model.setCompanyId(1)
        model.setUsername("test@test.com")
        model.setEnabled(true)
        model.setPermission(PermissionEnum.EDITOR.name())

        PermissionEntity permissionEntity = new PermissionEntity()
        permissionEntity.setPermission("VIEWER")

        when(permissionRepository.findByUsername(model.getUsername()))
                .thenReturn(Optional.of(permissionEntity))

        permissionService.changeUserPermission(model)
        permissionService.delete(model.getUsername())

        verify(permissionRepository, times(1)).deleteByUsername(model.getUsername())
    }
}
