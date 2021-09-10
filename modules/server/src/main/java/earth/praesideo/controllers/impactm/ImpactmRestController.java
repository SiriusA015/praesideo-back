package earth.praesideo.controllers.impactm;

import earth.praesideo.controllers.BaseController;
import earth.praesideo.exceptions.ApiException;
import earth.praesideo.exceptions.ExceptionContent;
import earth.praesideo.models.restapi.BaseApiModel;
import earth.praesideo.models.restapi.general.DefaultErrorApiModel;
import earth.praesideo.models.restapi.impactm.DataImpactmEmissionModel;
import earth.praesideo.models.restapi.impactm.DataImpactmRefModel;
import earth.praesideo.models.security.CustomUserDetailsModel;
import earth.praesideo.services.*;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Optional;

@RestController
@RequestMapping("/api/private/impactm")
public class ImpactmRestController extends BaseController {
    private static final Logger LOGGER = LoggerFactory.getLogger(ImpactmRestController.class);
    private final ImpactmService impactmService;
    private final ImpactmRefService impactmRefService;
    private final ImpactmFinalizeService impactmFinalizeService;
    private final ImpactmChartService impactmChartService;

    @Autowired
    public ImpactmRestController(ImpactmService impactmService,
                                 ImpactmRefService impactmRefService,
                                 ImpactmFinalizeService impactmFinalizeService,
                                 ImpactmChartService impactmChartService) {
        LOGGER.info("{} created.", this.getClass().getSimpleName());
        this.impactmService         = impactmService;
        this.impactmRefService      = impactmRefService;
        this.impactmFinalizeService = impactmFinalizeService;
        this.impactmChartService    = impactmChartService;
    }

    @GetMapping("/get-refdata")
    public ResponseEntity<ArrayList<DataImpactmRefModel>> getImpactMeasurementRefData() {
        Optional<CustomUserDetailsModel> user = getLoggedInUser();
        return ResponseEntity.ok(impactmRefService.getImpactMeasurementRefData(user.get().getCompanyId()));
    }

    @GetMapping("/get-data")
    public ResponseEntity<BaseApiModel> getImpactMeasurementData(@RequestParam(name = "yearRepresentationId", required = true) Integer yearRepresentationId) {
        try {
            Optional<CustomUserDetailsModel> user = getLoggedInUser();
            return user.<ResponseEntity<BaseApiModel>>map(customUserDetailsModel -> ResponseEntity.ok(impactmService.getImpactMeasurement(user.get().getCompanyId(), yearRepresentationId))).orElseGet(() -> ResponseEntity.status(HttpStatus.BAD_REQUEST).body(new DefaultErrorApiModel("User not found")));
        } catch (Exception ex) {
            LOGGER.error(ex.getMessage());
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(new DefaultErrorApiModel(ex.getMessage()));
        }
    }

    @GetMapping("/get-chart-data")
    public ResponseEntity<BaseApiModel> getImpactmChartData(@RequestParam(name = "yearRepresentationId") Integer yearRepresentationId) {
        try {
            var user = getLoggedInUser().orElseThrow(() -> new ApiException(
                    ExceptionContent.USER_NOT_FOUND, HttpStatus.BAD_REQUEST
            ));
            return ResponseEntity.ok(impactmChartService
                    .getImpactmChartData2(user.getCompanyId(), yearRepresentationId));
        } catch (Exception ex) {
            LOGGER.error(ex.getMessage());
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(new DefaultErrorApiModel(ex.getMessage()));
        }
    }

    @PostMapping("/update-data")
    public ResponseEntity<BaseApiModel> updateImpactMeasurementData(@RequestBody @Valid DataImpactmEmissionModel request) {
        try {
            Optional<CustomUserDetailsModel> user = getLoggedInUser();
            return user.<ResponseEntity<BaseApiModel>>map(customUserDetailsModel -> ResponseEntity.ok(impactmService.saveImpactMeasurement(user.get().getCompanyId(), request, user.get()))).orElseGet(() -> ResponseEntity.status(HttpStatus.BAD_REQUEST).body(new DefaultErrorApiModel("User not found")));
        } catch (Exception ex) {
            LOGGER.error(ex.getMessage());
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(new DefaultErrorApiModel(ex.getMessage()));
        }
    }

    @GetMapping("/get-percentage-completion")
    public BigDecimal getPercentageCompletion(@RequestParam(name = "yearRepresentationId", required = true) Integer yearRepresentationId) {
        try {
            var user = getLoggedInUser().orElseThrow(() -> new ApiException(
                    ExceptionContent.USER_NOT_FOUND, HttpStatus.BAD_REQUEST
            ));
            return impactmFinalizeService.calculateImpactPercentageCompletion(user,yearRepresentationId);
        } catch (Exception ex) {
            LOGGER.error(ex.getMessage());
            return BigDecimal.ZERO;
        }
    }
    @PostMapping("/finalize-data")
    public ResponseEntity<Void> finalizeImpactMeasurementData(@RequestParam(name = "yearRepresentationId", required = true) Integer yearRepresentationId) {
            Optional<CustomUserDetailsModel> user = getLoggedInUser();
            impactmFinalizeService.confirmImpactMeasurement(user.get(), yearRepresentationId);
        return new ResponseEntity<>(HttpStatus.OK);
    }

    @DeleteMapping("/delete-stationary-fuel")
    public ResponseEntity<Void> deleteStationaryFuel(@RequestParam(name = "id") Integer id) {
        impactmService.deleteStationaryFuel(id);
        return new ResponseEntity<>(HttpStatus.OK);
    }

    @DeleteMapping("/delete-mobile-fuel")
    public ResponseEntity<Void> deleteMobileFuel(@RequestParam(name = "id") Integer id) {
        impactmService.deleteMobileFuel(id);
        return new ResponseEntity<>(HttpStatus.OK);
    }

    @DeleteMapping("/delete-distance")
    public ResponseEntity<Void> deleteDistance(@RequestParam(name = "id") Integer id) {
        impactmService.deleteDistance(id);
        return new ResponseEntity<>(HttpStatus.OK);
    }

    @DeleteMapping("/delete-refrigerator")
    public ResponseEntity<Void> deleteRefrigerator(@RequestParam(name = "id") Integer id) {
        impactmService.deleteRefrigerator(id);
        return new ResponseEntity<>(HttpStatus.OK);
    }

    @DeleteMapping("/delete-extinguisher")
    public ResponseEntity<Void> deleteExtinguisher(@RequestParam(name = "id") Integer id) {
        impactmService.deleteExtinguisher(id);
        return new ResponseEntity<>(HttpStatus.OK);
    }

    @DeleteMapping("/delete-electricity")
    public ResponseEntity<Void> deleteElectricity(@RequestParam(name = "id") Integer id) {
        impactmService.deleteElectricity(id);
        return new ResponseEntity<>(HttpStatus.OK);
    }
    @DeleteMapping("/delete-employee-commute")
    public ResponseEntity<Void> deleteEmployeeCommute(@RequestParam(name = "id") Integer id) {
        impactmService.deleteEmployeeCommute(id);
        return new ResponseEntity<>(HttpStatus.OK);
    }
    @DeleteMapping("/delete-business-travel")
    public ResponseEntity<Void> deleteBusinessTravel(@RequestParam(name = "id") Integer id) {
        impactmService.deleteBusinessTravel(id);
        return new ResponseEntity<>(HttpStatus.OK);
    }
}
