package earth.praesideo.models.restapi.payment;

import lombok.Getter;

/**
 * @author Koshman Vadim
 */
@Getter
public class InitPaymentDto {
    public String currency;
    public String refno;
    public int amount;
    public RedirectPaymentDto redirect;
    public boolean autoSettle;
}
