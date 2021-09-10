package earth.praesideo.controllers.analytic;

import earth.praesideo.services.AnalyticsJobService;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

/**
 * @author Koshman Vadim
 */

@RequiredArgsConstructor
@RestController
@RequestMapping("/api/analytic")
public class AnalyticRestController {

    private final AnalyticsJobService jobService;

    @PostMapping("run")
    public void runAnalyticJob(@RequestParam(name = "organisationId") Integer organisationId,
                                        @RequestParam(name = "scenario", required = false, defaultValue = "false") boolean isScenario,
                                        @RequestParam(name = "aggregated", required = false, defaultValue = "false") boolean isAggregated
    ) {
        jobService.runAnalyticJob(
                organisationId,
                isScenario,
                isAggregated
        );
    }
}
