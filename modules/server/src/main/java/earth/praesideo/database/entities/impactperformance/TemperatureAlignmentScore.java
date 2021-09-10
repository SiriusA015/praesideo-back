package earth.praesideo.database.entities.impactperformance;

import lombok.Data;
import lombok.experimental.Accessors;

import javax.persistence.Embeddable;

@Embeddable
@Data
@Accessors(chain = true)
public class TemperatureAlignmentScore {

    private Double overall;

    private Double scope1;

    private Double scope2;

    private Double scope3;

}
