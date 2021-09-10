package earth.praesideo.controllers.common;

import earth.praesideo.controllers.BaseController;
import earth.praesideo.database.entities.common.PurchaseCreditCategoriesEntity;
import earth.praesideo.database.repositories.common.PurchaseCreditCategoriesRepository;
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
public class PurchaseCreditCategoriesRestController extends BaseController {
    private static final Logger LOGGER = LoggerFactory.getLogger(PurchaseCreditCategoriesRestController.class);
    @Autowired
    private PurchaseCreditCategoriesRepository purchaseCreditCategoriesRepository;

    public PurchaseCreditCategoriesRestController() {
        LOGGER.info(this.getClass().getSimpleName() + " created.");
    }

    @GetMapping("/purchase-credit-categories/list")
    public ResponseEntity<List<PurchaseCreditCategoriesEntity>> retrieve() {
        return ResponseEntity.ok(purchaseCreditCategoriesRepository.findAll());
    }
}
