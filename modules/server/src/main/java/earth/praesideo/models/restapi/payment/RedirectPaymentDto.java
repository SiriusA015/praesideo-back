package earth.praesideo.models.restapi.payment;

import lombok.Getter;

/**
 * @author Koshman Vadim
 */
@Getter
public class RedirectPaymentDto {
    public String successUrl;
    public String cancelUrl;
    public String errorUrl;
}
