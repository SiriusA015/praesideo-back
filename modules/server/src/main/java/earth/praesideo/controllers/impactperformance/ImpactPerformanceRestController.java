package earth.praesideo.controllers.impactperformance;

import earth.praesideo.controllers.BaseController;
import earth.praesideo.database.entities.impactperformance.TemperatureAlignmentRecordType;
import earth.praesideo.exceptions.ApiException;
import earth.praesideo.exceptions.ExceptionContent;
import earth.praesideo.exceptions.TemperatureAlignmentNotFoundException;
import earth.praesideo.models.restapi.impactperformance.*;
import earth.praesideo.services.ImpactTemperatureAlignmentService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDate;
import java.util.List;
import java.util.Optional;

@RequiredArgsConstructor
@RestController
@RequestMapping("/api/impactperformance")
public class ImpactPerformanceRestController extends BaseController {

    private final ImpactTemperatureAlignmentService impactTemperatureAlignmentService;

    @GetMapping("years")
    public List<Integer> getYears(@RequestParam(name = "organisationId", required = false) Optional<Integer> organisationId,
                                  @RequestParam(name = "adjusted", required = false, defaultValue = "false") boolean riskAdjusted,
                                  @RequestParam(name = "scenario", required = false, defaultValue = "false") boolean isScenario,
                                  @RequestParam(name = "aggregated", required = false, defaultValue = "false") boolean isSupplychainAggregated
    ) {
        var user = getLoggedInUser().orElseThrow(() -> new ApiException(ExceptionContent.USER_NOT_FOUND, HttpStatus.BAD_REQUEST));
        return impactTemperatureAlignmentService.getImpactPerformanceYears(
                organisationId.orElseGet(user::getCompanyId),
                riskAdjusted
                        ? TemperatureAlignmentRecordType.RISK_ADJUSTED_TEMPERATURE_ALIGNMENT
                        : TemperatureAlignmentRecordType.TEMPERATURE_ALIGNMENT,
                isScenario,
                isSupplychainAggregated
        );
    }

    @GetMapping
    public TemperatureAlignmentDto getTemperatureAlignment(@RequestParam(name = "organisationId", required = false) Optional<Integer> organisationId,
                                                           @RequestParam(name = "year", required = false) Optional<Integer> year,
                                                           @RequestParam(name = "adjusted", required = false, defaultValue = "false") boolean riskAdjusted,
                                                           @RequestParam(name = "scenario", required = false, defaultValue = "false") boolean isScenario,
                                                           @RequestParam(name = "aggregated", required = false, defaultValue = "false") boolean isSupplyChainAggregated
    ) throws TemperatureAlignmentNotFoundException {
        var user = getLoggedInUser().orElseThrow(() -> new ApiException(ExceptionContent.USER_NOT_FOUND, HttpStatus.BAD_REQUEST));
        return impactTemperatureAlignmentService.getImpactPerformance(
                organisationId.orElseGet(user::getCompanyId),
                year.orElseGet(() -> LocalDate.now().getYear()),
                riskAdjusted
                        ? TemperatureAlignmentRecordType.RISK_ADJUSTED_TEMPERATURE_ALIGNMENT
                        : TemperatureAlignmentRecordType.TEMPERATURE_ALIGNMENT,
                isScenario,
                isSupplyChainAggregated
        );
    }

    @GetMapping("{performanceType}/{performancePillar}")
    public ImpactPerformanceDto getImpactPerformance(@PathVariable(name = "performanceType") PerformanceType performanceType,
                                                     @PathVariable(name = "performancePillar") PerformancePillar performancePillar,
                                                     @RequestParam(name = "level") GranularityLevel granularityLevel,
                                                     @RequestParam(name = "organisationId", required = false) Optional<Integer> organisationId,
                                                     @RequestParam(name = "year", required = false) Integer year,
                                                     @RequestParam(name = "adjusted", required = false, defaultValue = "false") boolean riskAdjusted,
                                                     @RequestParam(name = "scenario", required = false, defaultValue = "false") boolean isScenario,
                                                     @RequestParam(name = "aggregated", required = false, defaultValue = "false") boolean isSupplyChainAggregated
    ) throws TemperatureAlignmentNotFoundException {
        var user = getLoggedInUser().orElseThrow(() -> new ApiException(ExceptionContent.USER_NOT_FOUND, HttpStatus.BAD_REQUEST));
        return impactTemperatureAlignmentService.getImpactPerformance(
                performanceType,
                performancePillar,
                granularityLevel,
                organisationId.orElseGet(user::getCompanyId),
                year,
                riskAdjusted
                        ? TemperatureAlignmentRecordType.RISK_ADJUSTED_TEMPERATURE_ALIGNMENT
                        : TemperatureAlignmentRecordType.TEMPERATURE_ALIGNMENT,
                isScenario,
                isSupplyChainAggregated
        );
    }

    @GetMapping("/temperaturealignment/transitionpathway/{organisationID}")
    public List<TransitionPathwayDto> getTransitionPathway(@PathVariable("organisationID") Integer organisationId,
                                                           @RequestParam(name = "adjusted", required = false, defaultValue = "false") boolean riskAdjusted,
                                                           @RequestParam(name = "year", required = false) Optional<Integer> year,
                                                           @RequestParam(name = "scenario", required = false, defaultValue = "false") boolean isScenario,
                                                           @RequestParam(name = "aggregated", required = false, defaultValue = "false") boolean isSupplyChainAggregated
    ) throws TemperatureAlignmentNotFoundException {
        return impactTemperatureAlignmentService.getTransitionPathway(
                organisationId,
                year.orElseGet(() -> LocalDate.now().getYear()),
                riskAdjusted
                        ?
                        TemperatureAlignmentRecordType.RISK_ADJUSTED_TEMPERATURE_ALIGNMENT
                        :
                        TemperatureAlignmentRecordType.TEMPERATURE_ALIGNMENT,
                isScenario,
                isSupplyChainAggregated
        );
    }
}
