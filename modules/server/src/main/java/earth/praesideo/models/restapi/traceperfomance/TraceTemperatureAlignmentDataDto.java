package earth.praesideo.models.restapi.traceperfomance;

import lombok.Builder;
import lombok.Data;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

/**
 * @author Koshman Vadim
 */
@Data
@Builder
public class TraceTemperatureAlignmentDataDto {
        public SupplyChainEmission supplyChainEmission;
        public SupplierEmission supplierEmission;
        public List<ChartSet> probabilityNumbers_1_5;
        public List<ChartSet> probabilityNumbers_2;
        public List<ChartSet> riskNumbers;
        public List<ChartSet> temperatureNumbers;
        public BigDecimal probability_1_5;
        public BigDecimal probability_2;
        public Double riskScore;
        public BigDecimal temperatureScore;
        public Double startScore;
        public Double endScore;
        public Date lastCalculationDate;
}
