package earth.praesideo.controllers.common;

import earth.praesideo.controllers.BaseController;
import earth.praesideo.database.entities.common.AuditingValidationEntity;
import earth.praesideo.database.repositories.common.AuditingValidationRepository;
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
public class AuditingValidationRestController extends BaseController {
    private static final Logger LOGGER = LoggerFactory.getLogger(AuditingValidationRestController.class);
    @Autowired
    private AuditingValidationRepository auditingValidationRepository;

    public AuditingValidationRestController() {
        LOGGER.info(this.getClass().getSimpleName() + " created.");
    }

    @GetMapping("/auditing-validation/list")
    public ResponseEntity<List<AuditingValidationEntity>> retrieve() {
        return ResponseEntity.ok(auditingValidationRepository.findAll());
    }
}
