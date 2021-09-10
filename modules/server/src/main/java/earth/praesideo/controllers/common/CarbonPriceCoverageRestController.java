package earth.praesideo.controllers.common;

import earth.praesideo.controllers.BaseController;
import earth.praesideo.database.entities.common.CarbonPriceCoverageEntity;
import earth.praesideo.database.repositories.common.CarbonPriceCoverageRepository;
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
public class CarbonPriceCoverageRestController extends BaseController {
    private static final Logger LOGGER = LoggerFactory.getLogger(CarbonPriceCoverageRestController.class);
    @Autowired
    private CarbonPriceCoverageRepository carbonPriceCoverageRepository;

    public CarbonPriceCoverageRestController() {
        LOGGER.info(this.getClass().getSimpleName() + " created.");
    }

    @GetMapping("/carbon-price-coverage/list")
    public ResponseEntity<List<CarbonPriceCoverageEntity>> retrieve() {
        return ResponseEntity.ok(carbonPriceCoverageRepository.findAll());
    }
}
