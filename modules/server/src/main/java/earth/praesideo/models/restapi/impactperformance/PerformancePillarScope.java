package earth.praesideo.models.restapi.impactperformance;

import com.fasterxml.jackson.annotation.JsonProperty;

public enum PerformancePillarScope {
    @JsonProperty("scope1")
    SCOPE_1,
    @JsonProperty("scope2")
    SCOPE_2,
    @JsonProperty("scope3")
    SCOPE_3,
    @JsonProperty("scope1-2-3")
    SCOPE_1_2_3
}
