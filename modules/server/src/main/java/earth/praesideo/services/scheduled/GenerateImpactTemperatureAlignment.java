package earth.praesideo.services.scheduled;

import earth.praesideo.database.entities.impactperformance.ImpactTemperatureAlignment;
import earth.praesideo.database.entities.impactperformance.TemperatureAlignmentRecordType;
import earth.praesideo.database.entities.tech.AppLogEntity;
import earth.praesideo.database.entities.tech.AppLogType;
import earth.praesideo.database.entities.users.CompanyEntity;
import earth.praesideo.database.repositories.impactperformance.ImpactTemperatureAlignmentRepository;
import earth.praesideo.database.repositories.users.CompanyRepository;
import earth.praesideo.database.repositories.users.UserPropertiesRepository;
import earth.praesideo.services.AnalyticsJobService;
import earth.praesideo.services.tech.AppLogService;
import earth.praesideo.utils.StringUtils;
import lombok.RequiredArgsConstructor;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import java.sql.Timestamp;
import java.time.Year;
import java.util.Date;
import java.util.List;
import java.util.Optional;

@RequiredArgsConstructor
@Component
public class GenerateImpactTemperatureAlignment {
    private static final Logger LOGGER = LoggerFactory.getLogger(GenerateImpactTemperatureAlignment.class);
    private final AppLogService appLogService;
    private final AnalyticsJobService analyticsJobService;
    private final ImpactTemperatureAlignmentRepository impactTemperatureAlignmentRepository;
    private final CompanyRepository companyRepository;
    private final UserPropertiesRepository propertiesRepository;
    private final int STATUS_ID_ELIGIBLE_FOR_ANALYTICS_RUN = 4;
    private final String SCHEDULED_ANALYTICS_RUN_ENABLED = "SCHEDULED_ANALYTICS_RUN_ENABLED";

    @Scheduled(cron = "${temperature.alignment.run.cronjob}")
    public void scheduledRun() {

        var userPropertiesEntity = propertiesRepository.findFirstByKey(SCHEDULED_ANALYTICS_RUN_ENABLED);
        var isEnabled = false;
        if (userPropertiesEntity.isPresent()) {
            isEnabled = (userPropertiesEntity.get().getValue().toLowerCase().equals("yes"));
        }
        if (isEnabled) {
            generateImpactTemperatureAlignment();
        }
    }

    public void generateImpactTemperatureAlignment() {

        List<CompanyEntity> allEligibleCompanies = this.companyRepository.findByStatusId(STATUS_ID_ELIGIBLE_FOR_ANALYTICS_RUN);
        boolean isGenerateImpactTemperatureAlignment;
        for (CompanyEntity row : allEligibleCompanies) {
            isGenerateImpactTemperatureAlignment = false;
            Optional<ImpactTemperatureAlignment> ta = this.impactTemperatureAlignmentRepository.
                    findByKeyOrganisationCompanyIdAndKeyYearAndKeyRecordTypeAndKeyIsScenarioAndKeyIsSupplyChainAggregated(row.getCompanyId(),
                            Year.now().getValue(),
                            TemperatureAlignmentRecordType.TEMPERATURE_ALIGNMENT,
                            false,
                            false);
            if (!ta.isPresent()) {
                isGenerateImpactTemperatureAlignment = true;
            } else {
                if (ta.get().getLastCalculationDate() != null && row.getStatusDate() != null) {
                    Timestamp lastCalculatedDate = Timestamp.valueOf(ta.get().getLastCalculationDate().toString());
                    isGenerateImpactTemperatureAlignment = (lastCalculatedDate.before(row.getStatusDate()));
                }
            }
            if (isGenerateImpactTemperatureAlignment) {
                try {
                    analyticsJobService.runAnalyticJob(row.getCompanyId(), false, false);
                } catch (Exception ex) {
                    LOGGER.error("Generate Temperature Alignment failed with this exception: {}", ex.getMessage());
                    appLogService.addAppLog(this.buildImpactTemperatureAlignmentExceptionLogEntity(row, StringUtils.exceptionToString(ex)));
                }
            }
        }
    }

    private AppLogEntity buildImpactTemperatureAlignmentExceptionLogEntity(CompanyEntity company, String exceptionMessage) {
        AppLogEntity appLogEntity = new AppLogEntity();
        appLogEntity.setLogType(AppLogType.GENERATE_IMPACT_TEMPERATURE_ALIGNMENT);
        appLogEntity.setAdditionalinfoDatetime1(new Date());
        appLogEntity.setLogValue(exceptionMessage);
        appLogEntity.setAdditionalInfoInt1(company.getCompanyId());
        appLogEntity.setAdditionalInfoString1(company.getCompanyName());
        String additionalInfoString2 = "Parameters:"
                .concat(" CompanyId=".concat(company.getCompanyId().toString()))
                .concat(", CompanyName=").concat(company.getCompanyName()
                        .concat(", isScenario=false")
                        .concat(", isAggregated=false"));
        appLogEntity.setAdditionalInfoString2(additionalInfoString2);
        return appLogEntity;
    }
}
