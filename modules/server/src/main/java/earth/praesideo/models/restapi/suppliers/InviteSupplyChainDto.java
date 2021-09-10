package earth.praesideo.models.restapi.suppliers;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @author Koshman Vadim
 */
@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class InviteSupplyChainDto {
    private Integer supplyChainId;
    private Integer supplierId;
    private String email;
    private String name;
}
