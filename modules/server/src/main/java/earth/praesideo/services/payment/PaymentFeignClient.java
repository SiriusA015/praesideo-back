package earth.praesideo.services.payment;

import earth.praesideo.configs.PaymentFeignClientConfig;
import earth.praesideo.models.restapi.payment.InitPaymentDto;
import earth.praesideo.models.restapi.payment.PaymentDto;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.PostMapping;

/**
 * @author Koshman Vadim
 */

@FeignClient(name = "datatransFeignClient",configuration = PaymentFeignClientConfig.class, url = "${datatrans.base.url}")
public interface PaymentFeignClient {
    @PostMapping("/transactions")
    PaymentDto initTransaction(InitPaymentDto body);
}
