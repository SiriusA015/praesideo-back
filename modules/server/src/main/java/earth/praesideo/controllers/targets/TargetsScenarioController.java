package earth.praesideo.controllers.targets;

import earth.praesideo.controllers.BaseController;
import earth.praesideo.exceptions.UserNotFoundException;
import earth.praesideo.models.restapi.BaseApiModel;
import earth.praesideo.models.restapi.datasets.DataSetEmissionsReductionModel;
import earth.praesideo.models.restapi.general.DefaultErrorApiModel;
import earth.praesideo.models.security.CustomUserDetailsModel;
import earth.praesideo.services.TargetsScenarioService;
import lombok.AllArgsConstructor;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;

@RestController
@RequestMapping("/api/targets")
@AllArgsConstructor
public class TargetsScenarioController extends BaseController {

    private static final Logger       LOGGER = LoggerFactory.getLogger(TargetsScenarioController.class);

    private final TargetsScenarioService targetsScenarioService;

    @GetMapping("/")
    public ResponseEntity<BaseApiModel> getEmissionsReductionTarget() {
        try {
            CustomUserDetailsModel user = getLoggedInUser().orElseThrow(UserNotFoundException::new);
            return ResponseEntity.ok(targetsScenarioService.getEmissionsReduction(user));
        } catch (Exception ex) {
            LOGGER.error(ex.getMessage());
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(new DefaultErrorApiModel(ex.getMessage()));
        }
    }

    @PostMapping("/save")
    public ResponseEntity<BaseApiModel> saveEmissionsReductionTarget(
            @RequestBody @Valid DataSetEmissionsReductionModel request) {
        try {
            CustomUserDetailsModel user = getLoggedInUser().orElseThrow(UserNotFoundException::new);
            return ResponseEntity.ok(targetsScenarioService.saveEmissionsReduction(user, request));
        } catch (Exception ex) {
            LOGGER.error(ex.getMessage());
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(new DefaultErrorApiModel(ex.getMessage()));
        }
    }
}
