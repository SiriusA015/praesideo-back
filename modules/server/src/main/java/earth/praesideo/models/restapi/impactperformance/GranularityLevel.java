package earth.praesideo.models.restapi.impactperformance;

import com.fasterxml.jackson.annotation.JsonCreator;
import lombok.AllArgsConstructor;
import lombok.Getter;

import java.util.Arrays;

@AllArgsConstructor
@Getter
public enum GranularityLevel {
    OVERALL("overall"),
    SUMMARY("summary");

    private final String value;

    @JsonCreator
    public static GranularityLevel convert(final String level) {
        return Arrays.stream(GranularityLevel.values())
                .filter(value -> value.value.equalsIgnoreCase(level) || value.name().equalsIgnoreCase(level))
                .findFirst()
                .orElse(null);
    }

    @Override
    public String toString() {
        return value;
    }
}
