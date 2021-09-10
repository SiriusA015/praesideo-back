package earth.praesideo.services;

import earth.praesideo.database.entities.common.RefListEntity;
import earth.praesideo.database.entities.products.Invoice;
import earth.praesideo.database.entities.products.ProductSubscription;
import earth.praesideo.database.entities.users.CompanyEntity;
import earth.praesideo.database.repositories.products.InvoiceRepository;
import earth.praesideo.database.repositories.users.UserPropertiesRepository;
import earth.praesideo.enums.BlockContext;
import earth.praesideo.enums.RefListKey;
import earth.praesideo.models.restapi.auth.ContentAuthApiModel;
import earth.praesideo.models.restapi.auth.ContentAuthApiModelItem;
import earth.praesideo.models.restapi.permission.PermissionModel;
import earth.praesideo.models.restapi.products.InvoiceDto;
import earth.praesideo.models.security.CustomUserDetailsModel;
import earth.praesideo.services.ref.RefListService;
import earth.praesideo.services.tech.AppDataTextService;
import earth.praesideo.services.tech.AppLogService;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.stereotype.Service;

import java.util.LinkedList;
import java.util.List;
import java.util.Optional;

@Service
public class AuthorizationService {

    private final AuthenticationManager authenticationManager;
    private final AppLogService appLogService;
    private final ProductService productService;
    private final InvoiceRepository invoiceRepository;
    private final CompanyService companyService;
    private final BillingService billingService;
    private final PermissionService permissionService;
    private final UserPropertiesRepository propertiesRepository;
    private final AppDataTextService appDataTextService;
    private final RefListService refListService;
    private final String IS_CONTENT_BLOCKING_ENABLED = "IS_CONTENT_BLOCKING_ENABLED";
    private final String BLOCK_EMISSIONS_TAB_MESSAGE_ACCOUNT_OWNER = "blockEmissionsTabMessage_account_owner";
    private final String BLOCK_IMPACT_PERFORMANCE_MESSAGE_ACCOUNT_OWNER = "blockImpactPerformanceMessage_account_owner";
    private final String BLOCK_TRACE_PERFORMANCE_MESSAGE_ACCOUNT_OWNER = "blockTracePerformanceMessage_account_owner";
    private final String IMPACT_DATA_SUBMISSION_MESSAGE_ACCOUNT_OWNER = "impactDataSubmissionMessage_account_owner";
    private final String BLOCK_EMISSIONS_TAB_MESSAGE_MEMBER = "blockEmissionsTabMessage_member";
    private final String BLOCK_IMPACT_PERFORMANCE_MESSAGE_MEMBER = "blockImpactPerformanceMessage_member";
    private final String BLOCK_TRACE_PERFORMANCE_MESSAGE_MEMBER = "blockTracePerformanceMessage_member";
    private final String IMPACT_DATA_SUBMISSION_MESSAGE_MEMBER = "impactDataSubmissionMessage_member";
    private final String BLOCK_IMPACT_PERFORMANCE_MESSAGE_STATUS_BASED = "ImpactDataFinaliseMessage";
    private final String BLOCK_TRACE_PERFORMANCE_MESSAGE_STATUS_BASED = "TracePerformanceWaitingMessage";
    private final String BLOCK_EMISSIONS_TAB_NO_EMISSIONS_DATA = "impactmeasurementonly_noemission_data";
    private final Integer COMPANY_STATUS_NEW = 1;

    public AuthorizationService(AuthenticationManager authenticationManager,
                                AppLogService appLogService,
                                ProductService productService,
                                InvoiceRepository invoiceRepository,
                                CompanyService companyService,
                                BillingService billingService,
                                PermissionService permissionService,
                                UserPropertiesRepository propertiesRepository,
                                RefListService refListService,
                                AppDataTextService appDataTextService) {
        this.authenticationManager = authenticationManager;
        this.appLogService = appLogService;
        this.productService = productService;
        this.invoiceRepository = invoiceRepository;
        this.companyService = companyService;
        this.billingService = billingService;
        this.permissionService = permissionService;
        this.propertiesRepository = propertiesRepository;
        this.appDataTextService = appDataTextService;
        this.refListService = refListService;
    }

    public ContentAuthApiModel getAuthorizationInformation(CustomUserDetailsModel user) {

        List<ContentAuthApiModelItem> listAuthItems = new LinkedList<>();
        var companyId = 0;
        var companyStatusId = COMPANY_STATUS_NEW;
        var isMeasurementOnly = false;
        var isImpactPerformanceSubscription = false;
        var isImpactPerformanceAndMeasurementSubscription = false;
        var isTraceSubscription = false;
        var isActiveSubscription = false;
        var isDemoAccounts = false;
        var isInvoiceForActiveSubscriptionExists = false;
        var isInvoiceForActiveSubscriptionPaid = false;
        var isAnyInvoiceExists = false;
        var isAnyInvoicePaid = false;
        var isUserAccountOwner = false;

        var isBlock = true;
        var isBlockingEnabled = true;
        var blockEmissionsTabMessage = "";
        var blockImpactPerformanceMessage = "";
        var blockTracePerformanceMessage = "";
        var blockImpactDataSubmissionMessage = "";

        var blockingProperty = propertiesRepository.findFirstByKey(IS_CONTENT_BLOCKING_ENABLED);
        if (blockingProperty.isPresent()) {
            isBlockingEnabled = (blockingProperty.get().getValue().toLowerCase().equals("yes"));
        }

        if (isBlockingEnabled) {
            companyId = user.getCompanyId();
            CompanyEntity companyEntity = this.companyService.getCompanyEntityById(companyId);
            if (companyEntity.getStatusId() != null) {
                companyStatusId = companyEntity.getStatusId();
            }

            isMeasurementOnly = this.productService.isImpactMeasurementOnlySubscription(companyId);
            isImpactPerformanceSubscription = this.productService.isImpactPerformanceOnlySubscription(companyId);
            isImpactPerformanceAndMeasurementSubscription = this.productService.isImpactPerformanceAndMeasurementSubscription(companyId);
            isTraceSubscription = this.productService.isTraceSubscription(companyId);

            Optional<RefListEntity> ref = this.refListService.getRefListEntityByKeyValue(RefListKey.PRAESIDEO_DEMO_COMPANY_ID.getValue(), user.getCompanyId().toString());
            isDemoAccounts = (ref.isPresent());
            var listUsers = this.permissionService.getUsersWithPermissions(companyId);
            Optional<ProductSubscription> subs = this.productService.getProductSubscriptionByCompanyId(companyId);
            isActiveSubscription = subs.isPresent();

            for (PermissionModel row : listUsers) {
                if (row.getUsername().equals(user.getUsername())) {
                    isUserAccountOwner = (row.getRole().equals("ACCOUNT_OWNER"));
                    break;
                }
            }

            if (isActiveSubscription) {
                var invoices = this.invoiceRepository.findAllByProductSubscriptionId(subs.get().getId());
                if (invoices.size() > 0) {
                    isInvoiceForActiveSubscriptionExists = true;
                    for (Invoice item : invoices) {
                        if (item.getInvoiceStatus().getListValue().toLowerCase().equals("paid")) {
                            isInvoiceForActiveSubscriptionPaid = true;
                            break;
                        }
                    }
                }
            } else {
                var invoices = this.billingService.getAllBillsForCompany(user.getCompanyId());
                if (invoices.size() > 0) {
                    isAnyInvoiceExists = true;
                    for (InvoiceDto item : invoices) {
                        if (item.getInvoiceStatus().toLowerCase().equals("paid")) {
                            isAnyInvoicePaid = true;
                            break;
                        }
                    }
                }
            }

            if (isDemoAccounts) {
                isBlock = false;
            } else {
                if (isActiveSubscription && isInvoiceForActiveSubscriptionExists && isInvoiceForActiveSubscriptionPaid) {
                    isBlock = false;
                } else if (isAnyInvoiceExists && isAnyInvoicePaid) {
                    isBlock = false;
                } else {
                    var allAppText = this.appDataTextService.getAllText();

                    if (isUserAccountOwner) {
                        blockEmissionsTabMessage = this.appDataTextService.filterByKey
                                (allAppText, BLOCK_EMISSIONS_TAB_MESSAGE_ACCOUNT_OWNER).getTextValue();
                        if (isImpactPerformanceSubscription || isImpactPerformanceAndMeasurementSubscription) {
                            blockImpactPerformanceMessage = this.appDataTextService.filterByKey
                                    (allAppText, BLOCK_IMPACT_PERFORMANCE_MESSAGE_ACCOUNT_OWNER).getTextValue();
                            blockImpactDataSubmissionMessage = this.appDataTextService.filterByKey
                                    (allAppText, IMPACT_DATA_SUBMISSION_MESSAGE_ACCOUNT_OWNER).getTextValue();
                        } else if (isTraceSubscription) {
                            blockImpactDataSubmissionMessage = this.appDataTextService.filterByKey
                                    (allAppText, IMPACT_DATA_SUBMISSION_MESSAGE_ACCOUNT_OWNER).getTextValue();
                            blockImpactPerformanceMessage = this.appDataTextService.filterByKey
                                    (allAppText, BLOCK_IMPACT_PERFORMANCE_MESSAGE_ACCOUNT_OWNER).getTextValue();
                            blockTracePerformanceMessage = this.appDataTextService.filterByKey
                                    (allAppText, BLOCK_TRACE_PERFORMANCE_MESSAGE_ACCOUNT_OWNER).getTextValue();
                        }
                    } else {
                        blockEmissionsTabMessage = this.appDataTextService.filterByKey
                                (allAppText, BLOCK_EMISSIONS_TAB_MESSAGE_MEMBER).getTextValue();
                        if (isImpactPerformanceSubscription || isImpactPerformanceAndMeasurementSubscription) {
                            blockImpactPerformanceMessage = this.appDataTextService.filterByKey
                                    (allAppText, BLOCK_IMPACT_PERFORMANCE_MESSAGE_MEMBER).getTextValue();
                            blockImpactDataSubmissionMessage = this.appDataTextService.filterByKey
                                    (allAppText, IMPACT_DATA_SUBMISSION_MESSAGE_MEMBER).getTextValue();
                        } else if (isTraceSubscription) {
                            blockImpactPerformanceMessage = this.appDataTextService.filterByKey
                                    (allAppText, BLOCK_IMPACT_PERFORMANCE_MESSAGE_MEMBER).getTextValue();
                            blockTracePerformanceMessage = this.appDataTextService.filterByKey
                                    (allAppText, BLOCK_TRACE_PERFORMANCE_MESSAGE_MEMBER).getTextValue();
                            blockImpactDataSubmissionMessage = this.appDataTextService.filterByKey
                                    (allAppText, IMPACT_DATA_SUBMISSION_MESSAGE_MEMBER).getTextValue();
                        }
                    }
                    if (isMeasurementOnly) {
                        if (!isAnyInvoiceExists) {
                            blockEmissionsTabMessage = this.appDataTextService.filterByKey
                                    (allAppText, BLOCK_EMISSIONS_TAB_NO_EMISSIONS_DATA).getTextValue();
                        }
                    } else if (companyStatusId == COMPANY_STATUS_NEW) {
                        blockEmissionsTabMessage = this.appDataTextService.filterByKey
                                (allAppText, BLOCK_IMPACT_PERFORMANCE_MESSAGE_STATUS_BASED).getTextValue();
                        blockImpactPerformanceMessage = this.appDataTextService.filterByKey
                                (allAppText, BLOCK_IMPACT_PERFORMANCE_MESSAGE_STATUS_BASED).getTextValue();
                        blockTracePerformanceMessage = this.appDataTextService.filterByKey
                                (allAppText, BLOCK_TRACE_PERFORMANCE_MESSAGE_STATUS_BASED).getTextValue();
                    }
                }
            }
        } else {
            isBlock = false;
        }

        ContentAuthApiModelItem emissionsTabItem = new ContentAuthApiModelItem();
        emissionsTabItem.setBlockContext(BlockContext.IMPACT_EMISSIONS_TAB);
        emissionsTabItem.setIsBlock(isBlock);
        emissionsTabItem.setBlockMessage(blockEmissionsTabMessage);

        ContentAuthApiModelItem impactPerformanceTab = new ContentAuthApiModelItem();
        impactPerformanceTab.setBlockContext(BlockContext.IMPACT_PERFORMANCE_TAB);
        impactPerformanceTab.setIsBlock(isBlock);
        impactPerformanceTab.setBlockMessage(blockImpactPerformanceMessage);

        ContentAuthApiModelItem tracePerformanceTab = new ContentAuthApiModelItem();
        tracePerformanceTab.setBlockContext(BlockContext.TRACE_PERFORMANCE_TAB);
        tracePerformanceTab.setIsBlock(isBlock);
        tracePerformanceTab.setBlockMessage(blockTracePerformanceMessage);

        ContentAuthApiModelItem impactDataSubmissionTab = new ContentAuthApiModelItem();
        impactDataSubmissionTab.setBlockContext(BlockContext.IMPACT_DATA_SUBMISSION);
        impactDataSubmissionTab.setIsBlock(isBlock);
        impactDataSubmissionTab.setBlockMessage(blockImpactDataSubmissionMessage);

        listAuthItems.add(emissionsTabItem);
        listAuthItems.add(impactPerformanceTab);
        listAuthItems.add(tracePerformanceTab);
        listAuthItems.add(impactDataSubmissionTab);
        ContentAuthApiModel authApiModel = new ContentAuthApiModel();
        authApiModel.setAuthApiModelItemList(listAuthItems);

        return authApiModel;
    }
}
