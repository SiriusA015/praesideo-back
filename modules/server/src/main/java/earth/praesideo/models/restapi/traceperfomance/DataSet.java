package earth.praesideo.models.restapi.traceperfomance;

import lombok.Builder;
import lombok.Getter;

import java.math.BigDecimal;
import java.util.List;

/**
 * @author Koshman Vadim
 */
@Getter
@Builder
public class DataSet{
    public String label;
    public List<BigDecimal> data;
}
