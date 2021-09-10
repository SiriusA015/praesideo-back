package earth.praesideo.models.restapi.impactperformance.converters;

import earth.praesideo.models.restapi.impactperformance.GranularityLevel;
import earth.praesideo.models.restapi.impactperformance.PerformancePillar;
import earth.praesideo.models.restapi.impactperformance.PerformanceType;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.convert.converter.Converter;

@Configuration
public class EnumConverter {

    @Bean
    public Converter<String, GranularityLevel> getGranularityLevelEnumConverter() {
        return new Converter<String, GranularityLevel>() {
            @Override
            public GranularityLevel convert(final String value) {
                return GranularityLevel.convert(value);
            }
        };
    }

    @Bean
    public Converter<String, PerformancePillar> getPerformancePillarEnumConverter() {
        return new Converter<String, PerformancePillar>() {
            @Override
            public PerformancePillar convert(final String value) {
                return PerformancePillar.convert(value);
            }
        };
    }

    @Bean
    public Converter<String, PerformanceType> getPerformanceTypeEnumConverter() {
        return new Converter<String, PerformanceType>() {
            @Override
            public PerformanceType convert(final String value) {
                return PerformanceType.convert(value);
            }
        };
    }
}
