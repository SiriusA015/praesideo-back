package earth.praesideo.controllers.common;

import earth.praesideo.controllers.BaseController;
import earth.praesideo.database.entities.common.EmissionsReductionTargetScopeEntity;
import earth.praesideo.database.repositories.common.EmissionsReductionTargetScopeRepository;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/api/common")
public class EmissionsReductionTargetScopeRestController extends BaseController {
    private static final Logger LOGGER = LoggerFactory.getLogger(EmissionsReductionTargetScopeRestController.class);
    @Autowired
    private EmissionsReductionTargetScopeRepository emissionsReductionTargetScopeRepository;

    public EmissionsReductionTargetScopeRestController() {
        LOGGER.info(this.getClass().getSimpleName() + " created.");
    }

    @GetMapping("/emissions-reduction-target-scope/list")
    public ResponseEntity<List<EmissionsReductionTargetScopeEntity>> retrieve() {
        return ResponseEntity.ok(emissionsReductionTargetScopeRepository.findAll());
    }
}
