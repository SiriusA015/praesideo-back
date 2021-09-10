package earth.praesideo.models.restapi.traceperformance;

import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import org.springframework.data.domain.Page;

/**
 * @author Koshman Vadim
 */
@Getter
@Setter
@Builder
public class AvailableSuppliersInfoDto {
    private final SupplyChainTotalDto supplyChainTotal;
    private final Page<AvailableSupplierDto> suppliers;
}
