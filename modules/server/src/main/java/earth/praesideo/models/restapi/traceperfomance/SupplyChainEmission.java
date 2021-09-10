package earth.praesideo.models.restapi.traceperfomance;

import lombok.Builder;
import lombok.Data;

import java.util.List;

/**
 * @author Koshman Vadim
 */
@Data
@Builder
public class SupplyChainEmission{
    public List<Integer> labels;
    public List<DataSet> datasets;
}
