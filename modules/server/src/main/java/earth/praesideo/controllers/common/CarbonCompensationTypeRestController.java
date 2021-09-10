package earth.praesideo.controllers.common;

import earth.praesideo.controllers.BaseController;
import earth.praesideo.database.entities.common.CarbonCompensationTypeEntity;
import earth.praesideo.database.repositories.common.CarbonCompensationTypeRepository;
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
public class CarbonCompensationTypeRestController extends BaseController {
    private static final Logger LOGGER = LoggerFactory.getLogger(CarbonCompensationTypeRestController.class);
    @Autowired
    private CarbonCompensationTypeRepository carbonCompensationTypeRepository;

    public CarbonCompensationTypeRestController() {
        LOGGER.info(this.getClass().getSimpleName() + " created.");
    }

    @GetMapping("/carbon-compensation-type/list")
    public ResponseEntity<List<CarbonCompensationTypeEntity>> retrieve() {
        return ResponseEntity.ok(carbonCompensationTypeRepository.findAll());
    }

    @GetMapping("/carbon-compensation-type/{carbonCreditCategoryId}/list")
    public ResponseEntity<List<CarbonCompensationTypeEntity>> retrieve(@PathVariable(name = "carbonCreditCategoryId") Integer carbonCreditCategoryId) {
        return ResponseEntity.ok(carbonCompensationTypeRepository.findByCarbonCreditCategory_CarbonCreditCategoryId(carbonCreditCategoryId));
    }
}
