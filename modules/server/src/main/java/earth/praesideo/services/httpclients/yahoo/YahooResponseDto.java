package earth.praesideo.services.httpclients.yahoo;

import lombok.Getter;
import lombok.Setter;

import java.util.List;

@Getter
@Setter
public class YahooResponseDto {

    private YahooQuoteResponse quoteResponse;

    @Getter
    @Setter
    public static class YahooQuoteResponse {
        private List<YahooResponseResultDto> result;
    }

    @Getter
    @Setter
    public static class YahooResponseResultDto {
        private String symbol;
        private String shortName;
        private String currency;
        private Double bid;
    }
}
