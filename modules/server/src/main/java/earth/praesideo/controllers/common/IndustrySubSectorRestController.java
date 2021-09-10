package earth.praesideo.controllers.common;

import earth.praesideo.controllers.BaseController;
import earth.praesideo.database.entities.common.IndustrySubSectorEntity;
import earth.praesideo.database.repositories.common.IndustrySubSectorRepository;
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
public class IndustrySubSectorRestController extends BaseController {
    private static final Logger LOGGER = LoggerFactory.getLogger(IndustrySubSectorRestController.class);
    @Autowired
    private IndustrySubSectorRepository industrySubSectorRepository;

    public IndustrySubSectorRestController() {
        LOGGER.info(this.getClass().getSimpleName() + " created.");
    }

    @GetMapping("/industry-subsector/list")
    public ResponseEntity<List<IndustrySubSectorEntity>> retrieve() {
        return ResponseEntity.ok(industrySubSectorRepository.findAll());
    }

    @GetMapping("/industry-subsector/{industrySectorId}/list")
    public ResponseEntity<List<IndustrySubSectorEntity>> retrieve(@PathVariable(name = "industrySectorId") Integer industrySectorId) {
        return ResponseEntity.ok(industrySubSectorRepository.findByIndustrySector_IndustrySectorId(industrySectorId));
    }
}
