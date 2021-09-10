package earth.praesideo.models.restapi.traceperformance;

import lombok.Builder;
import lombok.Data;

import java.util.Date;

/**
 * @author Koshman Vadim
 */
@Data
@Builder
public class SupplierCountDto {
    private Long available;
    private Long total;
}
