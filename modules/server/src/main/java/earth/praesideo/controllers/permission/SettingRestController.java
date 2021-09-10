package earth.praesideo.controllers.permission;

import earth.praesideo.controllers.BaseController;
import earth.praesideo.models.restapi.permission.PermissionModel;
import earth.praesideo.models.restapi.permission.RestorePasswordModel;
import earth.praesideo.services.PermissionService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import java.util.*;


/**
 * @author Koshman Vadim
 */
@RestController
@RequestMapping("/api/settings/permission")
public class SettingRestController extends BaseController {

    private static final Logger LOGGER = LoggerFactory.getLogger(SettingRestController.class);
    private final PermissionService permissionService;

    public SettingRestController(PermissionService permissionService) {
        LOGGER.info(this.getClass().getSimpleName() + " created.");
        this.permissionService = permissionService;
    }

    @ResponseStatus(HttpStatus.OK)
    @GetMapping("/users-permission")
    public List<PermissionModel> getUsersWithPermissions(@RequestParam Integer companyId) {
        return permissionService.getUsersWithPermissions(companyId);
    }

    @ResponseStatus(HttpStatus.OK)
    @PostMapping("/change-user-permission")
    public void changeUserPermission(@RequestBody PermissionModel permissionModel) {
        permissionService.changeUserPermission(permissionModel);
    }

    @ResponseStatus(HttpStatus.OK)
    @PostMapping("/change-user-status")
    public void changeUserStatus(@RequestParam String username, @RequestParam Boolean enabled) {
        permissionService.changeUserStatus(username, enabled);
    }

    @ResponseStatus(HttpStatus.OK)
    @PostMapping("/reset-password")
    public void resetPassword(@RequestBody RestorePasswordModel restorePasswordModel, BindingResult bindingResult) {
        permissionService.restorePassword(restorePasswordModel.getNewPassword(), restorePasswordModel.getConfirmPassword(), restorePasswordModel.getEmail());
    }
}
