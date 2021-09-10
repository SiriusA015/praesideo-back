package earth.praesideo.controllers.common;

import earth.praesideo.controllers.BaseController;
import earth.praesideo.database.entities.common.IndustrySectorEntity;
import earth.praesideo.database.repositories.common.IndustrySectorRepository;
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
public class IndustrySectorRestController extends BaseController {
    private static final Logger LOGGER = LoggerFactory.getLogger(IndustrySectorRestController.class);
    @Autowired
    private IndustrySectorRepository industrySectorRepository;

    public IndustrySectorRestController() {
        LOGGER.info(this.getClass().getSimpleName() + " created.");
    }

    @GetMapping("/industry-sector/list")
    public ResponseEntity<List<IndustrySectorEntity>> retrieve() {
        return ResponseEntity.ok(industrySectorRepository.findAll());
    }
}
