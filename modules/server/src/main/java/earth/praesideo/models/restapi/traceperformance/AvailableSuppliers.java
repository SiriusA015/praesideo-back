package earth.praesideo.models.restapi.traceperformance;

import java.math.BigDecimal;

/**
 * @author Koshman Vadim
 */
public interface AvailableSuppliers {
    Integer getCompanyId();
    String getSupplierName();
    BigDecimal getTemperatureAlignment();
    BigDecimal getProbability_1_5();
    BigDecimal getProbability_2();
    BigDecimal getTCO2();
    BigDecimal getTotalTemperatureAlignment();
    BigDecimal getTotalProbability_1_5();
    BigDecimal getTotalProbability_2();
    BigDecimal getTotalTCO2();
}
