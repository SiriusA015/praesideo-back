package earth.praesideo.controllers.common;

import earth.praesideo.controllers.BaseController;
import earth.praesideo.database.entities.common.OperationalBoundaryEntity;
import earth.praesideo.database.repositories.common.OperationalBoundaryRepository;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/api/common")
public class OperationalBoundaryRestController extends BaseController {
    private static final Logger LOGGER = LoggerFactory.getLogger(OperationalBoundaryRestController.class);
    @Autowired
    private OperationalBoundaryRepository operationalBoundaryRepository;

    public OperationalBoundaryRestController() {
        LOGGER.info(this.getClass().getSimpleName() + " created.");
    }

    @GetMapping("/operational-boundary/list")
    public ResponseEntity<List<OperationalBoundaryEntity>> retrieve() {
        return ResponseEntity.ok(operationalBoundaryRepository.findAll());
    }

    @GetMapping("/operational-boundary/{operationalBoundaryScopeId}/list")
    public ResponseEntity<List<OperationalBoundaryEntity>> retrieve(@PathVariable(name = "operationalBoundaryScopeId") Integer operationalBoundaryScopeId) {
        return ResponseEntity.ok(operationalBoundaryRepository.findByOperationalBoundaryScope_OperationalBoundaryScopeId(operationalBoundaryScopeId));
    }
}
