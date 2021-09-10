package earth.praesideo.services.payment;

import earth.praesideo.models.restapi.payment.InitPaymentDto;
import earth.praesideo.models.restapi.payment.PaymentDto;
import org.apache.commons.codec.Charsets;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import java.util.Base64;

/**
 * @author Koshman Vadim
 */
@Service
public class PaymentService {
    @Value("${datatrans.credentials.username}")
    private String datatransUsername;
    @Value("${datatrans.credentials.password}")
    private String datatransPassword;

    private final PaymentFeignClient paymentFeignClient;

    public PaymentService(PaymentFeignClient paymentFeignClient) {
        this.paymentFeignClient = paymentFeignClient;
    }


    public String token(){
        return encodeCredentials();
    }

    public PaymentDto initTransaction(InitPaymentDto request){
        return paymentFeignClient.initTransaction(request);
    }

    private String encodeCredentials() {
        return Base64
                .getEncoder()
                .encodeToString((datatransUsername + ":" + datatransPassword)
                        .getBytes(Charsets.UTF_8));
    }

}
