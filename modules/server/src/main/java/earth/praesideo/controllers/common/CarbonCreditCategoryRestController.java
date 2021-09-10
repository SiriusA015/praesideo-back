package earth.praesideo.controllers.common;

import earth.praesideo.controllers.BaseController;
import earth.praesideo.database.entities.common.CarbonCreditCategoryEntity;
import earth.praesideo.database.repositories.common.CarbonCreditCategoryRepository;
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
public class CarbonCreditCategoryRestController extends BaseController {
    private static final Logger LOGGER = LoggerFactory.getLogger(CarbonCreditCategoryRestController.class);
    @Autowired
    private CarbonCreditCategoryRepository carbonCreditCategoryRepository;

    public CarbonCreditCategoryRestController() {
        LOGGER.info(this.getClass().getSimpleName() + " created.");
    }

    @GetMapping("/carbon-credit-category/list")
    public ResponseEntity<List<CarbonCreditCategoryEntity>> retrieve() {
        return ResponseEntity.ok(carbonCreditCategoryRepository.findAll());
    }
}
