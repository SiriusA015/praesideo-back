package earth.praesideo.models.restapi.payment;

import earth.praesideo.models.restapi.BaseApiModel;
import lombok.Getter;
import lombok.Setter;

/**
 * @author Koshman Vadim
 */
@Getter
@Setter
public class PaymentDto extends BaseApiModel {
    private String transactionId;
}
