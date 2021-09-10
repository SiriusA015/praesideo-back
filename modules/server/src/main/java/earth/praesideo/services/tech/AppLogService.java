package earth.praesideo.services.tech;

import earth.praesideo.database.entities.tech.AppLogEntity;
import earth.praesideo.database.entities.tech.AppLogType;
import earth.praesideo.database.repositories.tech.AppLogRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;

@Service
public class AppLogService {

    private final AppLogRepository repository;

    @Autowired
    public AppLogService(AppLogRepository repository) {
        this.repository = repository;
    }

    public void addSuccessfulEmailRegistrationLog(String email, AppLogType appLogType) {
        AppLogEntity logEntity = new AppLogEntity();
        logEntity.setLogType(appLogType);
        logEntity.setAdditionalinfoDatetime1(new Date());
        logEntity.setLogValue("Delivered");
        logEntity.setAdditionalInfoString1("Successful");
        logEntity.setAdditionalInfoString2(email);

        repository.save(logEntity);
    }

    public void addFailedEmailRegistrationLog(String exception, String email, AppLogType appLogType) {
        AppLogEntity logEntity = new AppLogEntity();
        logEntity.setLogType(appLogType);
        logEntity.setAdditionalinfoDatetime1(new Date());
        logEntity.setLogValue(exception);
        logEntity.setAdditionalInfoString1("Failed");
        logEntity.setAdditionalInfoString2(email);

        repository.save(logEntity);
    }

    public void addFailedAnalyticRunLog(String exception) {
        AppLogEntity logEntity = new AppLogEntity();
        logEntity.setLogType(AppLogType.TEMPERATURE_ALIGNMENT);
        logEntity.setAdditionalinfoDatetime1(new Date());
        logEntity.setLogValue(exception);
        logEntity.setAdditionalInfoString1("Failed");
        repository.save(logEntity);
    }

    public void addFailedFileUpload(String exception, String email, String fileName) {
        AppLogEntity logEntity = new AppLogEntity();
        logEntity.setLogType(AppLogType.FILE_UPLOAD);
        logEntity.setAdditionalinfoDatetime1(new Date());
        logEntity.setLogValue(exception);
        logEntity.setAdditionalInfoString1("Failed");
        logEntity.setAdditionalInfoString2(email);
        logEntity.setAdditionalInfoString3(fileName);
        repository.save(logEntity);
    }

    public void addFailedRequestLog(final AppLogType logType, final String exception) {
        AppLogEntity logEntity = new AppLogEntity();
        logEntity.setLogType(logType);
        logEntity.setAdditionalinfoDatetime1(new Date());
        logEntity.setLogValue(exception);
        logEntity.setAdditionalInfoString1("Failed");
        repository.save(logEntity);
    }

    public void addFailedRequestLog(final AppLogType logType, final String exception, final String additionalInfoString2) {
        AppLogEntity logEntity = new AppLogEntity();
        logEntity.setLogType(logType);
        logEntity.setAdditionalinfoDatetime1(new Date());
        logEntity.setLogValue(exception);
        logEntity.setAdditionalInfoString1("Failed");
        logEntity.setAdditionalInfoString1(additionalInfoString2);
        repository.save(logEntity);
    }

    public void addAppLog(AppLogEntity appLogEntity) {
        repository.save(appLogEntity);
    }
}
