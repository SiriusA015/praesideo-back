package earth.praesideo.services;

import earth.praesideo.database.entities.impactperformance.ImpactTemperatureAlignment;
import earth.praesideo.database.entities.impactperformance.TemperatureAlignmentRecordType;
import earth.praesideo.database.entities.suppliers.SupplyChain;
import earth.praesideo.database.repositories.impactperformance.ImpactTemperatureAlignmentRepository;
import earth.praesideo.database.repositories.suppliers.SupplyChainRepository;
import earth.praesideo.exceptions.TemperatureAlignmentNotFoundException;
import earth.praesideo.models.restapi.traceperfomance.*;
import earth.praesideo.models.restapi.traceperformance.ScoreChainNumbers;
import earth.praesideo.models.restapi.traceperformance.SupplierCountDto;
import earth.praesideo.models.security.CustomUserDetailsModel;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.math.RoundingMode;
import java.util.LinkedList;
import java.util.List;
import java.util.Optional;

/**
 * @author Koshman Vadim
 */
@Service
public class TraceTemperatureAlignmentService {
    private final ImpactTemperatureAlignmentRepository impactTemperatureAlignmentRepository;
    private final SupplyChainRepository supplyChainRepository;


    public TraceTemperatureAlignmentService(ImpactTemperatureAlignmentRepository impactTemperatureAlignmentRepository,
                                            SupplyChainRepository supplyChainRepository) {
        this.impactTemperatureAlignmentRepository = impactTemperatureAlignmentRepository;
        this.supplyChainRepository = supplyChainRepository;
    }


    public TraceTemperatureAlignmentDataDto getTemperatureAlignmentByCompanyId(final Integer organisationId,
                                                                               final Integer year,
                                                                               final TemperatureAlignmentRecordType recordType,
                                                                               final boolean isScenario) throws TemperatureAlignmentNotFoundException {
        final var customerAggregatedRecord = impactTemperatureAlignmentRepository
                .findByKeyOrganisationCompanyIdAndKeyYearAndKeyRecordTypeAndKeyIsScenarioAndKeyIsSupplyChainAggregated(organisationId, year, recordType, isScenario, true);

        List<ImpactTemperatureAlignment> listSuppliersImpactTemperatureAlignment =
                this.getCompanySupplyChainImpactTemperatureAlignments(organisationId, year);

        final var scoreNumbers = this.buildAggregatedNumbers(listSuppliersImpactTemperatureAlignment);

        return customerAggregatedRecord.map(data -> TraceTemperatureAlignmentDataDto.builder()
                        .probability_1_5(BigDecimal.valueOf(data.getProbabilityOneDotFiveDegree().getOverall()).setScale(1, RoundingMode.CEILING))
                        .probability_2(BigDecimal.valueOf(data.getProbabilityTwoDegree().getOverall()).setScale(1, RoundingMode.CEILING))
                        .temperatureScore(BigDecimal.valueOf(data.getTemperatureAlignmentScore().getOverall()).setScale(1, RoundingMode.CEILING))
                        .supplyChainEmission(SupplyChainEmission
                                .builder()
                                .labels(getDefaultLabels(year))
                                .datasets(getOverallDataSets(data))
                                .build())
                        //supplier emissions transition pathway chart
                        .supplierEmission(SupplierEmission
                                .builder()
                                .labels(getDefaultLabels(year))
                                .datasets(getSupplierEmissionDataSets(data, listSuppliersImpactTemperatureAlignment))
                                .build())
                        .temperatureNumbers(getScoreNumbers(scoreNumbers))
                        //for now doesn't in use
                        .riskNumbers(getScoreNumbers(scoreNumbers))
                        .probabilityNumbers_1_5(getPercentage_1_5_Numbers(scoreNumbers))
                        .probabilityNumbers_2(getPercentage_2_Numbers(scoreNumbers))
                        .riskScore(0.0)
                        .startScore(1.5)
                        .endScore(3.2)
                        .lastCalculationDate(data.getLastCalculationDate())
                        .build())
                .orElseThrow(TemperatureAlignmentNotFoundException::new);
    }

    private ScoreChainNumbers buildAggregatedNumbers(List<ImpactTemperatureAlignment> listImpactTemperatureAlignment) {
        ScoreChainNumbers scoreChainNumbers = new ScoreChainNumbers();
        scoreChainNumbers.setTemperatureScore_1_5((int) listImpactTemperatureAlignment.stream().filter
                (c -> c.getTemperatureAlignmentScore().getOverall() <= 1.5).count());

        scoreChainNumbers.setTemperatureScoreLess_2((int) listImpactTemperatureAlignment.stream().filter
                (c -> c.getTemperatureAlignmentScore().getOverall() > 1.5 && c.getTemperatureAlignmentScore().getOverall() <= 2.0).count());

        scoreChainNumbers.setTemperatureScoreLess_3((int) listImpactTemperatureAlignment.stream().filter
                (c -> c.getTemperatureAlignmentScore().getOverall() > 2.0 && c.getTemperatureAlignmentScore().getOverall() <= 3.0).count());

        scoreChainNumbers.setTemperatureScoreMore_3((int) listImpactTemperatureAlignment.stream().filter
                (c -> c.getTemperatureAlignmentScore().getOverall() > 3.0).count());

        scoreChainNumbers.setProbability_1_5_Score_25((int) listImpactTemperatureAlignment.stream().filter
                (c -> c.getProbabilityOneDotFiveDegree().getOverall() <= 25).count());

        scoreChainNumbers.setProbability_1_5_ScoreLess_50((int) listImpactTemperatureAlignment.stream().filter
                (c -> c.getProbabilityOneDotFiveDegree().getOverall() > 25 && c.getProbabilityOneDotFiveDegree().getOverall() <= 50).count());

        scoreChainNumbers.setProbability_1_5_ScoreLess_70((int) listImpactTemperatureAlignment.stream().filter
                (c -> c.getProbabilityOneDotFiveDegree().getOverall() > 50 && c.getProbabilityOneDotFiveDegree().getOverall() <= 70).count());

        scoreChainNumbers.setProbability_1_5_ScoreMore_70((int) listImpactTemperatureAlignment.stream().filter
                (c -> c.getProbabilityOneDotFiveDegree().getOverall() > 70).count());

        scoreChainNumbers.setProbability_2_Score_25((int) listImpactTemperatureAlignment.stream().filter
                (c -> c.getProbabilityTwoDegree().getOverall() <= 25).count());

        scoreChainNumbers.setProbability_2_ScoreLess_50((int) listImpactTemperatureAlignment.stream().filter
                (c -> c.getProbabilityTwoDegree().getOverall() > 25 && c.getProbabilityTwoDegree().getOverall() <= 50).count());

        scoreChainNumbers.setProbability_2_ScoreLess_70((int) listImpactTemperatureAlignment.stream().filter
                (c -> c.getProbabilityTwoDegree().getOverall() > 50 && c.getProbabilityTwoDegree().getOverall() <= 70).count());

        scoreChainNumbers.setProbability_2_ScoreMore_70((int) listImpactTemperatureAlignment.stream().filter
                (c -> c.getProbabilityTwoDegree().getOverall() > 70).count());

        return scoreChainNumbers;
    }

    private List<ImpactTemperatureAlignment> getCompanySupplyChainImpactTemperatureAlignments(Integer companyId, Integer year) {
        List<SupplyChain> listSuppliers = this.supplyChainRepository.findByCustomerCompanyIdAndDateRemovedIsNull(companyId);
        List<ImpactTemperatureAlignment> listImpactTemperatureAlignment = new LinkedList<>();
        listSuppliers.forEach(row -> {
            List<ImpactTemperatureAlignment> listSupplierTemperatureAlignment =
                    this.impactTemperatureAlignmentRepository.
                            findByKeyOrganisationCompanyIdAndKeyYearAndKeyIsScenario(row.getSupplier().getCompanyId(), year, false);
            if (!listSupplierTemperatureAlignment.isEmpty()) {
                if (listSupplierTemperatureAlignment.size() > 1) {
                    Optional<ImpactTemperatureAlignment> supplierTemperatureAlignment =
                            listSupplierTemperatureAlignment.stream().filter(c -> !c.getKey().getIsSupplyChainAggregated()).findFirst();
                    if (supplierTemperatureAlignment.isPresent()) {
                        listImpactTemperatureAlignment.add(supplierTemperatureAlignment.get());
                    } else {
                        listImpactTemperatureAlignment.add(listSupplierTemperatureAlignment.get(0));
                    }
                } else {
                    listImpactTemperatureAlignment.add(listSupplierTemperatureAlignment.get(0));
                }
            }
        });
        return listImpactTemperatureAlignment;
    }

    private LinkedList<Integer> getDefaultLabels(Integer year) {
        return new LinkedList<>() {{
            add(year);
            add(2030);
            add(2050);
        }};
    }

    private LinkedList<DataSet> getOverallDataSets(ImpactTemperatureAlignment data) {
        return new LinkedList<>() {
            {
                add(DataSet.builder().label("OVERALL")
                        .data(new LinkedList<>() {
                            {
                                add(BigDecimal.valueOf(data.getOverall().getBaselineValue()).setScale(1, RoundingMode.CEILING));
                                add(BigDecimal.valueOf(data.getOverall().getActualShortTerm()).setScale(1, RoundingMode.CEILING));
                                add(BigDecimal.valueOf(data.getOverall().getActualLongTerm()).setScale(1, RoundingMode.CEILING));
                            }
                        }).build()
                );

                add(DataSet.builder().label("1.5\u00B0")
                        .data(new LinkedList<>() {
                            {
                                add(BigDecimal.valueOf(data.getOverall().getBaselineValue()).setScale(1, RoundingMode.CEILING));
                                add(BigDecimal.valueOf(data.getOverall().getOneDotFiveDegreeShortTerm()).setScale(1, RoundingMode.CEILING));
                                add(BigDecimal.valueOf(data.getOverall().getOneDotFiveDegreeLongTerm()).setScale(1, RoundingMode.CEILING));
                            }
                        }).build()
                );

                add(DataSet.builder().label("2.0\u00B0")
                        .data(new LinkedList<>() {
                            {
                                add(BigDecimal.valueOf(data.getOverall().getBaselineValue()).setScale(1, RoundingMode.CEILING));
                                add(BigDecimal.valueOf(data.getOverall().getTwoDegreeShortTerm()).setScale(1, RoundingMode.CEILING));
                                add(BigDecimal.valueOf(data.getOverall().getTwoDegreeLongTerm()).setScale(1, RoundingMode.CEILING));
                            }
                        }).build()
                );
            }
        };
    }

    private LinkedList<DataSet> getSupplierEmissionDataSets(ImpactTemperatureAlignment data
            , List<ImpactTemperatureAlignment> listImpactTemperatureAlignment) {
        return new LinkedList<>() {
            {
                if (!listImpactTemperatureAlignment.isEmpty()) {
                    listImpactTemperatureAlignment.forEach(supplier -> {
                        add(DataSet.builder().label(supplier.getKey().getOrganisation().getCompanyName())
                                .data(new LinkedList<>() {
                                    {
                                        add(BigDecimal.valueOf(supplier.getOverall().getBaselineValue()).setScale(1, RoundingMode.CEILING));
                                        add(BigDecimal.valueOf(supplier.getOverall().getActualShortTerm()).setScale(1, RoundingMode.CEILING));
                                        add(BigDecimal.valueOf(supplier.getOverall().getActualLongTerm()).setScale(1, RoundingMode.CEILING));
                                    }
                                }).build()
                        );
                    });
                }
                add(DataSet.builder().label("1.5\u00B0")
                        .data(new LinkedList<>() {
                            {
                                add(BigDecimal.valueOf(data.getOverall().getBaselineValue()).setScale(1, RoundingMode.CEILING));
                                add(BigDecimal.valueOf(data.getOverall().getOneDotFiveDegreeShortTerm()).setScale(1, RoundingMode.CEILING));
                                add(BigDecimal.valueOf(data.getOverall().getOneDotFiveDegreeLongTerm()).setScale(1, RoundingMode.CEILING));
                            }
                        }).build()
                );

                add(DataSet.builder().label("2.0\u00B0")
                        .data(new LinkedList<>() {
                            {
                                add(BigDecimal.valueOf(data.getOverall().getBaselineValue()).setScale(1, RoundingMode.CEILING));
                                add(BigDecimal.valueOf(data.getOverall().getTwoDegreeShortTerm()).setScale(1, RoundingMode.CEILING));
                                add(BigDecimal.valueOf(data.getOverall().getTwoDegreeLongTerm()).setScale(1, RoundingMode.CEILING));
                            }
                        }).build()
                );
            }
        };
    }

    private LinkedList<ChartSet> getPercentage_1_5_Numbers(ScoreChainNumbers scoreNumbers) {
        if (scoreNumbers != null) {
            return new LinkedList<>() {{
                add(ChartSet.builder().label("0-25%").value(scoreNumbers.getProbability_1_5_Score_25()).build());
                add(ChartSet.builder().label("25-50%").value(scoreNumbers.getProbability_1_5_ScoreLess_50()).build());
                add(ChartSet.builder().label("50-75%").value(scoreNumbers.getProbability_1_5_ScoreLess_70()).build());
                add(ChartSet.builder().label("> 75%").value(scoreNumbers.getProbability_1_5_ScoreMore_70()).build());
            }};
        } else {
            return getChartSetsDefault();
        }
    }

    private LinkedList<ChartSet> getChartSetsDefault() {
        return new LinkedList<>() {{
            add(ChartSet.builder().label("0-25%").value(0).build());
            add(ChartSet.builder().label("25-50%").value(0).build());
            add(ChartSet.builder().label("50-75%").value(0).build());
            add(ChartSet.builder().label("> 75%").value(0).build());
        }};
    }

    private LinkedList<ChartSet> getPercentage_2_Numbers(ScoreChainNumbers scoreNumbers) {
        if (scoreNumbers != null) {
            return new LinkedList<>() {{
                add(ChartSet.builder().label("0-25%").value(scoreNumbers.getProbability_2_Score_25()).build());
                add(ChartSet.builder().label("25-50%").value(scoreNumbers.getProbability_2_ScoreLess_50()).build());
                add(ChartSet.builder().label("50-75%").value(scoreNumbers.getProbability_2_ScoreLess_70()).build());
                add(ChartSet.builder().label("> 75%").value(scoreNumbers.getProbability_2_ScoreMore_70()).build());
            }};
        } else {
            return getChartSetsDefault();
        }
    }

    private LinkedList<ChartSet> getScoreNumbers(ScoreChainNumbers scoreNumbers) {
        if (scoreNumbers != null) {
            return new LinkedList<>() {{
                add(ChartSet.builder().label("1.5\u00B0").value(scoreNumbers.getTemperatureScore_1_5()).build());
                add(ChartSet.builder().label("< 2\u00B0").value(scoreNumbers.getTemperatureScoreLess_2()).build());
                add(ChartSet.builder().label("< 3\u00B0").value(scoreNumbers.getTemperatureScoreLess_3()).build());
                add(ChartSet.builder().label("> 3\u00B0").value(scoreNumbers.getTemperatureScoreMore_3()).build());
            }};
        } else {
            return new LinkedList<>() {{
                add(ChartSet.builder().label("1.5\u00B0").value(0).build());
                add(ChartSet.builder().label("< 2\u00B0").value(0).build());
                add(ChartSet.builder().label("< 3\u00B0").value(0).build());
                add(ChartSet.builder().label("> 3\u00B0").value(0).build());
            }};
        }
    }

    public SupplierCountDto getCountSuppliers(final CustomUserDetailsModel user, Integer year) {
        List<SupplyChain> listSuppliers = this.supplyChainRepository.findByCustomerCompanyIdAndDateRemovedIsNull(user.getCompanyId());
        List<ImpactTemperatureAlignment> listImpactTemperatureAlignment =
                this.getCompanySupplyChainImpactTemperatureAlignments(user.getCompanyId(), year);
        return SupplierCountDto.builder().total((long)listSuppliers.size()).available((long)listImpactTemperatureAlignment.size()).build();
    }
}
