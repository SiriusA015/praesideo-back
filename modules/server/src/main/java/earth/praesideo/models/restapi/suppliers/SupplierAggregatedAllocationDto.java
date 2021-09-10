package earth.praesideo.models.restapi.suppliers;

import earth.praesideo.database.entities.suppliers.ClassificationStatus;
import lombok.Builder;
import lombok.Data;

import java.util.List;

/**
 * @author Koshman Vadim
 */
@Data
@Builder
public class SupplierAggregatedAllocationDto {
    private String averageCategoryId;
    private String averageTypeId;
    private Double sumAmount;
    private String averageCurrencyId;
    private ClassificationStatus status;
    private List<SupplierAllocationDto> allocations;
}
