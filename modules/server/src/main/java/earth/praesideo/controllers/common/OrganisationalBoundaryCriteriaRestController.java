package earth.praesideo.controllers.common;

import earth.praesideo.controllers.BaseController;
import earth.praesideo.database.entities.common.OrganisationalBoundaryCriteriaEntity;
import earth.praesideo.database.repositories.common.OrganisationalBoundaryCriteriaRepository;
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
public class OrganisationalBoundaryCriteriaRestController extends BaseController {
    private static final Logger LOGGER = LoggerFactory.getLogger(OrganisationalBoundaryCriteriaRestController.class);
    @Autowired
    private OrganisationalBoundaryCriteriaRepository organisationalBoundaryCriteriaRepository;

    public OrganisationalBoundaryCriteriaRestController() {
        LOGGER.info(this.getClass().getSimpleName() + " created.");
    }

    @GetMapping("/organisational-boundary-criteria/list")
    public ResponseEntity<List<OrganisationalBoundaryCriteriaEntity>> retrieve() {
        return ResponseEntity.ok(organisationalBoundaryCriteriaRepository.findAll());
    }

    @GetMapping("/organisational-boundary-criteria/{organisationalBoundaryId}/list")
    public ResponseEntity<List<OrganisationalBoundaryCriteriaEntity>> retrieve(@PathVariable(name = "organisationalBoundaryId") Integer organisationalBoundaryId) {
        return ResponseEntity.ok(organisationalBoundaryCriteriaRepository.findByOrganisationalBoundary_OrganisationalBoundaryId(organisationalBoundaryId));
    }
}
