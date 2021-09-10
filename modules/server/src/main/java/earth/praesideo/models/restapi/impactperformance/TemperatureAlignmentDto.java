package earth.praesideo.models.restapi.impactperformance;

import lombok.Data;
import lombok.experimental.Accessors;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Data
@Accessors(chain = true)
public class TemperatureAlignmentDto {

    private List<ImpactPerformanceDto> impactPerformance = new ArrayList<>();
    private List<TransitionPathwayDto> transitionPathway = new ArrayList<>();
    private Date lastCalculationDate;
}
