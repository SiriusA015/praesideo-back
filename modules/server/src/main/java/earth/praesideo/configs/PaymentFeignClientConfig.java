package earth.praesideo.configs;

import feign.RequestInterceptor;
import feign.auth.BasicAuthRequestInterceptor;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;

/**
 * @author Koshman Vadim
 */
public class PaymentFeignClientConfig {
    @Value("${datatrans.credentials.username}")
    private String datatransUsername;
    @Value("${datatrans.credentials.password}")
    private String datatransPassword;

    @Bean
    public RequestInterceptor requestInterceptor() {
        return requestTemplate -> {
            requestTemplate.header("Content-Type", "application/json");
            requestTemplate.header("Accept", "*/*");
            requestTemplate.header("Connection", "keep-alive");
            requestTemplate.header("Accept-Encoding", "gzip, deflate, br");
        };
    }

    @Bean
    public BasicAuthRequestInterceptor basicAuthRequestInterceptor() {
        return new BasicAuthRequestInterceptor(datatransUsername, datatransPassword);
    }
}
