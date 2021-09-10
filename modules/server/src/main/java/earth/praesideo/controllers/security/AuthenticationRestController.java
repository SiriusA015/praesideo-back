package earth.praesideo.controllers.security;

import earth.praesideo.controllers.BaseController;
import earth.praesideo.database.entities.users.UserEntity;
import earth.praesideo.models.restapi.BaseApiModel;
import earth.praesideo.models.restapi.EmailDto;
import earth.praesideo.models.restapi.NotificationDto;
import earth.praesideo.models.restapi.auth.*;
import earth.praesideo.models.restapi.general.DefaultSuccessApiModel;
import earth.praesideo.models.restapi.permission.RestorePasswordModel;
import earth.praesideo.services.AuthenticationService;
import earth.praesideo.services.CompanyService;
import earth.praesideo.services.UsersService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;

@RestController
@RequestMapping("/api/public")
public class AuthenticationRestController extends BaseController {
    private static final Logger LOGGER = LoggerFactory.getLogger(AuthenticationRestController.class);

    @Value("${links.restoration}")
    private String restorationLinks;

    private final UsersService usersService;
    private final CompanyService companyService;
    private final AuthenticationService authenticationService;

    public AuthenticationRestController(UsersService usersService,
                                        CompanyService companyService,
                                        AuthenticationService authenticationService) {
        LOGGER.info(this.getClass().getSimpleName() + " created.");
        this.usersService = usersService;
        this.companyService = companyService;
        this.authenticationService = authenticationService;
    }

    @PostMapping("/check-existing-domain/{email}")
    public ResponseEntity<BaseApiModel> checkExistingDomain(@PathVariable(name = "email") String email) {
        return ResponseEntity.ok(companyService.checkIfEmailDomainExists(email));
    }

    @PostMapping("/register")
    public ResponseEntity<BaseApiModel> register(@RequestBody @Valid RegisterRequestModel registerModel) {
        usersService.validateAndRegisterSupplierUser(registerModel);
        return ResponseEntity.ok().body(new DefaultSuccessApiModel("Success"));
    }

    @PostMapping("/login")
    public ResponseEntity<BaseApiModel> login(@RequestBody AuthRequestApiModel authRequest) {
        AuthResponseApiModel authResponseApiModel = authenticationService.login(authRequest);
        return ResponseEntity.ok().header(HttpHeaders.AUTHORIZATION, authResponseApiModel.getAuthToken()).body(authResponseApiModel);
    }

    @PostMapping("/activate-account")
    public ResponseEntity<BaseApiModel> activateAccount(@RequestParam String activationString) {
        usersService.activateUserAccount(activationString);
        return ResponseEntity.ok().body(new DefaultSuccessApiModel("Account activated"));
    }

    @RequestMapping(value = "/forget-password", method = RequestMethod.POST, produces = MediaType.APPLICATION_JSON_VALUE, consumes = MediaType.APPLICATION_JSON_VALUE)
    @PreAuthorize("permitAll()")
    public ResponseEntity<NotificationDto> forgetPassword(@RequestBody @Valid EmailDto emailDto) {
        UserEntity toResetPassword = usersService.sendPasswordRestoreKey(emailDto.getEmail(), restorationLinks);
        return new ResponseEntity<>(NotificationDto.builder()
                .username(toResetPassword.getEmail()).text(NotificationDto.Message.RESET_PWD_EMAIL_MSG.getValue()).build(),
                HttpStatus.OK);
    }

    @RequestMapping(value = "/restore", method = RequestMethod.POST, produces = MediaType.APPLICATION_JSON_VALUE, consumes = MediaType.APPLICATION_JSON_VALUE)
    @PreAuthorize("permitAll()")
    public ResponseEntity<NotificationDto> restorePassword(@RequestParam("key") String key, @RequestBody RestorePasswordModel restorePasswordModel) {
        UserEntity toResetEntity = usersService.restore(key,restorePasswordModel);
        return new ResponseEntity<>(NotificationDto.builder()
                .username(toResetEntity.getEmail()).text(NotificationDto.Message.SUCCESS_RESET_PWD_MSG.getValue()).build(),
                HttpStatus.OK);
    }

}
