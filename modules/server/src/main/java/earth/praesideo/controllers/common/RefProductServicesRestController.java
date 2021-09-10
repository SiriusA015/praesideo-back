package earth.praesideo.controllers.common;

import earth.praesideo.controllers.BaseController;
import earth.praesideo.database.entities.common.RefProductServicesEntity;
import earth.praesideo.database.repositories.common.RefProductServicesRepository;
import earth.praesideo.exceptions.ApiException;
import earth.praesideo.exceptions.ExceptionContent;
import earth.praesideo.models.restapi.general.RefProductServicesModel;
import earth.praesideo.services.ref.RefProductServicesService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.Comparator;
import java.util.Date;
import java.util.List;

@RestController
@RequestMapping("/api/common")
public class RefProductServicesRestController extends BaseController {
    private static final Logger LOGGER = LoggerFactory.getLogger(RefProductServicesRestController.class);
    private final RefProductServicesService refProductServicesService;

    @Autowired
    private RefProductServicesRepository refProductServicesRepository;
    public RefProductServicesRestController(RefProductServicesService refProductServicesService) {
        LOGGER.info(this.getClass().getSimpleName() + " created.");
        this.refProductServicesService = refProductServicesService;
    }

    @GetMapping("/ref-product-services/list")
    public ResponseEntity<List<RefProductServicesEntity>> retrieve() {
        List<RefProductServicesEntity> response = refProductServicesRepository.findAll();
        response.sort(Comparator.comparing(RefProductServicesEntity::getProdServName, String.CASE_INSENSITIVE_ORDER));
        return ResponseEntity.ok(response);
    }
    @PostMapping("/ref-product-services/add")
    public ResponseEntity<Void> addNewRefProductServices(@RequestBody RefProductServicesModel request) {
        var user = getLoggedInUser().orElseThrow(() -> new ApiException(ExceptionContent.USER_NOT_FOUND, HttpStatus.BAD_REQUEST));
        refProductServicesService.createNewRefProductServices(user,request.getProdServName());
        return new ResponseEntity<>(HttpStatus.CREATED);
    }
}
