package earth.praesideo.services.httpclients.yahoo;

import feign.RequestInterceptor;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;

public class YahooFeignClientConfig {

    @Value("${yahoo.finance.api.key}")
    private String apiKey;

    @Bean
    public RequestInterceptor requestInterceptor() {
        return requestTemplate -> {
            requestTemplate.header("Content-Type", "application/json");
            requestTemplate.header("x-api-key", apiKey);
        };
    }
}
