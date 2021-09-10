package earth.praesideo.controllers.security;

import earth.praesideo.controllers.BaseController;
import earth.praesideo.models.restapi.auth.ContentAuthApiModel;
import earth.praesideo.models.security.CustomUserDetailsModel;
import earth.praesideo.services.AuthorizationService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.*;

import java.util.Optional;

@RestController
@RequestMapping("/api/private")
public class AuthorizationRestController extends BaseController {
    private static final Logger LOGGER = LoggerFactory.getLogger(AuthorizationRestController.class);
    private final AuthorizationService authorizationService;

    public AuthorizationRestController(AuthorizationService authorizationService) {
        LOGGER.info(this.getClass().getSimpleName() + " created.");
        this.authorizationService = authorizationService;
    }
    @GetMapping("/auth/getcontentauthorization")
    public ContentAuthApiModel getAuthorization() {
        Optional<CustomUserDetailsModel> user = getLoggedInUser();
        return this.authorizationService.getAuthorizationInformation(user.get());
    }
}
