package earth.praesideo.services;

import earth.praesideo.database.entities.datasets.DataSetRecentYearEmissionsEntity;
import earth.praesideo.database.entities.datasets.DataSetRecentYearEmissionsSourceEntity;
import earth.praesideo.database.repositories.datasets.DataSetRecentYearEmissionsRepository;
import earth.praesideo.database.repositories.datasets.DataSetRecentYearEmissionsSourceRepository;
import earth.praesideo.database.repositories.impactm.DataImpactmEmissionRepository;
import earth.praesideo.models.restapi.impactm.*;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.math.RoundingMode;
import java.util.LinkedList;
import java.util.List;
import java.util.Optional;


@AllArgsConstructor
@Service
public class ImpactmChartService {

    private final DataSetRecentYearEmissionsRepository dataSetRecentYearEmissionsRepository;
    private final DataSetRecentYearEmissionsSourceRepository dataSetRecentYearEmissionsSourceRepository;
    private final DataImpactmEmissionRepository dataImpactmEmissionRepository;
    private final ImpactmService impactmService;

    public DataImpactmChartModel getImpactmChartData2(final Integer companyId, final Integer yearRepresentationId) {
        System.out.println("---------test------------");
        final DataImpactmChartModel result = new DataImpactmChartModel();
        Optional<DataSetRecentYearEmissionsEntity> dataSetRecentYearEmissionsEntity = this.dataSetRecentYearEmissionsRepository.
                findFirstByCompanyCompanyIdAndYearRepresentationYearRepresentationId(companyId, yearRepresentationId);

        EmissionCalculationScope calculationData = impactmService.getImpactCalculationData(companyId, yearRepresentationId);

        if (calculationData.getIsMeasurement()){
            dataSetRecentYearEmissionsEntity.get().setScope3(calculationData.getScope3Total().doubleValue());
        }

        List<EmissionChartItemModel> scope1 = new LinkedList<>();
        List<EmissionChartItemModel> scope2 = new LinkedList<>();
        List<EmissionChartItemModel> scope3 = new LinkedList<>();
        if (dataSetRecentYearEmissionsEntity.isPresent()) {
            List<DataSetRecentYearEmissionsSourceEntity> listDataSetRecentYearEmissionsSourceEntity
                    = this.dataSetRecentYearEmissionsSourceRepository.
                    findByRecentYearEmissionsId(dataSetRecentYearEmissionsEntity.get().getRecentYearEmissionsId());
            if (listDataSetRecentYearEmissionsSourceEntity != null && !listDataSetRecentYearEmissionsSourceEntity.isEmpty()) {
                listDataSetRecentYearEmissionsSourceEntity.forEach(row -> {
                    if (row.getOperationalBoundaryId().intValue() <= 7) {
                        EmissionChartItemModel chartItem = new EmissionChartItemModel();
                        chartItem.setItemText(row.getOperationalBoundary().getName());
                        if (row.getSourceValue() != null) {
                            chartItem.setItemValue(BigDecimal.valueOf(row.getSourceValue()));
                        } else {
                            chartItem.setItemValue(BigDecimal.ZERO);
                        }
                        scope1.add(chartItem);
                    } else if (row.getOperationalBoundaryId().intValue() >= 8 && row.getOperationalBoundaryId().intValue() < 9) {
                        EmissionChartItemModel chartItem = new EmissionChartItemModel();
                        chartItem.setItemText(row.getOperationalBoundary().getName());
                        if (row.getSourceValue() != null) {
                            chartItem.setItemValue(BigDecimal.valueOf(row.getSourceValue()));
                        } else {
                            chartItem.setItemValue(BigDecimal.ZERO);
                        }
                        scope2.add(chartItem);
                    } else if (row.getOperationalBoundaryId().intValue() > 9) {
                        EmissionChartItemModel chartItem = new EmissionChartItemModel();
                        chartItem.setItemText(row.getOperationalBoundary().getName());

                        if (calculationData.getIsMeasurement() && (row.getOperationalBoundaryId().intValue() == 15 || row.getOperationalBoundaryId().intValue() == 16)) {
                            if (row.getOperationalBoundaryId().intValue() == 16){
                                chartItem.setItemValue(calculationData.getScope3EmployeeCommute());
                            }
                            if (row.getOperationalBoundaryId().intValue() == 15){
                                chartItem.setItemValue(calculationData.getScope3BusinessTravel());
                            }
                        }else{
                            if (row.getSourceValue() != null) {
                                chartItem.setItemValue(BigDecimal.valueOf(row.getSourceValue()));
                            } else {
                                chartItem.setItemValue(BigDecimal.ZERO);
                            }
                        }
                        scope3.add(chartItem);
                    }
                });
                result.setEmissionChartBySourceModel(this.getEmissionChartBySourceModel(scope1, scope2, scope3));
                    result.setEmissionChartByActivityModel(this.getEmissionChartByActivityModel(scope1, scope2, scope3));
            }
            result.setEmissionChartByScopeModel(this.getEmissionChartByScopeModel(dataSetRecentYearEmissionsEntity.get()));
        }
        return result;
    }

    private EmissionChartBySourceModel getEmissionChartBySourceModel(List<EmissionChartItemModel> scope1,
                                                                     List<EmissionChartItemModel> scope2,
                                                                     List<EmissionChartItemModel> scope3) {
        EmissionChartBySourceModel bySource = new EmissionChartBySourceModel();
        BigDecimal totalScope1 = BigDecimal.ZERO;
        BigDecimal totalScope2 = BigDecimal.ZERO;
        BigDecimal totalScope3 = BigDecimal.ZERO;
        if (!scope1.isEmpty()) {
            totalScope1 = totalScope1.add(scope1.stream().map(EmissionChartItemModel::getItemValue).reduce(BigDecimal.ZERO, BigDecimal::add));
            for (EmissionChartItemModel emissionChartItemModel : scope1) {
                if (totalScope1.compareTo(BigDecimal.ZERO) != 0 && emissionChartItemModel.getItemValue() != null) {
                    emissionChartItemModel.
                            setItemPercentage(emissionChartItemModel.getItemValue()
                                    .multiply(BigDecimal.valueOf(100))
                                    .divide(totalScope1, 1, RoundingMode.HALF_UP));
                } else {
                    emissionChartItemModel.setItemPercentage(BigDecimal.ZERO);
                }
            }
        }
        if (!scope2.isEmpty()) {
            totalScope2 = totalScope2.add(scope2.stream().map(EmissionChartItemModel::getItemValue).reduce(BigDecimal.ZERO, BigDecimal::add));
            for (EmissionChartItemModel emissionChartItemModel : scope2) {
                if (totalScope2.compareTo(BigDecimal.ZERO) != 0 && emissionChartItemModel.getItemValue() != null) {
                    emissionChartItemModel.
                            setItemPercentage(emissionChartItemModel.getItemValue()
                                    .multiply(BigDecimal.valueOf(100))
                                    .divide(totalScope2, 1, RoundingMode.HALF_UP));
                } else {
                    emissionChartItemModel.setItemPercentage(BigDecimal.ZERO);
                }
            }
        }
        if (!scope3.isEmpty()) {
            totalScope3 = totalScope3.add(scope3.stream().map(EmissionChartItemModel::getItemValue).reduce(BigDecimal.ZERO, BigDecimal::add));
            for (EmissionChartItemModel emissionChartItemModel : scope3) {
                if (totalScope3.compareTo(BigDecimal.ZERO) != 0 && emissionChartItemModel.getItemValue() != null) {
                    emissionChartItemModel.
                            setItemPercentage(emissionChartItemModel.getItemValue()
                                    .multiply(BigDecimal.valueOf(100))
                                    .divide(totalScope3, 1, RoundingMode.HALF_UP));
                } else {
                    emissionChartItemModel.setItemPercentage(BigDecimal.ZERO);
                }
            }
        }
        bySource.setScope1(scope1);
        bySource.setScope2(scope2);
        bySource.setScope3(scope3);
        return bySource;
    }

    private EmissionChartByScopeModel getEmissionChartByScopeModel(DataSetRecentYearEmissionsEntity dataSetRecentYearEmissionsEntity) {
        EmissionChartByScopeModel byScope = new EmissionChartByScopeModel();
        BigDecimal totalScope1 = BigDecimal.ZERO;
        BigDecimal totalScope2 = BigDecimal.ZERO;
        BigDecimal totalScope3 = BigDecimal.ZERO;

        if (dataSetRecentYearEmissionsEntity.getScope1() != null) {
            totalScope1 = totalScope1.add(BigDecimal.valueOf(dataSetRecentYearEmissionsEntity.getScope1()));
        }
        if (dataSetRecentYearEmissionsEntity.getScope2() != null) {
            totalScope2 = totalScope2.add(BigDecimal.valueOf(dataSetRecentYearEmissionsEntity.getScope2()));
        }
        if (dataSetRecentYearEmissionsEntity.getScope3() != null) {
            totalScope3 = totalScope3.add(BigDecimal.valueOf(dataSetRecentYearEmissionsEntity.getScope3()));
        }

        BigDecimal allTotal = totalScope1.add(totalScope2).add(totalScope3);

        EmissionChartItemModel scope1Row = new EmissionChartItemModel();
        scope1Row.setItemText("Scope 1");
        scope1Row.setItemValue(totalScope1);
        if (allTotal.compareTo(BigDecimal.ZERO) != 0) {
            scope1Row.setItemPercentage(totalScope1
                    .multiply(BigDecimal.valueOf(100))
                    .divide(allTotal, 1, RoundingMode.HALF_UP));
        } else {
            scope1Row.setItemPercentage(BigDecimal.ZERO);
        }
        EmissionChartItemModel scope2Row = new EmissionChartItemModel();
        scope2Row.setItemText("Scope 2");
        scope2Row.setItemValue(totalScope2);
        if (allTotal.compareTo(BigDecimal.ZERO) != 0) {
            scope2Row.setItemPercentage(totalScope2
                    .multiply(BigDecimal.valueOf(100))
                    .divide(allTotal, 1, RoundingMode.HALF_UP));
        } else {
            scope2Row.setItemPercentage(BigDecimal.ZERO);
        }
        EmissionChartItemModel scope3Row = new EmissionChartItemModel();
        scope3Row.setItemText("Scope 3");
        scope3Row.setItemValue(totalScope3);
        if (allTotal.compareTo(BigDecimal.ZERO) != 0) {
            scope3Row.setItemPercentage(totalScope3
                    .multiply(BigDecimal.valueOf(100))
                    .divide(allTotal, 1, RoundingMode.HALF_UP));
        } else {
            scope3Row.setItemPercentage(BigDecimal.ZERO);
        }
        List<EmissionChartItemModel> list = new LinkedList<>();
        list.add(scope1Row);
        list.add(scope2Row);
        list.add(scope3Row);
        byScope.setItemList(list);
        byScope.setTotalTco2(allTotal);
        return byScope;
    }

    private EmissionChartByActivityModel getEmissionChartByActivityModel(List<EmissionChartItemModel> scope1,
                                                                         List<EmissionChartItemModel> scope2,
                                                                         List<EmissionChartItemModel> scope3) {
        EmissionChartByActivityModel byActivity = new EmissionChartByActivityModel();
        BigDecimal total = BigDecimal.ZERO;
        if (!scope1.isEmpty()) {
            total = total.add(scope1.stream().map(EmissionChartItemModel::getItemValue).reduce(BigDecimal.ZERO, BigDecimal::add));
        }
        if (!scope2.isEmpty()) {
            total = total.add(scope2.stream().map(EmissionChartItemModel::getItemValue).reduce(BigDecimal.ZERO, BigDecimal::add));
        }
        if (!scope3.isEmpty()) {
            total = total.add(scope3.stream().map(EmissionChartItemModel::getItemValue).reduce(BigDecimal.ZERO, BigDecimal::add));
        }
        List<EmissionChartItemModel> listAll = new LinkedList<>();
        for (EmissionChartItemModel row : scope1) {
            EmissionChartItemModel newRow = new EmissionChartItemModel();
            newRow.setItemText(row.getItemText());
            newRow.setItemValue(row.getItemValue());
            listAll.add(newRow);
        }
        for (EmissionChartItemModel row : scope2) {
            EmissionChartItemModel newRow = new EmissionChartItemModel();
            newRow.setItemText(row.getItemText());
            newRow.setItemValue(row.getItemValue());
            listAll.add(newRow);
        }
        for (EmissionChartItemModel row : scope3) {
            EmissionChartItemModel newRow = new EmissionChartItemModel();
            newRow.setItemText(row.getItemText());
            newRow.setItemValue(row.getItemValue());
            listAll.add(newRow);
        }
        if (total.compareTo(BigDecimal.ZERO) != 0) {
            for (EmissionChartItemModel row : listAll) {
                if (row.getItemValue() != null && row.getItemValue().compareTo(BigDecimal.ZERO)!=0) {
                    row.setItemPercentage(row.getItemValue()
                            .multiply(BigDecimal.valueOf(100))
                            .divide(total, 2, RoundingMode.HALF_UP));
                } else {
                    row.setItemValue(BigDecimal.valueOf(0.01));
                    row.setItemPercentage(BigDecimal.valueOf(0.01));
                }
            }
        }
        byActivity.setItemList(listAll);
        return byActivity;
    }
}
