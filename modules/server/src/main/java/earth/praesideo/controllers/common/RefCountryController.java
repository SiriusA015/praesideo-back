package earth.praesideo.controllers.common;

import earth.praesideo.controllers.BaseController;
import earth.praesideo.database.entities.common.RefCountryEntity;
import earth.praesideo.database.entities.common.RefCountryStateEntity;
import earth.praesideo.database.entities.common.RefListEntity;
import earth.praesideo.database.repositories.common.RefCountryRepository;
import earth.praesideo.database.repositories.common.RefListRepository;
import earth.praesideo.services.ref.RefListService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.Comparator;
import java.util.List;

@RestController
@RequestMapping("/api/common")
public class RefCountryController extends BaseController {
    private static final Logger LOGGER = LoggerFactory.getLogger(RefListController.class);
    private final RefCountryRepository refCountryRepository;

    @Autowired
    public RefCountryController(RefCountryRepository refCountryRepository) {
        LOGGER.info(this.getClass().getSimpleName() + " created.");
        this.refCountryRepository = refCountryRepository;
    }

    @GetMapping("/ref-country/getall")
    public ResponseEntity<List<RefCountryEntity>> retrieveAll() {
        List<RefCountryEntity> response =refCountryRepository.findAll();
        response.sort(Comparator.comparing(RefCountryEntity::getCountry, String.CASE_INSENSITIVE_ORDER));
        return ResponseEntity.ok(response);
    }
}
