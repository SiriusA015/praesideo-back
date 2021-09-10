package earth.praesideo.models.restapi.traceperfomance;

import lombok.Builder;
import lombok.Data;


/**
 * @author Koshman Vadim
 */
@Data
@Builder
public class ChartSet {
    private String label;
    private Integer value;
}
