package earth.praesideo.controllers.traceperfomance;

import earth.praesideo.controllers.BaseController;
import earth.praesideo.database.entities.impactperformance.TemperatureAlignmentRecordType;
import earth.praesideo.exceptions.ApiException;
import earth.praesideo.exceptions.ExceptionContent;
import earth.praesideo.exceptions.TemperatureAlignmentNotFoundException;
import earth.praesideo.models.restapi.traceperfomance.TraceTemperatureAlignmentDataDto;
import earth.praesideo.models.restapi.traceperformance.AvailableSuppliersInfoDto;
import earth.praesideo.models.restapi.traceperformance.SupplierCountDto;
import earth.praesideo.services.TracePerformanceSupplyChaneService;
import earth.praesideo.services.TraceTemperatureAlignmentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.*;

/**
 * @author Koshman Vadim
 */
@RestController
@RequestMapping("/api/traceperformance")
public class TracePerformanceRestController extends BaseController {
    private final TracePerformanceSupplyChaneService performanceSupplyChaneService;
    private final TraceTemperatureAlignmentService traceTemperatureAlignmentService;

    @Autowired
    public TracePerformanceRestController(TracePerformanceSupplyChaneService performanceSupplyChaneService, TraceTemperatureAlignmentService traceTemperatureAlignmentService) {
        this.performanceSupplyChaneService = performanceSupplyChaneService;
        this.traceTemperatureAlignmentService = traceTemperatureAlignmentService;
    }

    @GetMapping("/supplychane/availablesuppliers")
    public AvailableSuppliersInfoDto runImpactPerformanceJob(@RequestParam Integer size,
                                                             @RequestParam Integer page,
                                                             @RequestParam String sort) {
        //TODO now without sort
        Pageable pageable = PageRequest.of(page, size);
        var user = getLoggedInUser().orElseThrow(() -> new ApiException(ExceptionContent.USER_NOT_FOUND, HttpStatus.BAD_REQUEST));
        return performanceSupplyChaneService.getAvailableSuppliers(user, pageable);
    }

    @GetMapping("/supplychane/availablesupplier/count")
    public SupplierCountDto getCountSuppliers(@RequestParam(name = "year") Integer year) {
        var user = getLoggedInUser().orElseThrow(() -> new ApiException(ExceptionContent.USER_NOT_FOUND, HttpStatus.BAD_REQUEST));
        return traceTemperatureAlignmentService.getCountSuppliers(user, year);
    }

    @GetMapping("/temperaturealignment")
    public TraceTemperatureAlignmentDataDto getTemperatureAlignmentByCompanyId(@RequestParam(name = "year") Integer year,
                                                                               @RequestParam(name = "scenario", required = false, defaultValue = "false") boolean isScenario) throws TemperatureAlignmentNotFoundException {
        var user = getLoggedInUser().orElseThrow(() -> new ApiException(ExceptionContent.USER_NOT_FOUND, HttpStatus.BAD_REQUEST));
        return traceTemperatureAlignmentService.getTemperatureAlignmentByCompanyId(user.getCompanyId(), year, TemperatureAlignmentRecordType.SUPPLY_CHAIN_AGGREGATED, isScenario);
    }
}
