package earth.praesideo.models.restapi.impactperformance;

import com.fasterxml.jackson.annotation.JsonCreator;
import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.AllArgsConstructor;
import lombok.Getter;

import java.util.Arrays;

@AllArgsConstructor
@Getter
public enum PerformanceType {
    @JsonProperty("TemperatureAlignment")
    TEMPERATURE_ALIGNMENT("TemperatureAlignment"),
    @JsonProperty("CarbonRatings")
    CARBON_RATINGS("CarbonRatings"),
    @JsonProperty("TransitionRisks")
    TRANSITION_RISKS("TransitionRisks");

    private final String value;

    @JsonCreator
    public static PerformanceType convert(final String type) {
        return Arrays.stream(PerformanceType.values())
                .filter(value -> value.value.equalsIgnoreCase(type) || value.name().equalsIgnoreCase(type))
                .findFirst()
                .orElse(null);
    }

    @Override
    public String toString() {
        return value;
    }
}
