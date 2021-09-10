package earth.praesideo.models.restapi.impactperformance;

import com.fasterxml.jackson.annotation.JsonCreator;
import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.AllArgsConstructor;
import lombok.Getter;

import java.util.Arrays;

@AllArgsConstructor
@Getter
public enum PerformancePillar {
    @JsonProperty("OverallScore")
    OVERALL_SCORE("OverallScore", "°"),
    @JsonProperty("Probability-1.5°")
    PROBABILITY_1_5("Probability_1_5", "%"),
    @JsonProperty("Probability-2.0°")
    PROBABILITY_2_0("Probability_2_0", "%"),
    @JsonProperty("Total-emission")
    TOTAL_EMISSION("TotalEmission", "%");

    private final String pillar;
    private final String valueType;

    @JsonCreator
    public static PerformancePillar convert(final String pillar) {
        return Arrays.stream(PerformancePillar.values())
                .filter(value -> value.pillar.equalsIgnoreCase(pillar) || value.name().equalsIgnoreCase(pillar))
                .findFirst()
                .orElse(null);
    }
}
