package earth.praesideo.controllers.common;

import earth.praesideo.controllers.BaseController;
import earth.praesideo.database.entities.common.OrganisationalBoundaryEntity;
import earth.praesideo.database.repositories.common.OrganisationalBoundaryRepository;
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
public class OrganisationalBoundaryRestController extends BaseController {
    private static final Logger LOGGER = LoggerFactory.getLogger(OrganisationalBoundaryRestController.class);
    @Autowired
    private OrganisationalBoundaryRepository organisationalBoundaryRepository;

    public OrganisationalBoundaryRestController() {
        LOGGER.info(this.getClass().getSimpleName() + " created.");
    }

    @GetMapping("/organisational-boundary/list")
    public ResponseEntity<List<OrganisationalBoundaryEntity>> retrieve() {
        return ResponseEntity.ok(organisationalBoundaryRepository.findAll());
    }
}
