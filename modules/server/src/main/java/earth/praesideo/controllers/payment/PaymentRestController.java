package earth.praesideo.controllers.payment;

import earth.praesideo.models.restapi.payment.AuthPaymentDto;
import earth.praesideo.models.restapi.payment.InitPaymentDto;
import earth.praesideo.models.restapi.payment.PaymentDto;
import earth.praesideo.services.payment.PaymentService;
import lombok.AllArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;


/**
 * @author Koshman Vadim
 */

@RestController
@RequestMapping("/api/payment")
@AllArgsConstructor
public class PaymentRestController {
    private final PaymentService paymentService;

    @PostMapping("/init-transaction")
    public ResponseEntity<PaymentDto> initTransaction(@RequestBody InitPaymentDto request) {
        return ResponseEntity.ok(paymentService.initTransaction(request));
    }

    @PostMapping("/token")
    public ResponseEntity<AuthPaymentDto> getToken() {
        return ResponseEntity.ok(AuthPaymentDto.builder()
                .token(paymentService.token())
                .build());
    }
}
