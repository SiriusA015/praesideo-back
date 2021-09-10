package earth.praesideo.controllers.common;

import earth.praesideo.controllers.BaseController;
import earth.praesideo.database.entities.common.PurchaseCreditCategoryTypeEntity;
import earth.praesideo.database.repositories.common.PurchaseCreditCategoryTypeRepository;
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
public class PurchaseCreditCategoryTypeRestController extends BaseController {
    private static final Logger LOGGER = LoggerFactory.getLogger(PurchaseCreditCategoryTypeRestController.class);
    @Autowired
    private PurchaseCreditCategoryTypeRepository purchaseCreditCategoryTypeRepository;

    public PurchaseCreditCategoryTypeRestController() {
        LOGGER.info(this.getClass().getSimpleName() + " created.");
    }

    @GetMapping("/purchase-credit-category-type/list")
    public ResponseEntity<List<PurchaseCreditCategoryTypeEntity>> retrieve() {
        return ResponseEntity.ok(purchaseCreditCategoryTypeRepository.findAll());
    }
}
