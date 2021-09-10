package earth.praesideo.models.restapi.traceperformance;

import lombok.Getter;
import lombok.Setter;

import java.math.BigDecimal;

/**
 * @author Koshman Vadim
 */
@Getter
@Setter
public class ScoreChainNumbers {
    private Integer temperatureScore_1_5;
    private Integer temperatureScoreLess_2;
    private Integer temperatureScoreLess_3;
    private Integer temperatureScoreMore_3;

    private Integer probability_1_5_Score_25;
    private Integer probability_1_5_ScoreLess_50;
    private Integer probability_1_5_ScoreLess_70;
    private Integer probability_1_5_ScoreMore_70;

    private Integer probability_2_Score_25;
    private Integer probability_2_ScoreLess_50;
    private Integer probability_2_ScoreLess_70;
    private Integer probability_2_ScoreMore_70;
}
