package earth.praesideo.services;

import earth.praesideo.services.tech.AppLogService;
import earth.praesideo.utils.StringUtils;
import lombok.AllArgsConstructor;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import java.io.*;

@Service
@AllArgsConstructor
public class AnalyticsJobService {
    private static final Logger LOGGER = LoggerFactory.getLogger(AnalyticsJobService.class);

    private final AppLogService appLogService;

    public void runAnalyticJob(final Integer organisationId, final boolean isScenario, final boolean isAggregated) {
        StringBuilder exceptionMessage = new StringBuilder();
        int exitValue;
        try {
            String scenario = isScenario ? " -s" : "";
            String aggregated = isAggregated ? " -a" : "";
            String preparedPath = "/usr/bin/python3 /temperature_alignment/libs/run_script.py -id " + organisationId + scenario + aggregated;
            ProcessBuilder ps = new ProcessBuilder("bash", "-c", preparedPath);
            Process pr = ps.start();

            try (BufferedReader in = new BufferedReader(new InputStreamReader(pr.getErrorStream()))) {
                String line;
                while ((line = in.readLine()) != null) {
                    exceptionMessage.append(line);
                    LOGGER.info("stream error: " + line);
                }
            }
            exitValue = pr.waitFor();
            if (exitValue != 0) {
                LOGGER.error("exitValue error: " + exceptionMessage.toString());
                appLogService.addFailedAnalyticRunLog(exceptionMessage.toString());
                pr.destroy();
            }
        } catch (IOException | InterruptedException ex) {
            LOGGER.error("could not exec: " + StringUtils.exceptionToString(ex));
            appLogService.addFailedAnalyticRunLog(StringUtils.exceptionToString(ex));
        }
    }
}
