package earth.praesideo.services;

import earth.praesideo.database.entities.impactperformance.*;
import earth.praesideo.database.repositories.impactperformance.ImpactTemperatureAlignmentRepository;
import earth.praesideo.exceptions.TemperatureAlignmentNotFoundException;
import earth.praesideo.models.restapi.impactperformance.*;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Optional;

@Service
@RequiredArgsConstructor
public class ImpactTemperatureAlignmentService {

    private final ImpactTemperatureAlignmentRepository impactTemperatureAlignmentRepository;

    public TemperatureAlignmentDto getImpactPerformance(final Integer organisationId,
                                                        final Integer year,
                                                        final TemperatureAlignmentRecordType recordType,
                                                        final boolean isScenario,
                                                        final boolean isSupplyChainAggregated)
            throws TemperatureAlignmentNotFoundException {
        final var temperatureAlignmentData = impactTemperatureAlignmentRepository
                .findByKeyOrganisationCompanyIdAndKeyYearAndKeyRecordTypeAndKeyIsScenarioAndKeyIsSupplyChainAggregated(
                        organisationId,
                        year,
                        recordType,
                        isScenario,
                        isSupplyChainAggregated
                )
                .orElseThrow(TemperatureAlignmentNotFoundException::new);

        final TemperatureAlignmentDto data = new TemperatureAlignmentDto();
        data.setLastCalculationDate(temperatureAlignmentData.getLastCalculationDate() != null ? temperatureAlignmentData.getLastCalculationDate() : null);
        data.getImpactPerformance().add(buildImpactPerformance(
                PerformanceType.TEMPERATURE_ALIGNMENT,
                year,
                PerformancePillar.OVERALL_SCORE,
                temperatureAlignmentData.getTemperatureAlignmentScore(),
                temperatureAlignmentData.getLastCalculationDate(),
                GranularityLevel.SUMMARY
        ));
        data.getImpactPerformance().add(buildImpactPerformance(
                PerformanceType.TEMPERATURE_ALIGNMENT,
                year,
                PerformancePillar.PROBABILITY_1_5,
                temperatureAlignmentData.getProbabilityOneDotFiveDegree(),
                temperatureAlignmentData.getLastCalculationDate(),
                GranularityLevel.SUMMARY
        ));
        data.getImpactPerformance().add(buildImpactPerformance(
                PerformanceType.TEMPERATURE_ALIGNMENT,
                year,
                PerformancePillar.PROBABILITY_2_0,
                temperatureAlignmentData.getProbabilityTwoDegree(),
                temperatureAlignmentData.getLastCalculationDate(),
                GranularityLevel.SUMMARY
        ));

        data.getTransitionPathway().add(buildTransitionPathwayDto(
                temperatureAlignmentData.getOverall(),
                PerformancePillarScope.SCOPE_1_2_3,
                temperatureAlignmentData.getLastCalculationDate()
        ));
        data.getTransitionPathway().add(buildTransitionPathwayDto(
                temperatureAlignmentData.getScope1(),
                PerformancePillarScope.SCOPE_1,
                temperatureAlignmentData.getLastCalculationDate()
        ));
        data.getTransitionPathway().add(buildTransitionPathwayDto(
                temperatureAlignmentData.getScope2(),
                PerformancePillarScope.SCOPE_2,
                temperatureAlignmentData.getLastCalculationDate()
        ));
        data.getTransitionPathway().add(buildTransitionPathwayDto(
                temperatureAlignmentData.getScope3(),
                PerformancePillarScope.SCOPE_3,
                temperatureAlignmentData.getLastCalculationDate()
        ));
        return data;
    }

    public ImpactPerformanceDto getImpactPerformance(final PerformanceType performanceType,
                                                     final PerformancePillar performancePillar,
                                                     final GranularityLevel granularityLevel,
                                                     final Integer organisationId,
                                                     final Integer year,
                                                     final TemperatureAlignmentRecordType recordType,
                                                     final boolean isScenario,
                                                     final boolean isSupplyChainAggregated)
            throws TemperatureAlignmentNotFoundException {
        final var temperatureAlignmentData = year == null
                ? impactTemperatureAlignmentRepository
                .findFirstByKeyOrganisationCompanyIdAndKeyRecordTypeAndKeyIsScenarioAndKeyIsSupplyChainAggregatedOrderByKeyYearDesc(organisationId, recordType, isScenario, isSupplyChainAggregated)
                : impactTemperatureAlignmentRepository
                .findByKeyOrganisationCompanyIdAndKeyYearAndKeyRecordTypeAndKeyIsScenarioAndKeyIsSupplyChainAggregated(organisationId, year, recordType, isScenario, isSupplyChainAggregated);
        return temperatureAlignmentData.map(alignment -> {
            TemperatureAlignmentScore score;
            switch (performancePillar) {
                case PROBABILITY_1_5:
                    score = alignment.getProbabilityOneDotFiveDegree();
                    break;
                case PROBABILITY_2_0:
                    score = alignment.getProbabilityTwoDegree();
                    break;
                case OVERALL_SCORE:
                default:
                    score = alignment.getTemperatureAlignmentScore();
            }
            return buildImpactPerformance(performanceType, alignment.getKey().getYear(), performancePillar, score, alignment.getLastCalculationDate(), granularityLevel);
        })
        .orElseThrow(TemperatureAlignmentNotFoundException::new);
    }

    private ImpactPerformanceDto buildImpactPerformance(final PerformanceType performanceType,
                                                        final Integer year,
                                                        final PerformancePillar pillar,
                                                        final TemperatureAlignmentScore score,
                                                        final Date lastCalculationDate,
                                                        final GranularityLevel granularityLevel) {
        final ImpactPerformanceDto impactPerformance = new ImpactPerformanceDto();
        impactPerformance.setLastCalculationDate(lastCalculationDate);
        impactPerformance.setStartYear(year);
        impactPerformance.setPerformancePillar(pillar);
        impactPerformance.setPerformanceType(performanceType);
        impactPerformance.setPerformanceScope(PerformancePillarScope.SCOPE_1_2_3);
        impactPerformance.setPerformanceValue(
            Optional.ofNullable(score).map(TemperatureAlignmentScore::getOverall).orElse(null)
        );
        impactPerformance.setPerformanceValueType(pillar.getValueType());

        if (GranularityLevel.SUMMARY.equals(granularityLevel)) {
            impactPerformance.getUnderlyingImpactPerformance()
                    .add(new ImpactPerformanceDto()
                            .setLastCalculationDate(lastCalculationDate)
                            .setStartYear(year)
                            .setPerformancePillar(pillar)
                            .setPerformanceType(performanceType)
                            .setPerformanceScope(PerformancePillarScope.SCOPE_1)
                            .setPerformanceValue(
                                Optional.ofNullable(score).map(TemperatureAlignmentScore::getScope1).orElse(null)
                            )
                            .setPerformanceValueType(pillar.getValueType())
                    );
            impactPerformance.getUnderlyingImpactPerformance()
                    .add(new ImpactPerformanceDto()
                            .setLastCalculationDate(lastCalculationDate)
                            .setStartYear(year)
                            .setPerformancePillar(pillar)
                            .setPerformanceType(performanceType)
                            .setPerformanceScope(PerformancePillarScope.SCOPE_2)
                            .setPerformanceValue(
                                Optional.ofNullable(score).map(TemperatureAlignmentScore::getScope2).orElse(null)
                            )
                            .setPerformanceValueType(pillar.getValueType())
                    );
            impactPerformance.getUnderlyingImpactPerformance()
                    .add(new ImpactPerformanceDto()
                            .setLastCalculationDate(lastCalculationDate)
                            .setStartYear(year)
                            .setPerformancePillar(pillar)
                            .setPerformanceType(performanceType)
                            .setPerformanceScope(PerformancePillarScope.SCOPE_3)
                            .setPerformanceValue(
                                Optional.ofNullable(score).map(TemperatureAlignmentScore::getScope3).orElse(null)
                            )
                            .setPerformanceValueType(pillar.getValueType())
                    );
        }
        return impactPerformance;
    }

    public List<TransitionPathwayDto> getTransitionPathway(final Integer organisationId,
                                                           final Integer year,
                                                           final TemperatureAlignmentRecordType recordType,
                                                           final boolean isScenario,
                                                           final boolean isSupplyChainAggregated)
            throws TemperatureAlignmentNotFoundException {
        final var temperatureAlignmentData = impactTemperatureAlignmentRepository
                .findByKeyOrganisationCompanyIdAndKeyYearAndKeyRecordTypeAndKeyIsScenarioAndKeyIsSupplyChainAggregated(organisationId, year, recordType, isScenario, isSupplyChainAggregated)
                .orElseThrow(TemperatureAlignmentNotFoundException::new);
        List<TransitionPathwayDto> graphsData = new ArrayList<>();
        graphsData.add(buildTransitionPathwayDto(temperatureAlignmentData.getOverall(), PerformancePillarScope.SCOPE_1_2_3, temperatureAlignmentData.getLastCalculationDate()));
        graphsData.add(buildTransitionPathwayDto(temperatureAlignmentData.getScope1(), PerformancePillarScope.SCOPE_1, temperatureAlignmentData.getLastCalculationDate()));
        graphsData.add(buildTransitionPathwayDto(temperatureAlignmentData.getScope2(), PerformancePillarScope.SCOPE_2, temperatureAlignmentData.getLastCalculationDate()));
        graphsData.add(buildTransitionPathwayDto(temperatureAlignmentData.getScope3(), PerformancePillarScope.SCOPE_3, temperatureAlignmentData.getLastCalculationDate()));
        return graphsData;
    }

    private TransitionPathwayDto buildTransitionPathwayDto(TransitionPathway data, PerformancePillarScope scope, Date lastCalculationDate) {
        data = Optional.ofNullable(data).orElseGet(TransitionPathway::new);
        return new TransitionPathwayDto()
                .setLastCalculationDate(lastCalculationDate)
                .setScope(scope)
                .setBaselineValue(data.getBaselineValue())
                .setActualShortTerm(data.getActualShortTerm())
                .setActualLongTerm(data.getActualLongTerm())
                .setOneDotFiveDegreeShortTerm(data.getOneDotFiveDegreeShortTerm())
                .setOneDotFiveDegreeLongTerm(data.getOneDotFiveDegreeLongTerm())
                .setTwoDegreeShortTerm(data.getTwoDegreeShortTerm())
                .setTwoDegreeLongTerm(data.getTwoDegreeLongTerm());
    }

    public List<Integer> getImpactPerformanceYears(final Integer organisationId,
                                                   final TemperatureAlignmentRecordType temperatureAlignmentRecordType,
                                                   final boolean isScenario,
                                                   final boolean isSupplyChainAggregated) {
        return impactTemperatureAlignmentRepository.findYears(organisationId, temperatureAlignmentRecordType, isScenario, isSupplyChainAggregated);
    }
}
