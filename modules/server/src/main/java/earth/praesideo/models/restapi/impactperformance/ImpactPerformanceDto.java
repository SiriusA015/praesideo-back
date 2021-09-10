package earth.praesideo.models.restapi.impactperformance;

import com.fasterxml.jackson.annotation.JsonInclude;
import lombok.Data;
import lombok.experimental.Accessors;

import java.math.BigDecimal;
import java.math.RoundingMode;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Data
@Accessors(chain = true)
public class ImpactPerformanceDto {

    private PerformanceType        performanceType;
    private PerformancePillar      performancePillar;
    private PerformancePillarScope performanceScope;
    private BigDecimal             performanceValue;
    private String                 performanceValueType;
    private Integer                startYear;
    private Date                   lastCalculationDate;

    @JsonInclude(JsonInclude.Include.NON_EMPTY)
    private List<ImpactPerformanceDto> underlyingImpactPerformance = new ArrayList<>();

    public ImpactPerformanceDto setPerformanceValue(final Double performanceValue) {
        if (performanceValue != null) {
            this.performanceValue = BigDecimal.valueOf(performanceValue).setScale(2, RoundingMode.HALF_UP);
        }
        return this;
    }
}
