package earth.praesideo.controllers.dataset;

import earth.praesideo.controllers.BaseController;
import earth.praesideo.models.restapi.BaseApiModel;
import earth.praesideo.models.restapi.datasets.*;
import earth.praesideo.models.restapi.general.DefaultErrorApiModel;
import earth.praesideo.models.security.CustomUserDetailsModel;
import earth.praesideo.services.*;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.Optional;

@RestController
@RequestMapping("/api/private/dataset")
public class DataFormRestController extends BaseController {

    private static final Logger LOGGER = LoggerFactory.getLogger(DataFormRestController.class);

    private final DataFormService dataFormService;
    private final CompanyService companyService;
    private final EmissionService emissionService;
    private final InventoryService inventoryService;
    private final ClimateService climateService;

    @Autowired
    public DataFormRestController(DataFormService dataFormService, CompanyService companyService, UsersService usersService, EmissionService emissionService,
                                  InventoryService inventoryService, ClimateService climateService) {
        LOGGER.info(this.getClass().getSimpleName() + " created.");
        this.dataFormService = dataFormService;
        this.emissionService = emissionService;
        this.inventoryService = inventoryService;
        this.climateService = climateService;
        this.companyService = companyService;
    }


    @GetMapping("/get-ghg-inventory-method")
    public ResponseEntity<BaseApiModel> getGhgInventoryMethod() {
        try {
            Optional<CustomUserDetailsModel> user = getLoggedInUser();
            return user.<ResponseEntity<BaseApiModel>>map(customUserDetailsModel -> ResponseEntity.ok(
                    inventoryService.getGhgInventoryMethod(customUserDetailsModel))).orElseGet(
                    () -> ResponseEntity.status(HttpStatus.BAD_REQUEST)
                            .body(new DefaultErrorApiModel("User not found")));
        } catch (Exception ex) {
            LOGGER.error(ex.getMessage());
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(new DefaultErrorApiModel(ex.getMessage()));
        }
    }

    @PostMapping("/save-ghg-inventory-method")
    public ResponseEntity<BaseApiModel> saveGhgInventoryMethod(
            @RequestBody @Valid DataSetGhgInventoryMethodModel request) {
        try {
            Optional<CustomUserDetailsModel> user = getLoggedInUser();
            return user.<ResponseEntity<BaseApiModel>>map(customUserDetailsModel
                    -> ResponseEntity.ok(inventoryService.saveGhgInventoryMethod(customUserDetailsModel, request))).orElseGet(()
                    -> ResponseEntity.status(HttpStatus.BAD_REQUEST).body(new DefaultErrorApiModel("User not found")));
        } catch (Exception ex) {
            LOGGER.error(ex.getMessage());
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(new DefaultErrorApiModel(ex.getMessage()));
        }
    }

    @Deprecated
    @GetMapping("/get-historical-year-emissions")
    public ResponseEntity<BaseApiModel> getHistoricalYearEmissions() {
        return ResponseEntity.status(HttpStatus.GONE).build();
    }

    @GetMapping("/get-recent-year-emissions")
    public ResponseEntity<BaseApiModel> getRecentYearEmissions(@RequestParam(name = "yearRepresentationId") Integer yearRepresentationId) {
        try {
            Optional<CustomUserDetailsModel> user = getLoggedInUser();
            return user.<ResponseEntity<BaseApiModel>>map(customUserDetailsModel -> ResponseEntity.ok(
                    inventoryService.getYearEmissions(customUserDetailsModel, yearRepresentationId))).orElseGet(
                    () -> ResponseEntity.status(HttpStatus.BAD_REQUEST)
                            .body(new DefaultErrorApiModel("User not found")));
        } catch (Exception ex) {
            LOGGER.error(ex.getMessage());
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(new DefaultErrorApiModel(ex.getMessage()));
        }
    }

    @PostMapping("/save-year-emissions")
    public ResponseEntity<BaseApiModel> saveRecentYearEmissions(
            @RequestBody @Valid DataSetRecentYearEmissionsModel request) {
        try {
            Optional<CustomUserDetailsModel> user = getLoggedInUser();
            return user.<ResponseEntity<BaseApiModel>>map(customUserDetailsModel
                    -> ResponseEntity.ok(inventoryService.saveYearEmissions(customUserDetailsModel, request))).orElseGet(()
                    -> ResponseEntity.status(HttpStatus.BAD_REQUEST).body(new DefaultErrorApiModel("User not found")));
        } catch (Exception ex) {
            LOGGER.error(ex.getMessage());
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(new DefaultErrorApiModel(ex.getMessage()));
        }
    }

    @GetMapping("/get-emissions-reduction-target")
    public ResponseEntity<BaseApiModel> getEmissionsReductionTarget() {
        try {
            Optional<CustomUserDetailsModel> user = getLoggedInUser();
            return user.<ResponseEntity<BaseApiModel>>map(customUserDetailsModel -> ResponseEntity.ok(
                    emissionService.getEmissionsReduction(customUserDetailsModel))).orElseGet(
                    () -> ResponseEntity.status(HttpStatus.BAD_REQUEST)
                            .body(new DefaultErrorApiModel("User not found")));
        } catch (Exception ex) {
            LOGGER.error(ex.getMessage());
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(new DefaultErrorApiModel(ex.getMessage()));
        }
    }

    @PostMapping("/save-emissions-reduction-target")
    public ResponseEntity<BaseApiModel> saveEmissionsReductionTarget(
            @RequestBody @Valid DataSetEmissionsReductionModel request) {
        try {
            Optional<CustomUserDetailsModel> user = getLoggedInUser();
            return user.<ResponseEntity<BaseApiModel>>map(customUserDetailsModel
                    -> ResponseEntity.ok(emissionService.saveEmissionsReduction(customUserDetailsModel, request))).orElseGet(()
                    -> ResponseEntity.status(HttpStatus.BAD_REQUEST).body(new DefaultErrorApiModel("User not found")));
        } catch (Exception ex) {
            LOGGER.error(ex.getMessage());
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(new DefaultErrorApiModel(ex.getMessage()));
        }
    }

    @GetMapping("/get-climate-metrics")
    public ResponseEntity<BaseApiModel> getClimateMetrics() {
        try {
            Optional<CustomUserDetailsModel> user = getLoggedInUser();
            return user.<ResponseEntity<BaseApiModel>>map(customUserDetailsModel -> ResponseEntity.ok(
                    climateService.getClimateMechanismInfluence(customUserDetailsModel))).orElseGet(
                    () -> ResponseEntity.status(HttpStatus.BAD_REQUEST)
                            .body(new DefaultErrorApiModel("User not found")));
        } catch (Exception ex) {
            LOGGER.error(ex.getMessage());
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(new DefaultErrorApiModel(ex.getMessage()));
        }
    }

    @PostMapping("/save-climate-metrics")
    public ResponseEntity<BaseApiModel> saveClimateMetrics(
            @RequestBody @Valid DataSetClimateMechanismsInfluenceModel request) {
        try {
            Optional<CustomUserDetailsModel> user = getLoggedInUser();
            return user.<ResponseEntity<BaseApiModel>>map(customUserDetailsModel
                    -> ResponseEntity.ok(climateService.saveClimateMechanismsInfluence(customUserDetailsModel, request))).orElseGet(()
                    -> ResponseEntity.status(HttpStatus.BAD_REQUEST).body(new DefaultErrorApiModel("User not found")));
        } catch (Exception ex) {
            LOGGER.error(ex.getMessage());
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(new DefaultErrorApiModel(ex.getMessage()));
        }
    }

    @PostMapping("/submit")
    public ResponseEntity<BaseApiModel> submitForms() {
        try {
            Optional<CustomUserDetailsModel> user = getLoggedInUser();
            return user.<ResponseEntity<BaseApiModel>>map(customUserDetailsModel
                    -> ResponseEntity.ok(dataFormService.submitForms(customUserDetailsModel))).orElseGet(()
                    -> ResponseEntity.status(HttpStatus.BAD_REQUEST).body(new DefaultErrorApiModel("User not found")));
        } catch (Exception ex) {
            LOGGER.error(ex.getMessage());
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(new DefaultErrorApiModel(ex.getMessage()));
        }
    }

    @GetMapping("/calculate-percentage")
    public ResponseEntity<DataSetPercentageModel> getPercentageCompletionCalculation() {
        try {
            Optional<CustomUserDetailsModel> user = getLoggedInUser();
            return user.map(customUserDetailsModel -> ResponseEntity.ok(
                            dataFormService.calculateCompletedPercentage(customUserDetailsModel)))
                    .orElseGet(() -> ResponseEntity.status(HttpStatus.BAD_REQUEST).body(null));
        } catch (Exception ex) {
            LOGGER.error(ex.getMessage());
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(null);
        }
    }

    @GetMapping("/is-editable")
    public ResponseEntity<Boolean> isDataSetEditable() {
        try {
            Optional<CustomUserDetailsModel> user = getLoggedInUser();

            if (user.isPresent()) {
                companyService.verifyCompanyStatusOrApplyNew(user.get(), null);
                return ResponseEntity.ok(true);
            }
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(false);
        } catch (Exception ex) {
            LOGGER.error(ex.getMessage());
            return ResponseEntity.ok(false);
        }
    }

    @GetMapping("/is-accepted")
    public ResponseEntity<Boolean> isDataSetAccepted() {
        Optional<CustomUserDetailsModel> user = getLoggedInUser();

        if (user.isPresent()) {
            boolean isAccepted = companyService.isCompanyStatusAccepted(user.get().getCompanyId());

            if (isAccepted) {
                return ResponseEntity.ok(true);
            } else {
                return ResponseEntity.ok(false);
            }
        } else {
            return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body(false);
        }
    }

}
