package earth.praesideo.models.restapi.impactperformance;

import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.Accessors;

import java.math.BigDecimal;
import java.math.RoundingMode;
import java.util.Date;

@NoArgsConstructor
@Data
@Accessors(chain = true)
public class TransitionPathwayDto {

    private PerformancePillarScope scope;

    private BigDecimal baselineValue;

    private BigDecimal oneDotFiveDegreeShortTerm;

    private BigDecimal oneDotFiveDegreeLongTerm;

    private BigDecimal twoDegreeShortTerm;

    private BigDecimal twoDegreeLongTerm;

    private BigDecimal actualShortTerm;

    private BigDecimal actualLongTerm;

    private Date lastCalculationDate;

    public TransitionPathwayDto setBaselineValue(final Double baselineValue) {
        if (baselineValue != null) {
            this.baselineValue = BigDecimal.valueOf(baselineValue).setScale(2, RoundingMode.HALF_UP);
        }
        return this;
    }

    public TransitionPathwayDto setOneDotFiveDegreeShortTerm(Double oneDotFiveDegreeShortTerm) {
        if (oneDotFiveDegreeShortTerm != null) {
            this.oneDotFiveDegreeShortTerm = BigDecimal.valueOf(oneDotFiveDegreeShortTerm).setScale(2, RoundingMode.HALF_UP);
        }
        return this;
    }

    public TransitionPathwayDto setOneDotFiveDegreeLongTerm(final Double oneDotFiveDegreeLongTerm) {
        if (oneDotFiveDegreeLongTerm != null) {
            this.oneDotFiveDegreeLongTerm = BigDecimal.valueOf(oneDotFiveDegreeLongTerm).setScale(2, RoundingMode.HALF_UP);
        }
        return this;
    }

    public TransitionPathwayDto setTwoDegreeShortTerm(final Double twoDegreeShortTerm) {
        if (twoDegreeShortTerm != null) {
            this.twoDegreeShortTerm = BigDecimal.valueOf(twoDegreeShortTerm).setScale(2, RoundingMode.HALF_UP);
        }
        return this;
    }

    public TransitionPathwayDto setTwoDegreeLongTerm(final Double twoDegreeLongTerm) {
        if (twoDegreeLongTerm != null) {
            this.twoDegreeLongTerm = BigDecimal.valueOf(twoDegreeLongTerm).setScale(2, RoundingMode.HALF_UP);
        }
        return this;
    }

    public TransitionPathwayDto setActualShortTerm(final Double actualShortTerm) {
        if (actualShortTerm != null) {
            this.actualShortTerm = BigDecimal.valueOf(actualShortTerm).setScale(2, RoundingMode.HALF_UP);
        }
        return this;
    }

    public TransitionPathwayDto setActualLongTerm(final Double actualLongTerm) {
        if (actualLongTerm != null) {
            this.actualLongTerm = BigDecimal.valueOf(actualLongTerm).setScale(2, RoundingMode.HALF_UP);
        }
        return this;
    }
}
