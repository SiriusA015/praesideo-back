package earth.praesideo.controllers.common;

import earth.praesideo.controllers.BaseController;
import earth.praesideo.database.entities.common.RefCountryStateEntity;
import earth.praesideo.database.repositories.common.RefCountryStateRepository;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.Comparator;
import java.util.List;

@RestController
@RequestMapping("/api/common")
public class RefCountryStateController extends BaseController {
    private static final Logger LOGGER = LoggerFactory.getLogger(RefListController.class);
    private final RefCountryStateRepository refCountryStateRepository;

    @Autowired
    public RefCountryStateController(RefCountryStateRepository refCountryStateRepository) {
        LOGGER.info(this.getClass().getSimpleName() + " created.");
        this.refCountryStateRepository = refCountryStateRepository;
    }

    @GetMapping("/ref-states/getbycountryid")
    public ResponseEntity<List<RefCountryStateEntity>> retrieveByCountryId(@RequestParam(name = "countryId") Integer countryId) {
        List<RefCountryStateEntity> response = refCountryStateRepository.findRefCountryStateEntityByCountryId(countryId);
        response.sort(Comparator.comparing(RefCountryStateEntity::getStateName, String.CASE_INSENSITIVE_ORDER));
        return ResponseEntity.ok(response);
    }
}
