package earth.praesideo.services;

import earth.praesideo.database.entities.common.RefListEntity;
import earth.praesideo.database.entities.common.RefProductServicesEntity;
import earth.praesideo.database.entities.common.YearRepresentationEntity;
import earth.praesideo.database.entities.products.ProductSubscription;
import earth.praesideo.database.entities.suppliers.SupplyChain;
import earth.praesideo.database.entities.users.*;
import earth.praesideo.database.repositories.common.RefListRepository;
import earth.praesideo.database.repositories.common.RefProductServicesRepository;
import earth.praesideo.database.repositories.common.YearRepresentationRepository;
import earth.praesideo.database.repositories.products.ProductSubscriptionRepository;
import earth.praesideo.database.repositories.users.*;
import earth.praesideo.exceptions.*;
import earth.praesideo.models.restapi.*;
import earth.praesideo.models.restapi.auth.CheckExistingDomainResponse;
import earth.praesideo.models.restapi.datasets.DataSetPercentageModel;
import earth.praesideo.models.security.CustomUserDetailsModel;
import earth.praesideo.services.ref.RefListService;
import earth.praesideo.utils.DataEntryPortalSubmittedStatusEnum;
import org.joda.time.DateTime;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.sql.Timestamp;
import java.time.Year;
import java.util.*;
import java.util.stream.Collectors;

@Service
public class CompanyService {

    private final CompanyRepository companyRepository;
    private final CompanySecondaryIndustryRepository companySecondaryIndustryRepository;
    private final ModelMapper modelMapper;
    private final CompanyStructureRepository companyStructureRepository;
    private final CompanyFacilityRepository companyFacilityRepository;
    private final CompanyFacilityDataRepository companyFacilityDataRepository;
    private final CompanyProductServicesRepository companyProductServicesRepository;
    private final RefProductServicesRepository refProductServicesRepository;
    private final RefListRepository refListRepository;
    private final RefListService refListService;
    private final YearRepresentationRepository yearRepresentationRepository;
    private final ProductSubscriptionRepository productSubscriptionRepository;
    private static final String REF_FACILITY_DATA_UNIT_KEY = "impactm_facilitydata_unit";

    @Autowired
    public CompanyService(CompanyRepository companyRepository,
                          CompanySecondaryIndustryRepository companySecondaryIndustryRepository,
                          ModelMapper modelMapper,
                          CompanyStructureRepository companyStructureRepository,
                          CompanyFacilityRepository companyFacilityRepository,
                          CompanyFacilityDataRepository companyFacilityDataRepository,
                          CompanyProductServicesRepository companyProductServicesRepository,
                          RefProductServicesRepository refProductServicesRepository,
                          YearRepresentationRepository yearRepresentationRepository,
                          RefListRepository refListRepository,
                          ProductSubscriptionRepository productSubscriptionRepository,
                          RefListService refListService) {
        this.companyRepository = companyRepository;
        this.companySecondaryIndustryRepository = companySecondaryIndustryRepository;
        this.modelMapper = modelMapper;
        this.companyStructureRepository = companyStructureRepository;
        this.companyFacilityRepository = companyFacilityRepository;
        this.companyFacilityDataRepository = companyFacilityDataRepository;
        this.companyProductServicesRepository = companyProductServicesRepository;
        this.refProductServicesRepository = refProductServicesRepository;
        this.refListRepository = refListRepository;
        this.refListService = refListService;
        this.yearRepresentationRepository = yearRepresentationRepository;
        this.productSubscriptionRepository = productSubscriptionRepository;
    }

    public CompanyEntity getCompanyEntityById(Integer companyId) {
        return companyRepository.findById(companyId)
                .orElseThrow(() -> new ApiException(ExceptionContent.COMPANY_NOT_FOUND, HttpStatus.NOT_FOUND));
    }

    public CompanyEntity createCompany(String companyName,CustomUserDetailsModel user) {
        var company = companyRepository.findByCompanyName(companyName);
        if (!company.isEmpty()) {
            throw new ApiException(ExceptionContent.COMPANY_ALREADY_EXISTS, HttpStatus.CONFLICT);
        }
        return buildCompany(companyName,user);
    }

    public CompanyEntity createSupplierCompany(List<SupplyChain> supplyChains, String companyName, CustomUserDetailsModel user) {
        var company = companyRepository.findByCompanyName(companyName);
        boolean checkExistedSupplierByName = checkExistedSupplier(supplyChains, company);
        if (checkExistedSupplierByName) {
            throw new ApiException(ExceptionContent.COMPANY_ALREADY_EXISTS, HttpStatus.CONFLICT);
        }
        return buildCompany(companyName,user);
    }
    public void approveCompanyDataEntry(CustomUserDetailsModel user, Integer companyId)
    {
        CompanyEntity company= this.getCompanyEntityById(companyId);
        if (company!=null) {
            company.setStatusId(DataEntryPortalSubmittedStatusEnum.ACCEPTED.getStatus());
            company.setStatusDate(new Timestamp(new Date().getTime()));
            company.setDateModified(new Date());
            company.setModifiedBy(user.getUsername());
            companyRepository.save(company);
        }
    }
    public CompanyEntity buildCompany(String companyName,CustomUserDetailsModel user) {
        var newCompany = new CompanyEntity();
        newCompany.setCompanyName(companyName);
        YearRepresentationEntity currentYear = this.yearRepresentationRepository.findByCalendarYear(Year.now().getValue());
        newCompany.setYearRepresentationId(currentYear.getYearRepresentationId());
        newCompany.setStartMonth(0);
        newCompany.setIsFinancialYear(false);
        newCompany.setStatusId(1);
        newCompany.setStatusDate(new Timestamp(new Date().getTime()));
        newCompany.setDateAdded(new Date());
        newCompany.setAddedBy(user.getUsername());
        return companyRepository.save(newCompany);
    }


    private boolean checkExistedSupplier(List<SupplyChain> suppliers, List<CompanyEntity> checkedCompany) {
        boolean res = false;
        for (SupplyChain sup : suppliers) {
            if (!checkedCompany.isEmpty()) {
                for (CompanyEntity com : checkedCompany) {
                    if (sup.getSupplier().getCompanyName().equals(com.getCompanyName())) {
                        res = true;
                        break;
                    }
                }
            }
        }
        return res;
    }

    public CompanyGeneralBackgroundModel getGeneralBackground(Integer companyId) {
        CompanyEntity companyEntity = companyRepository.findById(companyId).orElse(new CompanyEntity());
        CompanyGeneralBackgroundModel response = new CompanyGeneralBackgroundModel();
        response.setCompanyId(companyId);
        response.setCompanyName(companyEntity.getCompanyName());
        response.setCompanyDescription(companyEntity.getCompanyDescription());
        response.setCity(companyEntity.getCity());
        response.setStateId(companyEntity.getStateId());
        response.setCountryId(companyEntity.getCountryId());
        response.setHomeStockExchangeListed(companyEntity.getStockExchangeListed());
        response.setHomeStockExchangeId(companyEntity.getHomeStockExchangeId());
        response.setIndustrySectorId(companyEntity.getIndustrySectorId());
        response.setIndustrySubsectorId(companyEntity.getIndustrySubsectorId());

        List<CompanySecondaryIndustryEntity> listCompanySecondaryIndustryEntity = companySecondaryIndustryRepository.findByCompanyCompanyId(companyId);
        List<CompanySecondaryIndustryModel> listCompanySecondaryIndustryModel = listCompanySecondaryIndustryEntity.stream()
                .map(obj -> modelMapper.map(obj, CompanySecondaryIndustryModel.class)).collect(Collectors.toList());
        listCompanySecondaryIndustryModel.sort(Comparator.comparing((o -> o.getId())));
        response.setCompanySecondaryIndustrylist(listCompanySecondaryIndustryModel);

        response.setIsParentcompany(companyEntity.getIsParentcompany());
        response.setIsSubsidiary(companyEntity.getIsSubsidiary());
        response.setIsJointventure(companyEntity.getIsJointventure());
        response.setIsStandalone(companyEntity.getIsStandalone());

        response.setIsFinancialYear(companyEntity.getIsFinancialYear());
        response.setYearRepresentationId(companyEntity.getYearRepresentationId());
        response.setStartMonth(companyEntity.getStartMonth());

        List<CompanyStructureEntity> listCompanyStructureEntity = companyStructureRepository.findCompanyStructureEntitiesByCompanyId(companyId);
        List<CompanyStructureModel> listCompanyStructureModel = listCompanyStructureEntity.stream()
                .map(obj -> modelMapper.map(obj, CompanyStructureModel.class)).collect(Collectors.toList());
        if (listCompanyStructureModel != null && !listCompanyStructureModel.isEmpty()) {
            for (CompanyStructureModel row : listCompanyStructureModel) {
                if (row.getRelCompanyId() != null && row.getRelCompanyId() > 0) {
                    row.setRelCompanyIdCompanyName(this.companyRepository.findById(row.getRelCompanyId()).get().getCompanyName());
                } else {
                    row.setRelCompanyIdCompanyName("");
                }
            }
            listCompanyStructureModel.sort(Comparator.comparing((o -> o.getId())));
        }
        response.setCompanyStructureList(listCompanyStructureModel);

        List<CompanyFacilityEntity> listCompanyFacilityEntity = companyFacilityRepository.findCompanyFacilityEntitiesByCompanyId(companyId);
        List<CompanyFacilityModel> listCompanyFacilityModel = listCompanyFacilityEntity.stream()
                .map(obj -> modelMapper.map(obj, CompanyFacilityModel.class)).collect(Collectors.toList());
        listCompanyFacilityModel.sort(Comparator.comparing((o -> o.getFacilityId())));
        response.setCompanyFacilityList(listCompanyFacilityModel);

        List<CompanyProductServicesEntity> listCompanyProductServicesEntity =
                companyProductServicesRepository.findCompanyProductServicesEntityByCompanyId(companyId);
        List<CompanyProductServicesModel> listCompanyProductServicesModel =
                listCompanyProductServicesEntity.stream()
                        .map(obj -> modelMapper.map(obj, CompanyProductServicesModel.class)).collect(Collectors.toList());
        listCompanyProductServicesModel.sort(Comparator.comparing((o -> o.getId())));
        response.setCompanyProductServicesList(listCompanyProductServicesModel);
        Optional<ProductSubscription> productSubscription = this.productSubscriptionRepository.findByCompanyCompanyIdAndEndDateIsNull(companyId);
        if (productSubscription.isPresent()) {
            response.setProductVariantId(productSubscription.get().getProductVariant().getId());
        }
        return response;
    }

    public CompanyGeneralBackgroundModel changeGeneralBackground(Integer companyId, CompanyGeneralBackgroundModel companyGeneralBackgroundModel, CustomUserDetailsModel user) {
        CompanyEntity companyEntity = companyRepository.findById(companyId).orElse(new CompanyEntity());

        if (null != companyGeneralBackgroundModel.getCompanyName()) {
            companyEntity.setCompanyName(companyGeneralBackgroundModel.getCompanyName());
        }
        if (null != companyGeneralBackgroundModel.getCompanyDescription()) {
            companyEntity.setCompanyDescription(companyGeneralBackgroundModel.getCompanyDescription());
        }
        if (null != companyGeneralBackgroundModel.getCity()) {
            companyEntity.setCity(companyGeneralBackgroundModel.getCity());
        }
        if (null != companyGeneralBackgroundModel.getStateId() && companyGeneralBackgroundModel.getStateId() > 0) {
            companyEntity.setStateId(companyGeneralBackgroundModel.getStateId());
        } else {
            companyEntity.setStateId(null);
        }
        if (null != companyGeneralBackgroundModel.getCountryId() && companyGeneralBackgroundModel.getCountryId() > 0) {
            companyEntity.setCountryId(companyGeneralBackgroundModel.getCountryId());
        } else {
            companyEntity.setCountryId(null);
        }
        if (null != companyGeneralBackgroundModel.getHomeStockExchangeListed()) {
            companyEntity.setStockExchangeListed(companyGeneralBackgroundModel.getHomeStockExchangeListed());
        }
        if (null != companyGeneralBackgroundModel.getHomeStockExchangeId() && companyGeneralBackgroundModel.getHomeStockExchangeId() > 0) {
            companyEntity.setHomeStockExchangeId(companyGeneralBackgroundModel.getHomeStockExchangeId());
        }
        if (null != companyGeneralBackgroundModel.getIndustrySectorId() && companyGeneralBackgroundModel.getIndustrySectorId() > 0) {
            companyEntity.setIndustrySectorId(companyGeneralBackgroundModel.getIndustrySectorId());
        }
        if (null != companyGeneralBackgroundModel.getIndustrySubsectorId() && companyGeneralBackgroundModel.getIndustrySubsectorId() > 0) {
            companyEntity.setIndustrySubsectorId(companyGeneralBackgroundModel.getIndustrySubsectorId());
        }
        if (null != companyGeneralBackgroundModel.getIsParentcompany()) {
            companyEntity.setIsParentcompany(companyGeneralBackgroundModel.getIsParentcompany());
        }
        if (null != companyGeneralBackgroundModel.getIsSubsidiary()) {
            companyEntity.setIsSubsidiary(companyGeneralBackgroundModel.getIsSubsidiary());
        }
        if (null != companyGeneralBackgroundModel.getIsJointventure()) {
            companyEntity.setIsJointventure(companyGeneralBackgroundModel.getIsJointventure());
        }
        if (null != companyGeneralBackgroundModel.getIsStandalone()) {
            companyEntity.setIsStandalone(companyGeneralBackgroundModel.getIsStandalone());
        }
        if (null != companyGeneralBackgroundModel.getIsFinancialYear()) {
            companyEntity.setIsFinancialYear(companyGeneralBackgroundModel.getIsFinancialYear());
        }
        if (null != companyGeneralBackgroundModel.getStartMonth()) {
            companyEntity.setStartMonth(companyGeneralBackgroundModel.getStartMonth());
        }
        if (null != companyGeneralBackgroundModel.getYearRepresentationId()) {
            companyEntity.setYearRepresentationId(companyGeneralBackgroundModel.getYearRepresentationId());
        }

        this.updateSecondaryIndustryList(companyId, companyGeneralBackgroundModel, user);
        this.updateCompanyStructureList(companyId, companyGeneralBackgroundModel, user);
        this.updateCompanyFacilityList(companyId, companyGeneralBackgroundModel, user);
        this.updateProductServicesList(companyId, companyGeneralBackgroundModel, user);

        companyEntity.setDateModified(new Date());
        companyEntity.setModifiedBy(user.getUsername());
        companyRepository.save(companyEntity);
        return getGeneralBackground(companyId);
    }

    private void updateCompanyFacilityList(Integer companyId, CompanyGeneralBackgroundModel companyGeneralBackgroundModel, CustomUserDetailsModel user) {
        if (companyGeneralBackgroundModel.getCompanyFacilityList() != null) {
            List<CompanyFacilityModel> listCompanyFacilityModel = companyGeneralBackgroundModel.getCompanyFacilityList();
            listCompanyFacilityModel.forEach(it -> {
                if (it.getFacilityId() != null) {
                    Optional<CompanyFacilityEntity> companyFacilityEntity = companyFacilityRepository.findById(it.getFacilityId());
                    if (companyFacilityEntity.isPresent()) {
                        companyFacilityEntity.get().setFacilityName(it.getFacilityName());
                        companyFacilityEntity.get().setFacilityCity(it.getFacilityCity());
                        if (it.getFacilityStateId() != null && it.getFacilityStateId() > 0) {
                            companyFacilityEntity.get().setFacilityStateId(it.getFacilityStateId());
                        } else {
                            companyFacilityEntity.get().setFacilityStateId(null);
                        }
                        if (it.getFacilityCountryId() != null && it.getFacilityCountryId() > 0) {
                            companyFacilityEntity.get().setFacilityCountryId(it.getFacilityCountryId());
                        } else {
                            companyFacilityEntity.get().setFacilityCountryId(null);
                        }
                        companyFacilityEntity.get().setFacilityAddress(it.getFacilityAddress());
                        if (it.getFacilityOwnerCompanyId() != null && it.getFacilityOwnerCompanyId() > 0) {
                            companyFacilityEntity.get().setFacilityOwnerCompanyId(it.getFacilityOwnerCompanyId());
                        } else {
                            companyFacilityEntity.get().setFacilityOwnerCompanyId(null);
                        }
                        if (it.getFacilityOperationCompanyId() != null && it.getFacilityOperationCompanyId() > 0) {
                            companyFacilityEntity.get().setFacilityOperationCompanyId(it.getFacilityOperationCompanyId());
                        } else {
                            companyFacilityEntity.get().setFacilityOperationCompanyId(null);
                        }

                        companyFacilityEntity.get().setDateModified(new Date());
                        companyFacilityEntity.get().setModifiedBy(user.getUsername());
                        companyFacilityRepository.save(companyFacilityEntity.get());
                    }
                } else {
                    CompanyFacilityEntity companyFacilityEntity = new CompanyFacilityEntity();
                    companyFacilityEntity.setFacilityName(it.getFacilityName());
                    companyFacilityEntity.setFacilityCity(it.getFacilityCity());
                    companyFacilityEntity.setFacilityStateId(it.getFacilityStateId());
                    companyFacilityEntity.setFacilityCountryId(it.getFacilityCountryId());
                    companyFacilityEntity.setFacilityAddress(it.getFacilityAddress());
                    companyFacilityEntity.setFacilityOwnerCompanyId(it.getFacilityOwnerCompanyId());
                    companyFacilityEntity.setFacilityOperationCompanyId(it.getFacilityOperationCompanyId());
                    companyFacilityEntity.setDateAdded(new Date());
                    companyFacilityEntity.setAddedBy(user.getUsername());
                    companyFacilityEntity.setCompanyId(companyId);
                    companyFacilityRepository.save(companyFacilityEntity);
                }
            });
        }
    }

    private void updateCompanyStructureList(Integer companyId, CompanyGeneralBackgroundModel companyGeneralBackgroundModel, CustomUserDetailsModel user) {
        if (companyGeneralBackgroundModel.getCompanyStructureList() != null) {
            List<CompanyStructureModel> listCompanyStructureModel = companyGeneralBackgroundModel.getCompanyStructureList();

            listCompanyStructureModel.forEach(it -> {
                if (it.getId() != null) {
                    Optional<CompanyStructureEntity> companyStructureEntity = companyStructureRepository.findById(it.getId());
                    if (companyStructureEntity.isPresent()) {
                        if (it.getRelCompanyId() != null && it.getRelCompanyId() > 0) {
                            companyStructureEntity.get().setRelCompanyId(it.getRelCompanyId());
                        } else if (it.getRelCompanyName() != null && !it.getRelCompanyName().isBlank()) {
                            var company = companyRepository.findByCompanyNameIgnoreCase(it.getRelCompanyName());
                            if (company.isEmpty()) {
                                CompanyEntity relCompany = createCompany(it.getRelCompanyName(),user);
                                companyStructureEntity.get().setRelCompanyId(relCompany.getCompanyId());
                            } else {
                                companyStructureEntity.get().setRelCompanyId(company.get(0).getCompanyId());
                            }
                        }
                        if (it.getRelCompanyCategoryId() != null && it.getRelCompanyCategoryId() > 0) {
                            companyStructureEntity.get().setRelCompanyCategoryId(it.getRelCompanyCategoryId());
                        } else {
                            companyStructureEntity.get().setRelCompanyCategoryId(null);
                        }
                        companyStructureEntity.get().setEconomicInterestPercentage(it.getEconomicInterestPercentage());
                        companyStructureEntity.get().setIsOperatingPoliciesControl(it.getIsOperatingPoliciesControl());
                        companyStructureEntity.get().setIsFinancialAccounting(it.getIsFinancialAccounting());
                        companyStructureEntity.get().setDateModified(new Date());
                        companyStructureEntity.get().setModifiedBy(user.getUsername());
                        companyStructureRepository.save(companyStructureEntity.get());
                    }
                } else {
                    CompanyStructureEntity companyStructureEntity = new CompanyStructureEntity();
                    if (it.getRelCompanyId() != null) {
                        companyStructureEntity.setRelCompanyId(it.getRelCompanyId());
                    } else if (it.getRelCompanyName() != null && !it.getRelCompanyName().isBlank()) {
                        var company = companyRepository.findByCompanyNameIgnoreCase(it.getRelCompanyName());
                        if (company.isEmpty()) {
                            CompanyEntity relCompany = createCompany(it.getRelCompanyName(),user);
                            companyStructureEntity.setRelCompanyId(relCompany.getCompanyId());
                        } else {
                            companyStructureEntity.setRelCompanyId(company.get(0).getCompanyId());
                        }
                    }
                    companyStructureEntity.setRelCompanyCategoryId(it.getRelCompanyCategoryId());
                    companyStructureEntity.setEconomicInterestPercentage(it.getEconomicInterestPercentage());
                    companyStructureEntity.setIsOperatingPoliciesControl(it.getIsOperatingPoliciesControl());
                    companyStructureEntity.setIsFinancialAccounting(it.getIsFinancialAccounting());
                    companyStructureEntity.setDateAdded(new Date());
                    companyStructureEntity.setAddedBy(user.getUsername());
                    companyStructureEntity.setCompanyId(companyId);
                    companyStructureRepository.save(companyStructureEntity);
                }
            });
        }
    }

    private void updateSecondaryIndustryList(Integer companyId, CompanyGeneralBackgroundModel companyGeneralBackgroundModel, CustomUserDetailsModel user) {
        if (companyGeneralBackgroundModel.getCompanySecondaryIndustrylist() != null) {
            List<CompanySecondaryIndustryModel> listCompanySecondaryIndustryModel = companyGeneralBackgroundModel.getCompanySecondaryIndustrylist();

            listCompanySecondaryIndustryModel.forEach(it -> {
                if (it.getId() != null) {
                    Optional<CompanySecondaryIndustryEntity> companySecondaryIndustryEntity = companySecondaryIndustryRepository.findById(it.getId());
                    if (companySecondaryIndustryEntity.isPresent()) {
                        companySecondaryIndustryEntity.get().setCity(it.getCity());
                        if (it.getCountryId() != null && it.getCountryId() > 0) {
                            companySecondaryIndustryEntity.get().setCountryId(it.getCountryId());
                        } else {
                            companySecondaryIndustryEntity.get().setCountryId(null);
                        }
                        if (it.getIndustrySectorId() != null && it.getIndustrySectorId() > 0) {
                            companySecondaryIndustryEntity.get().setIndustrySectorId(it.getIndustrySectorId());
                        } else {
                            companySecondaryIndustryEntity.get().setIndustrySectorId(null);
                        }
                        if (it.getIndustrySubsectorId() != null && it.getIndustrySubsectorId() > 0) {
                            companySecondaryIndustryEntity.get().setIndustrySubsectorId(it.getIndustrySubsectorId());
                        } else {
                            companySecondaryIndustryEntity.get().setIndustrySubsectorId(null);
                        }
                        companySecondaryIndustryEntity.get().setDateModified(new Date());
                        companySecondaryIndustryEntity.get().setModifiedBy(user.getUsername());
                        companySecondaryIndustryRepository.save(companySecondaryIndustryEntity.get());
                    }
                } else {
                    CompanySecondaryIndustryEntity companySecondaryIndustryEntity = new CompanySecondaryIndustryEntity();
                    companySecondaryIndustryEntity.setCity(it.getCity());
                    companySecondaryIndustryEntity.setCountryId(it.getCountryId());
                    companySecondaryIndustryEntity.setIndustrySectorId(it.getIndustrySectorId());
                    companySecondaryIndustryEntity.setIndustrySubsectorId(it.getIndustrySubsectorId());
                    companySecondaryIndustryEntity.setDateAdded(new Date());
                    companySecondaryIndustryEntity.setAddedBy(user.getUsername());
                    companySecondaryIndustryEntity.setCompanyId(companyId);
                    companySecondaryIndustryRepository.save(companySecondaryIndustryEntity);
                }
            });
        }
    }

    private void updateProductServicesList(Integer companyId,
                                           CompanyGeneralBackgroundModel companyGeneralBackgroundModel,
                                           CustomUserDetailsModel user) {

        List<Integer> listAllFacilityDataUnitIds = new ArrayList<>();
        if (companyGeneralBackgroundModel.getCompanyProductServicesList() != null) {
            List<CompanyProductServicesModel> listCompanyProductServicesModel
                    = companyGeneralBackgroundModel.getCompanyProductServicesList();
            listCompanyProductServicesModel.forEach(it -> {
                List<BigDecimal> totalQuantityList = new LinkedList<>();
                Integer refProdServId = 0;
                if (it.getRefProdServId() != null) {
                    Optional<RefProductServicesEntity> refProductServicesEntity =
                            this.refProductServicesRepository.findById(it.getRefProdServId());
                    if (refProductServicesEntity.isPresent()) {
                        refProdServId = it.getRefProdServId();
                    }
                }
                if (refProdServId == 0) {
                    Optional<RefProductServicesEntity> refProductServicesEntity =
                            this.refProductServicesRepository.findRefProductServicesEntityByProdServNameIgnoreCase(it.getProdServName());
                    if (refProductServicesEntity.isEmpty() && it.getProdServName() != null) {
                        RefProductServicesEntity refProductServicesEntityToBeSaved = new RefProductServicesEntity();
                        refProductServicesEntityToBeSaved.setProdServName(it.getProdServName());
                        refProductServicesEntityToBeSaved.setAddedBy(user.getUsername());
                        refProductServicesEntityToBeSaved.setDateAdded(new Date());
                        RefProductServicesEntity newRefProductServicesEntity
                                = this.refProductServicesRepository.save(refProductServicesEntityToBeSaved);
                        refProdServId = newRefProductServicesEntity.getId();
                    } else {
                        refProdServId = it.getRefProdServId();
                    }
                }

                CompanyProductServicesEntity companyProductServicesEntityUpdated = null;
                if (it.getId() != null) {
                    //Update
                    Optional<CompanyProductServicesEntity> companyProductServicesEntity
                            = companyProductServicesRepository.findById(it.getId());
                    if (companyProductServicesEntity.isPresent()) {
                        companyProductServicesEntity.get().setRefProdServId(refProdServId);
                        companyProductServicesEntity.get().setIsQuantPerFacility(it.getIsQuantPerFacility());
                        if (!it.getIsQuantPerFacility()) {
                            companyProductServicesEntity.get().setTotalQuantity(it.getTotalQuantity());
                            if (it.getTotalQuantityUnitId() != null && it.getTotalQuantityUnitId() > 0) {
                                companyProductServicesEntity.get().setTotalQuantityUnitId(it.getTotalQuantityUnitId());
                            } else if (it.getTotalQuantityUnitText() != null && !it.getTotalQuantityUnitText().isEmpty()) {
                                RefListEntity refListEntity =
                                        this.refListService.addNewRefListValue(user
                                                , REF_FACILITY_DATA_UNIT_KEY, it.getTotalQuantityUnitText());
                                companyProductServicesEntity.get().setTotalQuantityUnitId(refListEntity.getListId());
                            } else {
                                companyProductServicesEntity.get().setTotalQuantityUnitId(null);
                            }
                        }
                        companyProductServicesEntity.get().setDateModified(new Date());
                        companyProductServicesEntity.get().setModifiedBy(user.getUsername());
                        companyProductServicesEntityUpdated = companyProductServicesRepository.save(companyProductServicesEntity.get());
                    }
                } else {
                    //Insert
                    CompanyProductServicesEntity companyProductServicesEntity = new CompanyProductServicesEntity();
                    companyProductServicesEntity.setRefProdServId(refProdServId);
                    companyProductServicesEntity.setIsQuantPerFacility(it.getIsQuantPerFacility());
                    if (!it.getIsQuantPerFacility()) {
                        companyProductServicesEntity.setTotalQuantity(it.getTotalQuantity());
                        if (it.getTotalQuantityUnitId() != null && it.getTotalQuantityUnitId() > 0) {
                            companyProductServicesEntity.setTotalQuantityUnitId(it.getTotalQuantityUnitId());
                        } else if (it.getTotalQuantityUnitText() != null && !it.getTotalQuantityUnitText().isEmpty()) {
                            RefListEntity refListEntity =
                                    this.refListService.addNewRefListValue(user
                                            , REF_FACILITY_DATA_UNIT_KEY, it.getTotalQuantityUnitText());
                            companyProductServicesEntity.setTotalQuantityUnitId(refListEntity.getListId());
                        }
                    }
                    companyProductServicesEntity.setDateAdded(new Date());
                    companyProductServicesEntity.setAddedBy(user.getUsername());
                    companyProductServicesEntity.setCompanyId(companyId);
                    companyProductServicesEntityUpdated = companyProductServicesRepository.save(companyProductServicesEntity);
                }
                //Insert update facility Data
                if (it.getCompanyFacilityData() != null) {
                    CompanyProductServicesEntity finalCompanyProductServicesEntityUpdated = companyProductServicesEntityUpdated;
                    it.getCompanyFacilityData().forEach(row -> {
                        if (row.getId() != null) {
                            //Update
                            Optional<CompanyFacilityDataEntity> companyFacilityDataEntity
                                    = companyFacilityDataRepository.findById(row.getId());
                            if (companyFacilityDataEntity.isPresent()) {
                                companyFacilityDataEntity.get().setCompProdServId(finalCompanyProductServicesEntityUpdated.getId());
                                companyFacilityDataEntity.get().setFacilityId(row.getFacilityId());
                                companyFacilityDataEntity.get().setQuantity(row.getQuantity());
                                if (finalCompanyProductServicesEntityUpdated.getIsQuantPerFacility()) {
                                    companyFacilityDataEntity.get().setQuantity(row.getQuantity());
                                    if (row.getQuantityUnitId() != null && row.getQuantityUnitId() > 0) {
                                        companyFacilityDataEntity.get().setQuantityUnitId(row.getQuantityUnitId());
                                        listAllFacilityDataUnitIds.add(row.getQuantityUnitId());
                                    } else if (row.getQuantityUnitText() != null && !row.getQuantityUnitText().isBlank()) {
                                        RefListEntity refListEntity =
                                                this.refListService.addNewRefListValue(user, REF_FACILITY_DATA_UNIT_KEY, row.getQuantityUnitText());
                                        companyFacilityDataEntity.get().setQuantityUnitId(refListEntity.getListId());
                                        listAllFacilityDataUnitIds.add(refListEntity.getListId());
                                    } else {
                                        companyFacilityDataEntity.get().setQuantityUnitId(null);
                                    }
                                    totalQuantityList.add(row.getQuantity());
                                } else {
                                    companyFacilityDataEntity.get().setQuantityInPercentage(row.getQuantityInPercentage());
                                }
                                companyFacilityDataEntity.get().setDateModified(new Date());
                                companyFacilityDataEntity.get().setModifiedBy(user.getUsername());
                                this.companyFacilityDataRepository.save(companyFacilityDataEntity.get());
                            }
                        } else {
                            //Insert
                            CompanyFacilityDataEntity companyFacilityDataEntity = new CompanyFacilityDataEntity();
                            companyFacilityDataEntity.setCompProdServId(finalCompanyProductServicesEntityUpdated.getId());
                            companyFacilityDataEntity.setFacilityId(row.getFacilityId());
                            companyFacilityDataEntity.setQuantity(row.getQuantity());
                            if (finalCompanyProductServicesEntityUpdated.getIsQuantPerFacility()) {
                                companyFacilityDataEntity.setQuantity(row.getQuantity());
                                if (row.getQuantityUnitId() != null && row.getQuantityUnitId() > 0) {
                                    companyFacilityDataEntity.setQuantityUnitId(row.getQuantityUnitId());
                                    listAllFacilityDataUnitIds.add(row.getQuantityUnitId());
                                } else if (row.getQuantityUnitText() != null && !row.getQuantityUnitText().isBlank()) {
                                    RefListEntity refListEntity =
                                            this.refListService.addNewRefListValue(user, REF_FACILITY_DATA_UNIT_KEY, row.getQuantityUnitText());
                                    companyFacilityDataEntity.setQuantityUnitId(refListEntity.getListId());
                                    listAllFacilityDataUnitIds.add(refListEntity.getListId());
                                }
                                totalQuantityList.add(row.getQuantity());
                            } else {
                                companyFacilityDataEntity.setQuantityInPercentage(row.getQuantityInPercentage());
                            }
                            companyFacilityDataEntity.setDateModified(new Date());
                            companyFacilityDataEntity.setModifiedBy(user.getUsername());
                            this.companyFacilityDataRepository.save(companyFacilityDataEntity);
                        }
                    });
                } // End updating facility data
                if (companyProductServicesEntityUpdated != null && companyProductServicesEntityUpdated.getIsQuantPerFacility()) {
                    companyProductServicesEntityUpdated
                            .setTotalQuantity(totalQuantityList.stream().filter(Objects::nonNull).reduce(BigDecimal.ZERO, BigDecimal::add));
                    if (!listAllFacilityDataUnitIds.isEmpty()) {
                        if (listAllFacilityDataUnitIds.stream().distinct().count() == 1) {
                            companyProductServicesEntityUpdated.setTotalQuantityUnitId(listAllFacilityDataUnitIds.get(0).intValue());
                        } else {
                            companyProductServicesEntityUpdated.setTotalQuantityUnitId(
                                    this.refListRepository.findByListKeyAndListValueIgnoreCase
                                            (REF_FACILITY_DATA_UNIT_KEY, "Multiple").get().getListId()
                            );
                        }
                    }
                    this.companyProductServicesRepository.save(companyProductServicesEntityUpdated);
                }
            });
        }
    }

    public void deleteCompanySecondaryEntity(Integer Id) {
        companySecondaryIndustryRepository.deleteById(Id);
    }

    public void deleteCompanyStructureEntity(Integer Id) {
        companyStructureRepository.deleteById(Id);
    }

    public void deleteCompanyFacilityEntity(Integer Id) {
        companyFacilityRepository.deleteById(Id);
    }

    private void deleteCompanyFacilityDataEntity(Integer Id) {
        companyFacilityDataRepository.deleteById(Id);
    }

    public void deleteCompanyProductServicesEntity(Integer Id) {
        var obj = companyProductServicesRepository.findById(Id);
        if (obj.isPresent()) {
            if (obj.get().getCompanyFacilityData() != null) {
                obj.get().getCompanyFacilityData().forEach(it -> {
                    this.deleteCompanyFacilityDataEntity(it.getId());
                });
            }
            companyProductServicesRepository.deleteById(Id);
        }
    }

    public DataSetPercentageModel calculatePercentage(CustomUserDetailsModel user) {
        DataSetPercentageModel response = new DataSetPercentageModel();
        CompanyEntity entity = companyRepository.findById(user.getCompanyId()).orElse(null);
        List<String> missingFields = new ArrayList<>();
        int totalValues = 7;

        if (entity == null) {
            entity = new CompanyEntity();
        }

        if (entity.getCompanyName() == null || entity.getCompanyName().isEmpty()) {
            missingFields.add("companyName");
        }
        if (entity.getCompanyDescription() == null || entity.getCompanyDescription().isEmpty()) {
            missingFields.add("companyDescription");
        }
        if (entity.getCity() == null || entity.getCity().isEmpty()) {
            missingFields.add("city");
        }
        if (entity.getCountryId() == null) {
            missingFields.add("country");
        }
        if (entity.getStockExchangeListed() == null) {
            missingFields.add("stockExchangeListed");
        } else if (entity.getStockExchangeListed()) {
            ++totalValues;
            if (entity.getHomeStockExchangeId() == null) {
                missingFields.add("homeStockExchangeId");
            }
        }
        if (entity.getIndustrySectorId() == null) {
            missingFields.add("industrySectorId");
        }
        if (entity.getIndustrySubsectorId() == null) {
            missingFields.add("industrySubsectorId");
        }

        int nonNullValues = totalValues - missingFields.size();

        response.setGeneralBackgroundPercentageTotal(totalValues);
        response.setGeneralBackgroundPercentageCompleted(nonNullValues);
        response.setGeneralBackgroundMissingFields(missingFields);
        response.setGeneralBackgroundPercentage((int) Math.round((nonNullValues * 100.0) / totalValues));
        return response;
    }

    public void verifyCompanyStatusOrApplyNew(CustomUserDetailsModel user, DataEntryPortalSubmittedStatusEnum statusEnum) throws DataSetInReviewException, DataSetNotFoundException {
        companyRepository.findByCompanyId(
                user.getCompanyId()).ifPresentOrElse(company -> {
            if (company.getCompanyStatus() != null && company.getCompanyStatus().getStatusId().compareTo(DataEntryPortalSubmittedStatusEnum.SUBMITTED_REVIEW.getStatus()) == 0) {
                throw new ApiException(ExceptionContent.SUBMIT_IN_REVIEW, HttpStatus.BAD_REQUEST);
            } else if (statusEnum != null) {
                company.setStatusId(statusEnum.getStatus());
                company.setStatusDate(new Timestamp(new Date().getTime()));
                company.setDateModified(new Date());
                company.setModifiedBy(user.getUsername());
                companyRepository.save(company);
            }
        }, () -> {
            throw new ApiException(ExceptionContent.SUBMIT_DATASET_NOT_FOUND, HttpStatus.BAD_REQUEST);
        });
    }

    public boolean isCompanyStatusAccepted(Integer companyId) {
        return companyRepository.findByCompanyId(companyId).map(CompanyEntity::getCompanyStatus)
                .map(status -> DataEntryPortalSubmittedStatusEnum.ACCEPTED.getStatus().equals(status.getStatusId()))
                .orElse(false);
    }

    public boolean isCompanyStatusChainAvailable(Integer companyId) {
        return companyRepository.findByCompanyId(companyId).map(CompanyEntity::getCompanyStatus)
                .map(status -> DataEntryPortalSubmittedStatusEnum.SUBMITTED_REVIEW.getStatus().equals(status.getStatusId()))
                .orElse(false);
    }

    public CheckExistingDomainResponse checkIfEmailDomainExists(String email) {
        String[] emailSplit = email.split("@");
        CheckExistingDomainResponse response = new CheckExistingDomainResponse();
        if (emailSplit.length > 1) {
            CompanyEntity companyEntity = companyRepository.findByCompanyDomain(emailSplit[1]);
            if (null != companyEntity) {
                response.setCompanyId(companyEntity.getCompanyId());
                response.setCompanyDescription(companyEntity.getCompanyDescription());
                response.setCompanyName(companyEntity.getCompanyName());
                response.setProductSelectionId(companyEntity.getProductSelectionId());
                response.setProductSelectionName(null != companyEntity.getProductSelection() ? companyEntity.getProductSelection().getName() : "");
            }
        }
        return response;
    }

    public CompanyEntity checkExistingCompanyDomainByEmailOrReturnNew(Integer companyId, String email) {
        CompanyEntity companyEntity;
        if (null != companyId) {
            companyEntity = companyRepository.findById(companyId).orElse(new CompanyEntity());
        } else {
            // TODO Refactor here to get from frontend company id to join
            CheckExistingDomainResponse checkExistingDomainResponse = checkIfEmailDomainExists(email);
            if (null != checkExistingDomainResponse.getCompanyId()) {
                companyEntity = companyRepository.findById(checkExistingDomainResponse.getCompanyId())
                        .orElse(new CompanyEntity());
            } else {
                companyEntity = new CompanyEntity();
            }
        }
        String emailDomain = email.split("@")[1];
        // check if we receive an email with a different domain than the domain registered for company for which should join
        if (null != companyEntity.getCompanyDomain() && !companyEntity.getCompanyDomain().equalsIgnoreCase(emailDomain)) {
            throw new ApiException(ExceptionContent.REGISTRATION_EMAIL_DOMAIN_IS_DIFFERENT, HttpStatus.BAD_REQUEST);
        }
        return companyEntity;
    }

    public List<CompanyEntity> selectSuppliers(final String companyName, final CustomUserDetailsModel user) {
        return companyRepository.findAvailableSuppliers(companyName,user.getCompanyId());
    }

}
