package earth.praesideo.services;

import earth.praesideo.database.entities.datasets.*;
import earth.praesideo.database.entities.users.UserEntity;
import earth.praesideo.database.repositories.common.YearRepresentationRepository;
import earth.praesideo.database.repositories.datasets.DataSetEmissionsReductionRepository;
import earth.praesideo.database.repositories.datasets.DataSetEmissionsReductionTargetsRepository;
import earth.praesideo.exceptions.DataSetInReviewException;
import earth.praesideo.models.restapi.datasets.DataSetEmissionsReductionModel;
import earth.praesideo.models.restapi.datasets.DataSetPercentageModel;
import earth.praesideo.models.security.CustomUserDetailsModel;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.math.BigDecimal;
import java.math.RoundingMode;
import java.util.*;

@Service
public class EmissionService {

    private final YearRepresentationRepository yearRepresentationRepository;
    private final DataSetEmissionsReductionRepository dataSetEmissionsReductionRepository;
    private final DataSetEmissionsReductionTargetsRepository dataSetEmissionsReductionTargetsRepository;
    private final UsersService usersService;
    private final CompanyService companyService;

    @Autowired
    public EmissionService(YearRepresentationRepository yearRepresentationRepository,
                           DataSetEmissionsReductionRepository dataSetEmissionsReductionRepository,
                           DataSetEmissionsReductionTargetsRepository dataSetEmissionsReductionTargetsRepository,
                           UsersService usersService, CompanyService companyService) {
        this.yearRepresentationRepository = yearRepresentationRepository;
        this.dataSetEmissionsReductionRepository = dataSetEmissionsReductionRepository;
        this.dataSetEmissionsReductionTargetsRepository = dataSetEmissionsReductionTargetsRepository;
        this.usersService = usersService;
        this.companyService = companyService;
    }

    public DataSetEmissionsReductionModel getEmissionsReduction(CustomUserDetailsModel user) {
        DataSetEmissionsReductionModel response = new DataSetEmissionsReductionModel();
        response.setEmissionsReduction(dataSetEmissionsReductionRepository
                .findFirstByCompanyCompanyId(user.getCompanyId()));
        return response;
    }

    @Transactional
    public DataSetEmissionsReductionModel saveEmissionsReduction(CustomUserDetailsModel user, DataSetEmissionsReductionModel data) throws DataSetInReviewException {
        companyService.verifyCompanyStatusOrApplyNew(user, null);
        DataSetEmissionsReductionEntity entity = dataSetEmissionsReductionRepository
                .findFirstByCompanyCompanyId(user.getCompanyId());

        if (null == entity) {
            entity = new DataSetEmissionsReductionEntity();
            entity.setDateAdded(new Date());
            entity.setAddedBy(user.getUsername());
        }
        else {
            entity.setDateModified(new Date());
            entity.setModifiedBy(user.getUsername());
        }

        if (data.getEmissionsReduction().getIsEmissionsReductionPresent() != null
                && !data.getEmissionsReduction().getIsEmissionsReductionPresent()) {
            data.getEmissionsReduction().setScope1(null);
            data.getEmissionsReduction().setScope2(null);
            data.getEmissionsReduction().setScope3(null);
            data.getEmissionsReduction().setIsFinancialYear(null);
            data.getEmissionsReduction().setYearRepresentationId(null);
            data.getEmissionsReduction().setFinancialYearStartMonth(null);
            data.getEmissionsReduction().setYearRepresentation(null);
            data.getEmissionsReduction().setEmissionsReductionTargets(null);
            data.getEmissionsReduction().setEmissionsReductionShortTerms(null);
        }

        entity.setScope1(data.getEmissionsReduction().getScope1());
        entity.setScope2(data.getEmissionsReduction().getScope2());
        entity.setScope3(data.getEmissionsReduction().getScope3());
        entity.setIsEmissionsReductionPresent(data.getEmissionsReduction().getIsEmissionsReductionPresent());
        entity.setIsFinancialYear(data.getEmissionsReduction().getIsFinancialYear());
        entity.setYearRepresentationId(data.getEmissionsReduction().getYearRepresentationId());
        entity.setFinancialYearStartMonth(data.getEmissionsReduction().getFinancialYearStartMonth());

        if (entity.getEmissionsReductionId() == null) {
            UserEntity userEntity = usersService.getUserFromDatabase(user.getUsername());
            entity.setCompany(userEntity.getCompany());
        }

        entity.setEmissionsReductionTargets(null);
        entity.setEmissionsReductionShortTerms(null);

        dataSetEmissionsReductionTargetsRepository.deleteAllByEmissionsReductionId(entity.getEmissionsReductionId());

        if (data.getEmissionsReduction().getEmissionsReductionTargets() != null &&
                !data.getEmissionsReduction().getEmissionsReductionTargets().isEmpty()) {

            List<DataSetEmissionsReductionTargetsEntity> reductionTargetsToBeSaved = new ArrayList<>();
            Set<DataSetEmissionsReductionShortTermEntity> shortTermsToBeSaved = new HashSet<>();

            for (DataSetEmissionsReductionTargetsEntity reductionTarget : data.getEmissionsReduction().getEmissionsReductionTargets()) {
                reductionTarget.setEmissionsReductionId(entity.getEmissionsReductionId());
                reductionTargetsToBeSaved.add(reductionTarget);
                if (reductionTarget.getTargetTypeId() != null && reductionTarget.getEmissionsReductionTargetScopeId() != null) {
                    DataSetEmissionsReductionShortTermEntity reductionShortTerm = new DataSetEmissionsReductionShortTermEntity();
                    reductionShortTerm.setDateAdded(new Date());
                    reductionShortTerm.setAddedBy(user.getUsername());
                    reductionShortTerm.setEmissionsReductionId(reductionTarget.getEmissionsReductionId());
                    reductionShortTerm.setEmissionsReductionTargetScopeId(reductionTarget.getEmissionsReductionTargetScopeId());
                    reductionShortTerm.setTargetTypeId(reductionTarget.getTargetTypeId());
                    reductionShortTerm.setIsAssumedSubstitution(false);
                    shortTermsToBeSaved.add(reductionShortTerm);
                }
            }
            if (data.getEmissionsReduction().getEmissionsReductionShortTerms() != null &&
                    !data.getEmissionsReduction().getEmissionsReductionShortTerms().isEmpty()) {
                for (DataSetEmissionsReductionShortTermEntity shortTerm : data.getEmissionsReduction().getEmissionsReductionShortTerms()) {
                    if (shortTermsToBeSaved.contains(shortTerm)) {
                        shortTermsToBeSaved.remove(shortTerm);
                        calculateAssumedSubstitution(entity, shortTerm, reductionTargetsToBeSaved);
                        shortTermsToBeSaved.add(shortTerm);
                    }
                }
            }
            entity.setEmissionsReductionTargets(reductionTargetsToBeSaved);
            entity.setEmissionsReductionShortTerms(shortTermsToBeSaved);
        }
        dataSetEmissionsReductionRepository.save(entity);
        return getEmissionsReduction(user);
    }


    private void calculateAssumedSubstitution(DataSetEmissionsReductionEntity entity, DataSetEmissionsReductionShortTermEntity shortTerm,
                                              List<DataSetEmissionsReductionTargetsEntity> reductionTargets) {
        if (shortTerm.getIsAssumedSubstitution() == null || !shortTerm.getIsAssumedSubstitution()) {
            return;
        }

        shortTerm.setTargetReductionShortTermPlan1(null);
        shortTerm.setTargetReductionShortTermPlan2(null);
        shortTerm.setTargetReductionShortTermPlan3(null);
        shortTerm.setTargetReductionShortTermPlan4(null);

        if (entity != null && entity.getYearRepresentationId() != null) {
            Integer baseLineYear = yearRepresentationRepository.getOne(entity.getYearRepresentationId()).getCalendarYear();
            Integer targetYear = Integer.MAX_VALUE;
            Integer reduction = 0;

            for (DataSetEmissionsReductionTargetsEntity reductionTarget : reductionTargets) {
                if (isReductionTarget(shortTerm, reductionTarget, targetYear)) {
                    targetYear = reductionTarget.getTargetYear();
                    reduction = reductionTarget.getTargetReductionPercentage();
                }
            }

            if (baseLineYear != null && targetYear != null && targetYear > baseLineYear && reduction != null && reduction > 0) {
                Double shortTermReduction = (1.0 * reduction) / (targetYear - baseLineYear);

                BigDecimal bd = new BigDecimal(Double.toString(shortTermReduction));
                shortTermReduction = bd.setScale(2, RoundingMode.HALF_UP).doubleValue();

                shortTerm.setTargetReductionShortTermPlan1(shortTermReduction);
                shortTerm.setTargetReductionShortTermPlan2(shortTermReduction);
                shortTerm.setTargetReductionShortTermPlan3(shortTermReduction);
                shortTerm.setTargetReductionShortTermPlan4(shortTermReduction);
            }
        }
    }

    private boolean isReductionTarget(DataSetEmissionsReductionShortTermEntity shortTerm, DataSetEmissionsReductionTargetsEntity reductionTarget, Integer targetYear) {
        return shortTerm.getTargetTypeId().equals(reductionTarget.getTargetTypeId()) &&
                shortTerm.getEmissionsReductionTargetScopeId().equals(reductionTarget.getEmissionsReductionTargetScopeId()) &&
                reductionTarget.getTargetYear() != null && reductionTarget.getTargetYear() < targetYear;
    }

    public DataSetPercentageModel calculatePercentage(CustomUserDetailsModel user) {
        int totalValues = 5;
        DataSetPercentageModel response = new DataSetPercentageModel();
        List<String> missingFields = new ArrayList<>();
        DataSetEmissionsReductionEntity entity = dataSetEmissionsReductionRepository
                .findFirstByCompanyCompanyId(user.getCompanyId());


        if (entity == null) {
            entity = new DataSetEmissionsReductionEntity();
        }

        if (entity.getIsEmissionsReductionPresent() != null && !entity.getIsEmissionsReductionPresent()) {
            response.setGhgTargetSettingPercentageTotal(totalValues);
            response.setGhgTargetSettingPercentageCompleted(totalValues);
            response.setGhgTargetSettingMissingFields(missingFields);
            response.setGhgTargetSettingPercentage(100);

            return response;
        }

        if (!usersService.hasImpactMeasurementSubscription(user.getCompanyId())) {
            if (entity.getScope1() == null) {
                missingFields.add("scope1");
            }
            if (entity.getScope2() == null) {
                missingFields.add("scope2");
            }
            if (entity.getScope3() == null) {
                missingFields.add("scope3");
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

            if (null != entity.getEmissionsReductionTargets() && !entity.getEmissionsReductionTargets().isEmpty()) {
                totalValues += entity.getEmissionsReductionTargets().size() * 4;

                for (DataSetEmissionsReductionTargetsEntity reductionTarget : entity.getEmissionsReductionTargets()) {
                    if (reductionTarget.getEmissionsReductionTargetScopeId() == null) {
                        missingFields.add("emissionsReductionTargetScopeId");
                    }
                    if (reductionTarget.getTargetTypeId() == null) {
                        missingFields.add("targetTypeId");
                    }
                    if (reductionTarget.getTargetReductionPercentage() == null) {
                        missingFields.add("targetReductionPercentage");
                    }
                    if (reductionTarget.getTargetYear() == null) {
                        missingFields.add("targetYear");
                    }
                }

                if (entity.getEmissionsReductionShortTerms() != null &&
                        !entity.getEmissionsReductionShortTerms().isEmpty()) {
                    for (DataSetEmissionsReductionShortTermEntity shortTerm : entity
                            .getEmissionsReductionShortTerms()) {
                        if (shortTerm.getIsAssumedSubstitution() == null || !shortTerm.getIsAssumedSubstitution()) {
                            totalValues += 4;
                            if (shortTerm.getTargetReductionShortTermPlan1() == null) {
                                missingFields.add("targetReductionShortTermPlan1");
                            }
                            if (shortTerm.getTargetReductionShortTermPlan2() == null) {
                                missingFields.add("targetReductionShortTermPlan2");
                            }
                            if (shortTerm.getTargetReductionShortTermPlan3() == null) {
                                missingFields.add("targetReductionShortTermPlan3");
                            }
                            if (shortTerm.getTargetReductionShortTermPlan4() == null) {
                                missingFields.add("targetReductionShortTermPlan4");
                            }
                        }
                    }
                }
            }
        }

        int nonNullValues = totalValues - missingFields.size();

        response.setGhgTargetSettingPercentageTotal(totalValues);
        response.setGhgTargetSettingPercentageCompleted(nonNullValues);
        response.setGhgTargetSettingMissingFields(missingFields);
        response.setGhgTargetSettingPercentage((int) Math.round((nonNullValues * 100.0) / totalValues));
        return response;
    }

}
