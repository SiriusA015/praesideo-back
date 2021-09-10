package earth.praesideo.controllers;


import earth.praesideo.models.restapi.BaseApiModel;
import earth.praesideo.models.restapi.CompanyGeneralBackgroundModel;
import earth.praesideo.models.restapi.auth.FinancialInfoApiModel;
import earth.praesideo.models.restapi.general.DefaultErrorApiModel;
import earth.praesideo.models.security.CustomUserDetailsModel;
import earth.praesideo.services.CompanyService;
import earth.praesideo.services.FinancialService;
import org.hibernate.StaleObjectStateException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.Optional;

@RestController
@RequestMapping("/api/private")
public class CompanyRestController extends BaseController {
    private static final Logger LOGGER = LoggerFactory.getLogger(CompanyRestController.class);

    private final CompanyService companyGeneralBackgroundService;
    private final FinancialService financialInformationService;

    @Autowired
    public CompanyRestController(CompanyService companyGeneralBackgroundService,
                                 FinancialService financialInformationService) {
        LOGGER.info(this.getClass().getSimpleName() + " created.");

        this.companyGeneralBackgroundService = companyGeneralBackgroundService;
        this.financialInformationService = financialInformationService;
    }

    @GetMapping("/get-financial-informations")
    public ResponseEntity<BaseApiModel> getFinancialInformation() {
        Optional<CustomUserDetailsModel> user = getLoggedInUser();
        return user.<ResponseEntity<BaseApiModel>>map(customUserDetailsModel -> ResponseEntity.ok(
                        financialInformationService.getFinancialInformation(customUserDetailsModel.getCompanyId())))
                .orElseGet(() -> ResponseEntity.ok(new FinancialInfoApiModel()));
    }

    @PostMapping("/change-financial-informations")
    public ResponseEntity<BaseApiModel> changeFinancialInformation(@RequestBody FinancialInfoApiModel financialInfoApiModel) {
        try {
            Optional<CustomUserDetailsModel> user = getLoggedInUser();
            if (user.isPresent()) {
                financialInfoApiModel.setCompanyId(user.get().getCompanyId());
                return ResponseEntity.ok(financialInformationService.changeFinancialInformation(financialInfoApiModel));
            }
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(new DefaultErrorApiModel("Cannot retrieve user"));
        } catch (StaleObjectStateException ex) {
            return ResponseEntity.status(HttpStatus.CONFLICT).body(new DefaultErrorApiModel(ex.getMessage()));
        } catch (Exception ex) {
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(new DefaultErrorApiModel(ex.getMessage()));
        }
    }
    @PostMapping("/approve-company")
    public ResponseEntity<Void> approveCompany(@RequestParam(name = "companyId") Integer companyId) {
        Optional<CustomUserDetailsModel> user = getLoggedInUser();
        companyGeneralBackgroundService.approveCompanyDataEntry(user.get(),companyId);
        return new ResponseEntity<>(HttpStatus.OK);
    }

    @GetMapping("/get-general-background")
    public ResponseEntity<BaseApiModel> getGeneralBackground() {
        try {
            Optional<CustomUserDetailsModel> user = getLoggedInUser();
            return user.<ResponseEntity<BaseApiModel>>map(customUserDetailsModel -> ResponseEntity.ok(
                    companyGeneralBackgroundService.getGeneralBackground(customUserDetailsModel.getCompanyId()))).orElseGet(
                    () -> ResponseEntity.status(HttpStatus.BAD_REQUEST)
                            .body(new DefaultErrorApiModel("User not found")));
        } catch (Exception ex) {
            LOGGER.error(ex.getMessage());
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(new DefaultErrorApiModel(ex.getMessage()));
        }
    }

    @PostMapping("/change-general-background")
    public ResponseEntity<BaseApiModel> changeGeneralBackground(@Valid @RequestBody CompanyGeneralBackgroundModel companyGeneralBackgroundModel) {
        try {
            Optional<CustomUserDetailsModel> user = getLoggedInUser();
            return user.<ResponseEntity<BaseApiModel>>map(customUserDetailsModel -> ResponseEntity.ok(
                    companyGeneralBackgroundService.changeGeneralBackground(customUserDetailsModel.getCompanyId(),
                            companyGeneralBackgroundModel, user.get()))).orElseGet(
                    () -> ResponseEntity.status(HttpStatus.BAD_REQUEST)
                            .body(new DefaultErrorApiModel("User not found")));
        } catch (Exception ex) {
            LOGGER.error(ex.getMessage());
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(new DefaultErrorApiModel(ex.getMessage()));
        }
    }

    @DeleteMapping("/delete-company-secondary-industry")
    public ResponseEntity<Void> deleteCompanySecondaryIndustry(@RequestParam(name = "id") Integer id) {
        companyGeneralBackgroundService.deleteCompanySecondaryEntity(id);
        return new ResponseEntity<>(HttpStatus.OK);
    }

    @DeleteMapping("/delete-company-structure")
    public ResponseEntity<Void> deleteCompanyStructure(@RequestParam(name = "id") Integer id) {
        companyGeneralBackgroundService.deleteCompanyStructureEntity(id);
        return new ResponseEntity<>(HttpStatus.OK);
    }

    @DeleteMapping("/delete-company-facility")
    public ResponseEntity<Void> deleteCompanyFacility(@RequestParam(name = "id") Integer id) {
        companyGeneralBackgroundService.deleteCompanyFacilityEntity(id);
        return new ResponseEntity<>(HttpStatus.OK);
    }

    @DeleteMapping("/delete-company-product-services")
    public ResponseEntity<Void> deleteCompanyProductServices(@RequestParam(name = "id") Integer id) {
        companyGeneralBackgroundService.deleteCompanyProductServicesEntity(id);
        return new ResponseEntity<>(HttpStatus.OK);
    }
}
