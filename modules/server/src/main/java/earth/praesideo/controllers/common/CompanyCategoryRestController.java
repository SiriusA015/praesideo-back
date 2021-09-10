package earth.praesideo.controllers.common;

import earth.praesideo.controllers.BaseController;
import earth.praesideo.database.entities.users.CompanyCategoryEntity;
import earth.praesideo.database.repositories.users.CompanyCategoryRepository;
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
public class CompanyCategoryRestController extends BaseController {
    private static final Logger LOGGER = LoggerFactory.getLogger(CompanyCategoryRestController.class);

    private final CompanyCategoryRepository companyCategoryRepository;

    @Autowired
    public CompanyCategoryRestController(CompanyCategoryRepository companyCategoryRepository) {
        LOGGER.info(this.getClass().getSimpleName() + " created.");
        this.companyCategoryRepository = companyCategoryRepository;
    }

    @GetMapping("/company-category/list")
    public ResponseEntity<List<CompanyCategoryEntity>> retrieve() {
        return ResponseEntity.ok(companyCategoryRepository.findAll());
    }
}
