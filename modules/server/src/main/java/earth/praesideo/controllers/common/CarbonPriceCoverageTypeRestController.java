package earth.praesideo.controllers.common;

import earth.praesideo.controllers.BaseController;
import earth.praesideo.database.entities.common.CarbonPriceCoverageTypeEntity;
import earth.praesideo.database.repositories.common.CarbonPriceCoverageTypeRepository;
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
public class CarbonPriceCoverageTypeRestController extends BaseController {
    private static final Logger LOGGER = LoggerFactory.getLogger(CarbonPriceCoverageTypeRestController.class);
    @Autowired
    private CarbonPriceCoverageTypeRepository carbonPriceCoverageTypeRepository;

    public CarbonPriceCoverageTypeRestController() {
        LOGGER.info(this.getClass().getSimpleName() + " created.");
    }

    @GetMapping("/carbon-price-coverage-type/list")
    public ResponseEntity<List<CarbonPriceCoverageTypeEntity>> retrieve() {
        return ResponseEntity.ok(carbonPriceCoverageTypeRepository.findAll());
    }

    @GetMapping("/carbon-price-coverage-type/{carbonCreditCategoryId}/list")
    public ResponseEntity<List<CarbonPriceCoverageTypeEntity>> retrieve(@PathVariable(name = "carbonCreditCategoryId") Integer carbonCreditCategoryId) {
        return ResponseEntity.ok(carbonPriceCoverageTypeRepository.findByCarbonPriceCoverage_CarbonPriceCoverageId(carbonCreditCategoryId));
    }
}
