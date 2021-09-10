package earth.praesideo.models.restapi.traceperformance;

import java.math.BigDecimal;

/**
 * @author Koshman Vadim
 */
public interface TemperatureAlignment {
    BigDecimal getAggregated_Temperature_Score();
    BigDecimal getAggregated_Risk_Adjusted_Temperature_Score();
    BigDecimal getAggregated_Probability_1_5_Degree_value();
    BigDecimal getAggregated_Probability_2_0_Degree_value();
    BigDecimal getAggregated_Baseline_value();
    BigDecimal getAggregated_Supply_chain_Short_term_value();
    BigDecimal getAggregated_Supply_chain_Long_term_value();
    BigDecimal getAggregated_pathway_overall_actual_short_term();
    BigDecimal getAggregated_pathway_overall_actual_long_term();
    BigDecimal getAggregated_1_5_Short_term_value();
    BigDecimal getAggregated_1_5_Long_term_value();
    BigDecimal getAggregated_2_0_Short_term_value();
    BigDecimal getAggregated_2_0_Long_term_value();
}
