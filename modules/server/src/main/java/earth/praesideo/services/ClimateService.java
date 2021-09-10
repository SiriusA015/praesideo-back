package earth.praesideo.services;

import earth.praesideo.database.entities.datasets.DataSetClimateMechanismsInfluenceEntity;
import earth.praesideo.database.entities.datasets.DataSetClimateMechanismsInfluenceMetricEntity;
import earth.praesideo.database.entities.users.UserEntity;
import earth.praesideo.database.repositories.datasets.DataSetClimateMechanismsInfluenceMetricRepository;
import earth.praesideo.database.repositories.datasets.DataSetClimateMechanismsInfluenceRepository;
import earth.praesideo.exceptions.DataSetInReviewException;
import earth.praesideo.models.restapi.datasets.DataSetClimateMechanismsInfluenceModel;
import earth.praesideo.models.restapi.datasets.DataSetPercentageModel;
import earth.praesideo.models.security.CustomUserDetailsModel;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.*;

@Service
public class ClimateService {

    private final DataSetClimateMechanismsInfluenceRepository dataSetClimateMechanismsInfluenceRepository;
    private final DataSetClimateMechanismsInfluenceMetricRepository dataSetClimateMechanismsInfluenceMetricRepository;
    private final UsersService usersService;
    private final CompanyService companyService;
    private final ProductService productService;

    public ClimateService(DataSetClimateMechanismsInfluenceRepository dataSetClimateMechanismsInfluenceRepository,
                          DataSetClimateMechanismsInfluenceMetricRepository dataSetClimateMechanismsInfluenceMetricRepository,
                          UsersService usersService, CompanyService companyService,
                          ProductService productService) {
        this.dataSetClimateMechanismsInfluenceRepository = dataSetClimateMechanismsInfluenceRepository;
        this.dataSetClimateMechanismsInfluenceMetricRepository = dataSetClimateMechanismsInfluenceMetricRepository;
        this.usersService = usersService;
        this.companyService = companyService;
        this.productService = productService;
    }

    public DataSetClimateMechanismsInfluenceModel getClimateMechanismInfluence(CustomUserDetailsModel user) {
        DataSetClimateMechanismsInfluenceModel response = new DataSetClimateMechanismsInfluenceModel();
        DataSetClimateMechanismsInfluenceEntity climateMechanismsInfluence = dataSetClimateMechanismsInfluenceRepository
                .findFirstByCompanyCompanyId(user.getCompanyId());

        if (climateMechanismsInfluence == null) {
            climateMechanismsInfluence = new DataSetClimateMechanismsInfluenceEntity();
        }

        if (climateMechanismsInfluence.getClimateMechanismsInfluenceMetrics() == null ||
                climateMechanismsInfluence.getClimateMechanismsInfluenceMetrics().isEmpty()) {
            climateMechanismsInfluence.setClimateMechanismsInfluenceMetrics(Collections.singletonList(
                    new DataSetClimateMechanismsInfluenceMetricEntity()));
        }

        response.setClimateMechanismsInfluence(climateMechanismsInfluence);
        return response;
    }

    @Transactional
    public DataSetClimateMechanismsInfluenceModel saveClimateMechanismsInfluence(CustomUserDetailsModel user, DataSetClimateMechanismsInfluenceModel data) throws DataSetInReviewException {
        companyService.verifyCompanyStatusOrApplyNew(user, null);
        DataSetClimateMechanismsInfluenceEntity entity = dataSetClimateMechanismsInfluenceRepository
                .findFirstByCompanyCompanyId(user.getCompanyId());

        if (null == entity) {
            entity = new DataSetClimateMechanismsInfluenceEntity();
            entity.setDateAdded(new Date());
            entity.setAddedBy(user.getUsername());
        } else {
            entity.setDateModified(new Date());
            entity.setModifiedBy(user.getUsername());
        }

        entity.setInternalCarbonPriceUsed(data.getClimateMechanismsInfluence().getInternalCarbonPriceUsed());
        entity.setCarbonPrice(data.getClimateMechanismsInfluence().getCarbonPrice());
        entity.setBaseCurrencyId(data.getClimateMechanismsInfluence().getBaseCurrencyId());
        entity.setCarbonPriceCoverageId(data.getClimateMechanismsInfluence().getCarbonPriceCoverageId());
        entity.setCarbonPriceCoverageTypeId(data.getClimateMechanismsInfluence().getCarbonPriceCoverageTypeId());
        entity.setClimateMechanismInfluenceId(data.getClimateMechanismsInfluence().getClimateMechanismInfluenceId());
        entity.setClimateMechanismsInfluenceMetrics(null);

        if (entity.getClimateMechanismInfluenceId() == null) {
            UserEntity userEntity = usersService.getUserFromDatabase(user.getUsername());
            entity.setCompany(userEntity.getCompany());
            dataSetClimateMechanismsInfluenceRepository.save(entity);
        }

        dataSetClimateMechanismsInfluenceMetricRepository.deleteByClimateMechanismInfluenceId(entity.getClimateMechanismInfluenceId());

        entity.setClimateMechanismsInfluenceMetrics(null);

        if (data.getClimateMechanismsInfluence().getClimateMechanismsInfluenceMetrics() != null) {
            List<DataSetClimateMechanismsInfluenceMetricEntity> metricsToBeSaved = new ArrayList<>();

            for (DataSetClimateMechanismsInfluenceMetricEntity metric : data.getClimateMechanismsInfluence().getClimateMechanismsInfluenceMetrics()) {
                metric.setClimateMechanismInfluenceId(entity.getClimateMechanismInfluenceId());
                if (metric.getClimateMechanismInfluenceMetricId() == null) {
                    metric.setDateAdded(new Date());
                    metric.setAddedBy(user.getUsername());
                } else {
                    metric.setDateModified(new Date());
                    metric.setModifiedBy(user.getUsername());
                }
                metricsToBeSaved.add(metric);
            }
            entity.setClimateMechanismsInfluenceMetrics(metricsToBeSaved);
        }
        dataSetClimateMechanismsInfluenceRepository.save(entity);
        return getClimateMechanismInfluence(user);
    }

    public DataSetPercentageModel calculatePercentage(CustomUserDetailsModel user) {
        DataSetPercentageModel response = new DataSetPercentageModel();
        List<String> missingFields = new ArrayList<>();
        DataSetClimateMechanismsInfluenceEntity entity = dataSetClimateMechanismsInfluenceRepository
                .findFirstByCompanyCompanyId(user.getCompanyId());
        int totalValues = 1;

        if (entity == null) {
            entity = new DataSetClimateMechanismsInfluenceEntity();
        }

        if (!productService.isImpactMeasurementOnlySubscription(user.getCompanyId())) {
            if (entity.getInternalCarbonPriceUsed() != null && entity.getInternalCarbonPriceUsed()) {
                totalValues += 4;
                if (entity.getBaseCurrencyId() == null) {
                    missingFields.add("baseCurrencyId");
                }
                if (entity.getCarbonPriceCoverageId() == null) {
                    missingFields.add("carbonPriceCoverageId");
                }
                if (entity.getCarbonPriceCoverageTypeId() == null) {
                    missingFields.add("carbonPriceCoverageTypeId");
                }
                if (entity.getCarbonPrice() == null) {
                    missingFields.add("carbonPrice");
                }
            }

            Optional<DataSetClimateMechanismsInfluenceMetricEntity> optionalMetric = Optional.empty();

            if (entity.getClimateMechanismsInfluenceMetrics() != null &&
                    !entity.getClimateMechanismsInfluenceMetrics().isEmpty()) {
                optionalMetric = entity.getClimateMechanismsInfluenceMetrics().stream()
                        .filter(m -> m != null && m.getBusinessAssociation() != null &&
                                !m.getBusinessAssociation().isEmpty())
                        .findAny();
            }

            if (optionalMetric.isEmpty()) {
                missingFields.add("climateMechanismsInfluenceMetrics");
            }
        }

        int nonNullValues = totalValues - missingFields.size();

        response.setClimateMetricsPercentageTotal(totalValues);
        response.setClimateMetricsPercentageCompleted(nonNullValues);
        response.setClimateMetricsMissingFields(missingFields);
        response.setClimateMetricsPercentage((int) Math.round((nonNullValues * 100.0) / totalValues));
        return response;
    }
}
