package earth.praesideo.services;

import earth.praesideo.database.entities.datasets.*;
import earth.praesideo.database.entities.users.UserEntity;
import earth.praesideo.database.repositories.datasets.*;
import earth.praesideo.exceptions.DataSetInReviewException;
import earth.praesideo.models.restapi.datasets.DataSetGhgInventoryMethodModel;
import earth.praesideo.models.restapi.datasets.DataSetPercentageModel;
import earth.praesideo.models.restapi.datasets.DataSetRecentYearEmissionsModel;
import earth.praesideo.models.security.CustomUserDetailsModel;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Set;
import java.util.stream.Collectors;

@Service
public class InventoryService {

    private final DataSetGhgInventoryMethodOperationalBoundaryRepository dataSetGhgInventoryMethodOperationalBoundaryRepository;
    private final DataSetGhgInventoryMethodRepository dataSetGhgInventoryMethodRepository;
    private final DataSetRecentYearEmissionsRepository dataSetRecentYearEmissionsRepository;
    private final DataSetRecentYearEmissionsSourceRepository dataSetRecentYearEmissionsSourceRepository;
    private final DataSetRecentYearEmissionsCarbonCreditsCategoryRepository dataSetRecentYearEmissionsCarbonCreditsCategoryRepository;
    private final DataSetRecentYearEmissionsCarbonCreditsCategoryTypeRepository dataSetRecentYearEmissionsCarbonCreditsCategoryTypeRepository;
    private final UsersService usersService;
    private final CompanyService companyService;

    @Autowired
    public InventoryService(DataSetGhgInventoryMethodOperationalBoundaryRepository dataSetGhgInventoryMethodOperationalBoundaryRepository,
                            DataSetGhgInventoryMethodRepository dataSetGhgInventoryMethodRepository,
                            DataSetRecentYearEmissionsRepository dataSetRecentYearEmissionsRepository,
                            DataSetRecentYearEmissionsSourceRepository dataSetRecentYearEmissionsSourceRepository,
                            DataSetRecentYearEmissionsCarbonCreditsCategoryRepository dataSetRecentYearEmissionsCarbonCreditsCategoryRepository,
                            DataSetRecentYearEmissionsCarbonCreditsCategoryTypeRepository dataSetRecentYearEmissionsCarbonCreditsCategoryTypeRepository,
                            UsersService usersService, CompanyService companyService) {
        this.dataSetGhgInventoryMethodOperationalBoundaryRepository = dataSetGhgInventoryMethodOperationalBoundaryRepository;
        this.dataSetGhgInventoryMethodRepository = dataSetGhgInventoryMethodRepository;
        this.dataSetRecentYearEmissionsRepository = dataSetRecentYearEmissionsRepository;
        this.dataSetRecentYearEmissionsSourceRepository = dataSetRecentYearEmissionsSourceRepository;
        this.dataSetRecentYearEmissionsCarbonCreditsCategoryRepository = dataSetRecentYearEmissionsCarbonCreditsCategoryRepository;
        this.dataSetRecentYearEmissionsCarbonCreditsCategoryTypeRepository = dataSetRecentYearEmissionsCarbonCreditsCategoryTypeRepository;
        this.usersService = usersService;
        this.companyService = companyService;
    }

    public DataSetGhgInventoryMethodModel getGhgInventoryMethod(CustomUserDetailsModel user) {
        DataSetGhgInventoryMethodModel response = new DataSetGhgInventoryMethodModel();
        response.setDataSetGhgInventoryMethod(dataSetGhgInventoryMethodRepository.findFirstByCompanyCompanyId(
                user.getCompanyId()));
        return response;
    }

    @Transactional
    public DataSetGhgInventoryMethodModel saveGhgInventoryMethod(CustomUserDetailsModel user, DataSetGhgInventoryMethodModel data) throws DataSetInReviewException {
        companyService.verifyCompanyStatusOrApplyNew(user, null);
        DataSetGhgInventoryMethodEntity entity = dataSetGhgInventoryMethodRepository.findFirstByCompanyCompanyId(
                user.getCompanyId());

        if (null == entity) {
            entity = new DataSetGhgInventoryMethodEntity();
            entity.setDateAdded(new Date());
            entity.setAddedBy(user.getUsername());
        } else {
            entity.setDateModified(new Date());
            entity.setModifiedBy(user.getUsername());
        }

        if (data.getDataSetGhgInventoryMethod().getIsGhgInventoryPresent() != null && !data.getDataSetGhgInventoryMethod().getIsGhgInventoryPresent()) {
            data.getDataSetGhgInventoryMethod().setOtherEmissionsInventoryMethod(null);
            data.getDataSetGhgInventoryMethod().setOrganisationalBoundaryId(null);
            data.getDataSetGhgInventoryMethod().setOrganisationalBoundaryCriteriaId(null);
            data.getDataSetGhgInventoryMethod().setAuditingValidationId(null);
            data.getDataSetGhgInventoryMethod().setEmissionsInventoryMethodId(null);
            data.getDataSetGhgInventoryMethod().setAuditingValidationOther(null);
            data.getDataSetGhgInventoryMethod().setDataSetGhgInventoryMethodOperationalBoundaries(null);

            DataSetRecentYearEmissionsModel yearEmissionsModel = new DataSetRecentYearEmissionsModel();
            yearEmissionsModel.setRecentYearEmissions(new DataSetRecentYearEmissionsEntity());
            //yearEmissionsModel.getRecentYearEmissions().setIsHistoricalEmissions(true);
            //saveYearEmissions(user, yearEmissionsModel);
            yearEmissionsModel.getRecentYearEmissions().setIsHistoricalEmissions(false);
            saveYearEmissions(user, yearEmissionsModel);
        }

        entity.setOtherEmissionsInventoryMethod(data.getDataSetGhgInventoryMethod().getOtherEmissionsInventoryMethod());
        entity.setOrganisationalBoundaryId(data.getDataSetGhgInventoryMethod().getOrganisationalBoundaryId());
        entity.setOrganisationalBoundaryCriteriaId(data.getDataSetGhgInventoryMethod().getOrganisationalBoundaryCriteriaId());
        entity.setAuditingValidationId(data.getDataSetGhgInventoryMethod().getAuditingValidationId());
        entity.setEmissionsInventoryMethodId(data.getDataSetGhgInventoryMethod().getEmissionsInventoryMethodId());
        entity.setAuditingValidationOther(data.getDataSetGhgInventoryMethod().getAuditingValidationOther());
        entity.setIsGhgInventoryPresent(data.getDataSetGhgInventoryMethod().getIsGhgInventoryPresent());

        if (entity.getGhgInventoryMethodEntityId() == null) {
            UserEntity userEntity = usersService.getUserFromDatabase(user.getUsername());
            entity.setCompany(userEntity.getCompany());
        }

        if (null != entity.getDataSetGhgInventoryMethodOperationalBoundaries()) {
            dataSetGhgInventoryMethodOperationalBoundaryRepository.deleteAll(
                    entity.getDataSetGhgInventoryMethodOperationalBoundaries());
        }

        entity.setDataSetGhgInventoryMethodOperationalBoundaries(null);

        if (null != data.getDataSetGhgInventoryMethod().getDataSetGhgInventoryMethodOperationalBoundaries() &&
                !data.getDataSetGhgInventoryMethod().getDataSetGhgInventoryMethodOperationalBoundaries().isEmpty()) {

            List<DataSetGhgInventoryMethodOperationalBoundaryEntity> toBeSaved = new ArrayList<>();

            for (DataSetGhgInventoryMethodOperationalBoundaryEntity b : data.getDataSetGhgInventoryMethod()
                    .getDataSetGhgInventoryMethodOperationalBoundaries()) {
                b.setGhgInventoryMethodEntityId(entity.getGhgInventoryMethodEntityId());
                if (b.getGhgInventoryMethodEntityOperationalBoundaryId() == null) {
                    b.setDateAdded(new Date());
                    b.setAddedBy(user.getUsername());
                } else {
                    b.setDateModified(new Date());
                    b.setModifiedBy(user.getUsername());
                }
                toBeSaved.add(b);
            }
            entity.setDataSetGhgInventoryMethodOperationalBoundaries(toBeSaved);
        }
        dataSetGhgInventoryMethodRepository.save(entity);
        return getGhgInventoryMethod(user);
    }


    public DataSetPercentageModel calculateGhgInventoryMethodPercentage(CustomUserDetailsModel user) {
        DataSetPercentageModel response = new DataSetPercentageModel();
        List<String> missingFields = new ArrayList<>();
        DataSetGhgInventoryMethodEntity entity = dataSetGhgInventoryMethodRepository
                .findFirstByCompanyCompanyId(user.getCompanyId());
        int totalValues = 3;

        if (entity == null) {
            entity = new DataSetGhgInventoryMethodEntity();
        }

        if (entity.getIsGhgInventoryPresent() != null && !entity.getIsGhgInventoryPresent()) {
            response.setGhgInventoryMethodPercentageTotal(totalValues);
            response.setGhgInventoryMethodPercentageCompleted(totalValues);
            response.setGhgInventoryMethodMissingFields(missingFields);
            response.setGhgInventoryMethodPercentage(100);

            return response;
        }

        if (entity.getEmissionsInventoryMethodId() == null) {
            missingFields.add("emissionsInventoryMethodId");
        } else if (entity.getEmissionsInventoryMethodId() == 0) {
            ++totalValues;
            if (entity.getOtherEmissionsInventoryMethod() == null || entity.getOtherEmissionsInventoryMethod().isEmpty()) {
                missingFields.add("otherEmissionsInventoryMethod");
            }
        }
        if (entity.getOrganisationalBoundaryId() == null) {
            missingFields.add("organisationalBoundaryId");
        } else if (entity.getOrganisationalBoundaryId() == 2) {
            ++totalValues;
            if (entity.getOrganisationalBoundaryCriteriaId() == null) {
                missingFields.add("organisationalBoundaryCriteriaId");
            }
        }
        if (!usersService.hasImpactMeasurementSubscription(user.getCompanyId())) {
            if (entity.getAuditingValidationId() == null) {
                missingFields.add("auditingValidationId");
            } else if (entity.getAuditingValidationId() == 1) {
                ++totalValues;
                if (entity.getAuditingValidationOther() == null || entity.getAuditingValidationOther().isEmpty()) {
                    missingFields.add("auditingValidationOther");
                }
            }
        }

        int nonNullValues = totalValues - missingFields.size();

        response.setGhgInventoryMethodPercentageTotal(totalValues);
        response.setGhgInventoryMethodPercentageCompleted(nonNullValues);
        response.setGhgInventoryMethodMissingFields(missingFields);
        response.setGhgInventoryMethodPercentage((int) Math.round((nonNullValues * 100.0) / totalValues));
        return response;
    }

    public DataSetRecentYearEmissionsModel getYearEmissions(CustomUserDetailsModel user,
                                                            Integer yearRepresentationId) {
        DataSetRecentYearEmissionsModel response = new DataSetRecentYearEmissionsModel();
        response.setRecentYearEmissions(dataSetRecentYearEmissionsRepository
                .findFirstByCompanyCompanyIdAndYearRepresentationYearRepresentationId(
                        user.getCompanyId(), yearRepresentationId).orElseGet(DataSetRecentYearEmissionsEntity::new));
        return response;
    }

    @Transactional
    public DataSetRecentYearEmissionsModel saveYearEmissions(CustomUserDetailsModel user, DataSetRecentYearEmissionsModel data) throws DataSetInReviewException {
        companyService.verifyCompanyStatusOrApplyNew(user, null);
        DataSetRecentYearEmissionsEntity entity = dataSetRecentYearEmissionsRepository
                .findFirstByCompanyCompanyIdAndYearRepresentationYearRepresentationId(user.getCompanyId(), data.getRecentYearEmissions().getYearRepresentationId())
                .orElseGet(DataSetRecentYearEmissionsEntity::new);

        DataSetGhgInventoryMethodEntity ghgInventoryMethodEntity = dataSetGhgInventoryMethodRepository
                .findFirstByCompanyCompanyId(user.getCompanyId());

        if (ghgInventoryMethodEntity != null && ghgInventoryMethodEntity.getIsGhgInventoryPresent() != null &&
                !ghgInventoryMethodEntity.getIsGhgInventoryPresent()) {

            data.getRecentYearEmissions().setFinancialYearStartMonth(null);
            data.getRecentYearEmissions().setIsFinancialYear(null);
            data.getRecentYearEmissions().setYearRepresentationId(null);
            data.getRecentYearEmissions().setScope1(null);
            data.getRecentYearEmissions().setScope2(null);
            data.getRecentYearEmissions().setScope2Method(null);
            data.getRecentYearEmissions().setScope3(null);
            data.getRecentYearEmissions().setParticipationOfCarbonCreditsOrCertificates(null);
            data.getRecentYearEmissions().setRecentYearEmissionsSources(null);
            data.getRecentYearEmissions().setRecentYearEmissionsCarbonCreditsCategories(null);
        }

        entity.setFinancialYearStartMonth(data.getRecentYearEmissions().getFinancialYearStartMonth());
        entity.setIsFinancialYear(data.getRecentYearEmissions().getIsFinancialYear());
        entity.setYearRepresentationId(data.getRecentYearEmissions().getYearRepresentationId());
        entity.setScope1(data.getRecentYearEmissions().getScope1());
        entity.setScope2(data.getRecentYearEmissions().getScope2());
        entity.setScope3(data.getRecentYearEmissions().getScope3());
        entity.setScope2Method(data.getRecentYearEmissions().getScope2Method());
        entity.setIsHistoricalEmissions(data.getRecentYearEmissions().getIsHistoricalEmissions());
        entity.setParticipationOfCarbonCreditsOrCertificates(data.getRecentYearEmissions().getParticipationOfCarbonCreditsOrCertificates());

        // set data set current not submitted record
        if (entity.getRecentYearEmissionsId() == null) {
            UserEntity userEntity = usersService.getUserFromDatabase(user.getUsername());
            entity.setCompany(userEntity.getCompany());
        }

        //if we have saved previously emissions sources, we remove them
        if (null != entity.getRecentYearEmissionsSources()) {
            dataSetRecentYearEmissionsSourceRepository.deleteAll(entity.getRecentYearEmissionsSources());
            entity.setRecentYearEmissionsSources(null);
        }
        if (entity.getRecentYearEmissionsId() == null) {
            entity.setDateAdded(new Date());
            entity.setAddedBy(user.getUsername());
        } else {
            entity.setDateModified(new Date());
            entity.setModifiedBy(user.getUsername());
        }
        //save recent year emissions in order to get an ID if current record is a new one
        dataSetRecentYearEmissionsRepository.save(entity);

        //add new emissions sources
        if (null != data.getRecentYearEmissions().getRecentYearEmissionsSources() &&
                !data.getRecentYearEmissions().getRecentYearEmissionsSources().isEmpty()) {
            List<DataSetRecentYearEmissionsSourceEntity> toBeSaved = new ArrayList<>();
            for (DataSetRecentYearEmissionsSourceEntity b : data.getRecentYearEmissions()
                    .getRecentYearEmissionsSources()) {
                b.setRecentYearEmissionsId(entity.getRecentYearEmissionsId());
                if (b.getRecentYearEmissionsSourceIs() == null) {
                    b.setDateAdded(new Date());
                    b.setAddedBy(user.getUsername());
                } else {
                    b.setDateModified(new Date());
                    b.setModifiedBy(user.getUsername());
                }
                toBeSaved.add(b);
            }
            dataSetRecentYearEmissionsSourceRepository.saveAll(toBeSaved);
        }

        // if we have previously saved carbon credit categories, we need to delete them first along with all their childs
        if (null != entity.getRecentYearEmissionsCarbonCreditsCategories()) {

            // first we remote every carbon credit category and carbon credit category type entity
            for (DataSetRecentYearEmissionsCarbonCreditsCategoryEntity carbonCreditsCategory : entity.getRecentYearEmissionsCarbonCreditsCategories()) {
                if (carbonCreditsCategory.getRecentYearEmissionsCarbonCreditsCategoryTypes() != null) {

                    dataSetRecentYearEmissionsCarbonCreditsCategoryTypeRepository.deleteAll(
                            carbonCreditsCategory.getRecentYearEmissionsCarbonCreditsCategoryTypes());
                    carbonCreditsCategory.setRecentYearEmissionsCarbonCreditsCategoryTypes(null);
                }
            }
            dataSetRecentYearEmissionsCarbonCreditsCategoryRepository.deleteAll(entity.getRecentYearEmissionsCarbonCreditsCategories());
            entity.setRecentYearEmissionsCarbonCreditsCategories(null);
        }

        // if we have received carbon credit categories and participation field is true, we need to save them first along with all their childs
        if (data.getRecentYearEmissions().getParticipationOfCarbonCreditsOrCertificates() != null &&
                data.getRecentYearEmissions().getParticipationOfCarbonCreditsOrCertificates() &&
                null != data.getRecentYearEmissions().getRecentYearEmissionsCarbonCreditsCategories() &&
                !data.getRecentYearEmissions().getRecentYearEmissionsCarbonCreditsCategories().isEmpty()) {

            for (DataSetRecentYearEmissionsCarbonCreditsCategoryEntity b : data.getRecentYearEmissions()
                    .getRecentYearEmissionsCarbonCreditsCategories()) {
                b.setRecentYearEmissionsId(entity.getRecentYearEmissionsId());
                if (b.getRecentYearEmissionsCarbonCreditCategoryIs() == null) {
                    b.setDateAdded(new Date());
                    b.setAddedBy(user.getUsername());
                } else {
                    b.setDateModified(new Date());
                    b.setModifiedBy(user.getUsername());
                }
                dataSetRecentYearEmissionsCarbonCreditsCategoryRepository.save(b);
                if (null != b.getRecentYearEmissionsCarbonCreditsCategoryTypes() &&
                        !b.getRecentYearEmissionsCarbonCreditsCategoryTypes().isEmpty()) {
                    for (DataSetRecentYearEmissionsCarbonCreditsCategoryTypeEntity categoryType : b.getRecentYearEmissionsCarbonCreditsCategoryTypes()) {
                        if (categoryType.getRecentYearEmissionsCarbonCreditCategoryTypeIs() == null) {
                            categoryType.setDateAdded(new Date());
                            categoryType.setAddedBy(user.getUsername());
                        } else {
                            categoryType.setDateModified(new Date());
                            categoryType.setModifiedBy(user.getUsername());
                        }
                        categoryType.setRecentYearEmissionsCarbonCreditsCategory(b);
                        dataSetRecentYearEmissionsCarbonCreditsCategoryTypeRepository.save(categoryType);
                    }
                }
            }
        }
        return getYearEmissions(user, data.getRecentYearEmissions().getYearRepresentationId());
    }

    public DataSetPercentageModel calculateInventoryEmissionsPercentage(CustomUserDetailsModel user) {
        DataSetPercentageModel response = new DataSetPercentageModel();

        DataSetRecentYearEmissionsEntity entity = dataSetRecentYearEmissionsRepository
                .findFirstByCompanyCompanyIdAndYearRepresentationYearRepresentationId(
                        user.getCompanyId(), user.getYearRepresentationId()).orElseGet(DataSetRecentYearEmissionsEntity::new);

        DataSetPercentageModel entityResponse = calculateInventoryEmissionsPercentage(user, entity);

        Integer percentage = entityResponse.getInventoryEmissionsPercentage();
        List<String> missingFields = entityResponse.getInventoryEmissionsMissingFields();

        response.setInventoryEmissionsPercentage(percentage);
        response.setInventoryEmissionsPercentageTotal(entityResponse.getInventoryEmissionsPercentageTotal());
        response.setInventoryEmissionsPercentageCompleted(entityResponse.getInventoryEmissionsPercentageCompleted());
        response.setInventoryEmissionsMissingFields(missingFields);

        return response;
    }

    private DataSetPercentageModel calculateInventoryEmissionsPercentage(CustomUserDetailsModel user, DataSetRecentYearEmissionsEntity entity) {
        DataSetPercentageModel response = new DataSetPercentageModel();
        List<String> missingFields = new ArrayList<>();
        int totalValues = 5;

        if (entity == null) {
            entity = new DataSetRecentYearEmissionsEntity();
        }

        DataSetGhgInventoryMethodEntity entityInventory = dataSetGhgInventoryMethodRepository
                .findFirstByCompanyCompanyId(user.getCompanyId());

        if (entityInventory != null && entityInventory.getIsGhgInventoryPresent() != null && !entityInventory.getIsGhgInventoryPresent()) {
            response.setInventoryEmissionsPercentageTotal(totalValues);
            response.setInventoryEmissionsPercentageCompleted(totalValues);
            response.setInventoryEmissionsMissingFields(missingFields);
            response.setInventoryEmissionsPercentage(100);

            return response;
        }

        if (entity.getYearRepresentationId() == null) {
            missingFields.add("yearRepresentationId");
        }
        if (entity.getIsFinancialYear() == null) {
            missingFields.add("isFinancialYear");
        } else if (entity.getIsFinancialYear()) {
            ++totalValues;
            if (entity.getFinancialYearStartMonth() == null) {
                missingFields.add("financialYearStartMonth");
            }
        }
        if (entity.getScope1() == null) {
            missingFields.add("scope1");
        }
        if (entity.getScope2() == null) {
            missingFields.add("scope2");
        }
        if (entity.getScope3() == null) {
            missingFields.add("scope3");
        }

        //number of emissions sources must match the number of method operational boundaries
        if (null != entityInventory && null != entityInventory.getDataSetGhgInventoryMethodOperationalBoundaries()) {
            Set<Integer> operationalBoundaries = entityInventory.getDataSetGhgInventoryMethodOperationalBoundaries()
                    .stream()
                    .map(DataSetGhgInventoryMethodOperationalBoundaryEntity::getOperationalBoundaryId)
                    .collect(Collectors.toUnmodifiableSet());

            totalValues += operationalBoundaries.size();
            operationalBoundaries.forEach(o -> missingFields.add("sourceValue" + o));
        }

        if (entity.getRecentYearEmissionsSources() != null && !entity.getRecentYearEmissionsSources().isEmpty()) {
            for (DataSetRecentYearEmissionsSourceEntity sourceEntity : entity.getRecentYearEmissionsSources()) {
                if (sourceEntity.getSourceValue() != null) {
                    missingFields.remove("sourceValue" + sourceEntity.getOperationalBoundaryId());
                }
            }
        }

        if (null != entity.getParticipationOfCarbonCreditsOrCertificates() && entity.getParticipationOfCarbonCreditsOrCertificates()) {
            if (null != entity.getRecentYearEmissionsCarbonCreditsCategories() && !entity.getRecentYearEmissionsCarbonCreditsCategories().isEmpty()) {

                // we add to total number of values the size of the category list multiply by 4: category type and three other fields (quantity, cost, certification body)
                totalValues += entity.getRecentYearEmissionsCarbonCreditsCategories().size();

                for (DataSetRecentYearEmissionsCarbonCreditsCategoryEntity carbonCreditsCategoryEntity : entity.getRecentYearEmissionsCarbonCreditsCategories()) {
                    if (carbonCreditsCategoryEntity.getCarbonCreditCategoryId() == null) {
                        missingFields.add("carbonCreditCategoryId");
                    }

                    if (null != carbonCreditsCategoryEntity.getRecentYearEmissionsCarbonCreditsCategoryTypes() &&
                            !carbonCreditsCategoryEntity.getRecentYearEmissionsCarbonCreditsCategoryTypes().isEmpty()) {
                        totalValues += carbonCreditsCategoryEntity.getRecentYearEmissionsCarbonCreditsCategoryTypes().size() * 3;

                        for (DataSetRecentYearEmissionsCarbonCreditsCategoryTypeEntity categoryTypeEntity : carbonCreditsCategoryEntity.getRecentYearEmissionsCarbonCreditsCategoryTypes()) {
                            if (categoryTypeEntity.getQuantity() == null) {
                                missingFields.add("quantity");
                            }
                            if (categoryTypeEntity.getCost() == null) {
                                missingFields.add("cost");
                            }
                            if (categoryTypeEntity.getCertificationBody() == null) {
                                missingFields.add("certificationBody");
                            }
                        }
                    }
                }
            } else {
                //if participation in carbon credit certificates is true then at least one category should be ticked
                totalValues += 4;
            }
        }

        int nonNullValues = totalValues - missingFields.size();

        response.setInventoryEmissionsPercentageTotal(totalValues);
        response.setInventoryEmissionsPercentageCompleted(nonNullValues);
        response.setInventoryEmissionsMissingFields(missingFields);
        response.setInventoryEmissionsPercentage((int) Math.round((nonNullValues * 100.0) / totalValues));
        return response;
    }

}
