package earth.praesideo.models.restapi.payment;

import earth.praesideo.models.restapi.BaseApiModel;
import lombok.Builder;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * @author Koshman Vadim
 */
@EqualsAndHashCode(callSuper = true)
@Builder
@Data
public class AuthPaymentDto extends BaseApiModel {
    private String token;
}
