package earth.praesideo.controllers.common;

import earth.praesideo.controllers.BaseController;
import earth.praesideo.database.entities.common.EmissionsInventoryMethodEntity;
import earth.praesideo.database.repositories.common.EmissionsAccountingMethodRepository;
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
public class EmissionsAccountingMethodRestController extends BaseController {
    private static final Logger LOGGER = LoggerFactory.getLogger(EmissionsAccountingMethodRestController.class);
    @Autowired
    private EmissionsAccountingMethodRepository emissionsAccountingMethodRepository;

    public EmissionsAccountingMethodRestController() {
        LOGGER.info(this.getClass().getSimpleName() + " created.");
    }

    @GetMapping("/emissions-accounting-method/list")
    public ResponseEntity<List<EmissionsInventoryMethodEntity>> retrieve() {
        return ResponseEntity.ok(emissionsAccountingMethodRepository.findAll());
    }
}
