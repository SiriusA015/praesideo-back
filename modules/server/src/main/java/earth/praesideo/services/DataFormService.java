package earth.praesideo.services;

import earth.praesideo.controllers.security.AuthorizationRestController;
import earth.praesideo.enums.BlockContext;
import earth.praesideo.exceptions.DataSetInReviewException;
import earth.praesideo.exceptions.DataSetNotFoundException;
import earth.praesideo.models.restapi.datasets.*;
import earth.praesideo.models.security.CustomUserDetailsModel;
import earth.praesideo.utils.DataEntryPortalSubmittedStatusEnum;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.stream.Collectors;

@Service
public class DataFormService {

    private static final Logger LOGGER = LoggerFactory.getLogger(DataFormService.class);

    private final CompanyService companyService;
    private final EmissionService emissionService;
    private final CompanyService companyGeneralBackgroundService;
    private final FinancialService financialInformationService;
    private final InventoryService inventoryService;
    private final ClimateService climateService;
    private final ProductService productService;
    private final BillingService billingService;
    private final AuthorizationService authorizationService;

    @Autowired
    public DataFormService(CompanyService companyService, FinancialService financialInformationService,
                           EmissionService emissionService, CompanyService companyGeneralBackgroundService,
                           InventoryService inventoryService, ClimateService climateService,
                           ProductService productService, BillingService billingService,
                           AuthorizationService authorizationService) {

        LOGGER.info(this.getClass().getSimpleName() + " created.");

        this.financialInformationService = financialInformationService;
        this.companyGeneralBackgroundService = companyGeneralBackgroundService;
        this.emissionService = emissionService;
        this.inventoryService = inventoryService;
        this.climateService = climateService;
        this.companyService = companyService;
        this.productService = productService;
        this.billingService = billingService;
        this.authorizationService = authorizationService;
    }

    public DataSetSubmitResponseModel submitForms(CustomUserDetailsModel user) throws DataSetNotFoundException, DataSetInReviewException {
        companyService.verifyCompanyStatusOrApplyNew(user, DataEntryPortalSubmittedStatusEnum.SUBMITTED_REVIEW);
        this.billingService.generateDailyBill(user.getCompanyId());
        DataSetSubmitResponseModel response = new DataSetSubmitResponseModel(true, this.authorizationService.getAuthorizationInformation(user).getAuthApiModelItemList()
                .stream().filter(row -> row.blockContext.equals(BlockContext.IMPACT_DATA_SUBMISSION)).collect(Collectors.toList()).get(0).getBlockMessage());
        return response;
    }

    public DataSetPercentageModel calculateCompletedPercentage(CustomUserDetailsModel user) {
        DataSetPercentageModel response = new DataSetPercentageModel();

        // calculate general background
        DataSetPercentageModel dataset = companyGeneralBackgroundService.calculatePercentage(user);
        response.setGeneralBackgroundPercentage(dataset.getGeneralBackgroundPercentage());
        response.setGeneralBackgroundPercentageTotal(dataset.getGeneralBackgroundPercentageTotal());
        response.setGeneralBackgroundPercentageCompleted(dataset.getGeneralBackgroundPercentageCompleted());
        response.setGeneralBackgroundMissingFields(dataset.getGeneralBackgroundMissingFields());

        //calculate financial information
        dataset = financialInformationService.calculatePercentage(user);
        response.setFinancialInformationPercentage(dataset.getFinancialInformationPercentage());
        response.setFinancialInformationPercentageTotal(dataset.getFinancialInformationPercentageTotal());
        response.setFinancialInformationPercentageCompleted(dataset.getFinancialInformationPercentageCompleted());
        response.setFinancialInformationMissingFields(dataset.getFinancialInformationMissingFields());

        //calculate GHG inventory method
        dataset = inventoryService.calculateGhgInventoryMethodPercentage(user);
        response.setGhgInventoryMethodPercentage(dataset.getGhgInventoryMethodPercentage());
        response.setGhgInventoryMethodPercentageTotal(dataset.getGhgInventoryMethodPercentageTotal());
        response.setGhgInventoryMethodPercentageCompleted(dataset.getGhgInventoryMethodPercentageCompleted());
        response.setGhgInventoryMethodMissingFields(dataset.getGhgInventoryMethodMissingFields());

        //calculate Inventory emissions
        dataset = inventoryService.calculateInventoryEmissionsPercentage(user);
        response.setInventoryEmissionsPercentage(dataset.getInventoryEmissionsPercentage());
        response.setInventoryEmissionsPercentageTotal(dataset.getInventoryEmissionsPercentageTotal());
        response.setInventoryEmissionsPercentageCompleted(dataset.getInventoryEmissionsPercentageCompleted());
        response.setInventoryEmissionsMissingFields(dataset.getInventoryEmissionsMissingFields());

        //calculate GHG target setting
        dataset = emissionService.calculatePercentage(user);
        response.setGhgTargetSettingPercentage(dataset.getGhgTargetSettingPercentage());
        response.setGhgTargetSettingPercentageTotal(dataset.getGhgTargetSettingPercentageTotal());
        response.setGhgTargetSettingPercentageCompleted(dataset.getGhgTargetSettingPercentageCompleted());
        response.setGhgTargetSettingMissingFields(dataset.getGhgTargetSettingMissingFields());

        //calculate Climate metrics
        dataset = climateService.calculatePercentage(user);
        response.setClimateMetricsPercentage(dataset.getClimateMetricsPercentage());
        response.setClimateMetricsPercentageTotal(dataset.getClimateMetricsPercentageTotal());
        response.setClimateMetricsPercentageCompleted(dataset.getClimateMetricsPercentageCompleted());
        response.setClimateMetricsMissingFields(dataset.getClimateMetricsMissingFields());

        //calculate Supporting documents
        dataset = calculateSupportingDocumentsPercentage(user);
        response.setSupportingDocumentsPercentage(dataset.getSupportingDocumentsPercentage());
        response.setSupportingDocumentsPercentageTotal(dataset.getSupportingDocumentsPercentageTotal());
        response.setSupportingDocumentsPercentageCompleted(dataset.getSupportingDocumentsPercentageCompleted());
        response.setSupportingDocumentsMissingFields(dataset.getSupportingDocumentsMissingFields());

        return response;
    }

    private DataSetPercentageModel calculateSupportingDocumentsPercentage(final CustomUserDetailsModel user) {
        DataSetPercentageModel response = new DataSetPercentageModel();

        int nonNullValues = !productService.isImpactMeasurementOnlySubscription(user.getCompanyId()) ? 0 : 1;
        int totalValues = 1;

        response.setSupportingDocumentsPercentageCompleted(nonNullValues);
        response.setSupportingDocumentsPercentageTotal(totalValues);
        response.setSupportingDocumentsMissingFields(new ArrayList<>());
        response.setSupportingDocumentsPercentage((int) Math.round((nonNullValues * 100.0) / totalValues));
        return response;
    }

}
