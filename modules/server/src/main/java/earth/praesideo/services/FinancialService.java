package earth.praesideo.services;

import earth.praesideo.database.entities.users.UserFinancialDetailsEntity;
import earth.praesideo.database.repositories.users.UserFinancialDetailsRepository;
import earth.praesideo.models.restapi.auth.FinancialInfoApiModel;
import earth.praesideo.models.restapi.datasets.DataSetPercentageModel;
import earth.praesideo.models.security.CustomUserDetailsModel;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class FinancialService {

    private final UserFinancialDetailsRepository userFinancialDetailsRepository;
    private final ProductService                 productService;

    @Autowired
    public FinancialService(UserFinancialDetailsRepository userFinancialDetailsRepository,
                            ProductService productService) {
        this.userFinancialDetailsRepository = userFinancialDetailsRepository;
        this.productService = productService;
    }

    public FinancialInfoApiModel changeFinancialInformation(final FinancialInfoApiModel financialInfoApiModel) {
        UserFinancialDetailsEntity userFinancialDetailsEntity = null != financialInfoApiModel.getUserFinancialDetailId()
                ? userFinancialDetailsRepository
                .findById(financialInfoApiModel.getUserFinancialDetailId())
                .orElse(new UserFinancialDetailsEntity())
                : new UserFinancialDetailsEntity();

        userFinancialDetailsEntity.setYearRepresentationId(financialInfoApiModel.getRepresentationYearId());
        userFinancialDetailsEntity.setIsFinancialYear(financialInfoApiModel.getIsFinancialYear());

        if (null != financialInfoApiModel.getBaseCurrencyId()) {
            userFinancialDetailsEntity.setBaseCurrencyId(financialInfoApiModel.getBaseCurrencyId());
        }
        if (null != financialInfoApiModel.getStartMonth()) {
            userFinancialDetailsEntity.setStartMonth(financialInfoApiModel.getStartMonth());
        }
        if (null != financialInfoApiModel.getRevenue()) {
            userFinancialDetailsEntity.setRevenue(financialInfoApiModel.getRevenue());
        }
        if (null != financialInfoApiModel.getNetProfit()) {
            userFinancialDetailsEntity.setNetProfit(financialInfoApiModel.getNetProfit());
        }
        if (null == userFinancialDetailsEntity.getCompanyId()) {
            userFinancialDetailsEntity.setCompanyId(financialInfoApiModel.getCompanyId());
        }

        userFinancialDetailsEntity = userFinancialDetailsRepository.save(userFinancialDetailsEntity);

        return createFinancialDetailsObject(userFinancialDetailsEntity);
    }

    public FinancialInfoApiModel getFinancialInformation(Integer companyId) {
        UserFinancialDetailsEntity userFinancialDetailsEntity = userFinancialDetailsRepository.findByCompany_CompanyId(companyId);
        return createFinancialDetailsObject(null != userFinancialDetailsEntity ? userFinancialDetailsEntity : new UserFinancialDetailsEntity());
    }

    private FinancialInfoApiModel createFinancialDetailsObject(UserFinancialDetailsEntity userFinancialDetailsEntity) {
        FinancialInfoApiModel response = new FinancialInfoApiModel();
        response.setUserFinancialDetailId(userFinancialDetailsEntity.getUserFinancialDetailId());
        response.setStartMonth(userFinancialDetailsEntity.getStartMonth());
        response.setBaseCurrencyId(userFinancialDetailsEntity.getBaseCurrencyId());
        response.setCompanyId(userFinancialDetailsEntity.getCompanyId());
        response.setIsFinancialYear(userFinancialDetailsEntity.getIsFinancialYear());
        response.setRepresentationYearId(userFinancialDetailsEntity.getYearRepresentationId());
        response.setRevenue(userFinancialDetailsEntity.getRevenue());
        response.setNetProfit(userFinancialDetailsEntity.getNetProfit());

        return response;
    }

    public DataSetPercentageModel calculatePercentage(CustomUserDetailsModel user) {
        DataSetPercentageModel response = new DataSetPercentageModel();
        List<String> missingFields = new ArrayList<>();
        UserFinancialDetailsEntity entity = userFinancialDetailsRepository.findByCompany_CompanyId(user.getCompanyId());
        int totalValues = 3;

        if (entity == null) {
            entity = new UserFinancialDetailsEntity();
        }

        if (entity.getIsFinancialYear() == null) {
            missingFields.add("isFinancialYear");
        } else if (entity.getIsFinancialYear()) {
            ++totalValues;
            if (entity.getStartMonth() == null) {
                missingFields.add("startMonth");
            }
        }
        if (entity.getBaseCurrencyId() == null) {
            missingFields.add("baseCurrencyId");
        }
        if (entity.getYearRepresentationId() == null) {
            missingFields.add("yearRepresentationId");
        }

        if (!productService.isImpactMeasurementOnlySubscription(user.getCompanyId())) {
            ++totalValues;
            if (entity.getRevenue() == null) {
                missingFields.add("revenue");
            }
            ++totalValues;
            if (entity.getNetProfit() == null) {
                missingFields.add("netProfit");
            }
        }

        int nonNullValues = totalValues - missingFields.size();

        response.setFinancialInformationPercentageTotal(totalValues);
        response.setFinancialInformationPercentageCompleted(nonNullValues);
        response.setFinancialInformationMissingFields(missingFields);
        response.setFinancialInformationPercentage((int) Math.round((nonNullValues * 100.0) / totalValues));
        return response;
    }

}
