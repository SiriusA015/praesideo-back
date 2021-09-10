package earth.praesideo.models.restapi.impactm;

import earth.praesideo.models.restapi.BaseApiModel;
import lombok.Data;
import lombok.Getter;
import lombok.Setter;

import java.util.Collection;
import java.util.List;

@Data
public class DataImpactmEmissionModel extends BaseApiModel {
    private Integer Id;
    private Integer companyId;
    private Boolean isFinancialYear;
    private Integer yearRepresentationId;
    private Integer startMonth;
    private Boolean isMeasurement;
    private Boolean isStationaryCombustion;
    private Boolean isMobileCombustion;
    private Boolean isRefrigerators;
    private Boolean isFireExtinguisher;
    private Boolean isEmployeeCommuteCompleteData;
    private Boolean isEmployeeCommutePartialData;
    private Boolean isEmployeeCommuteApproximateData;
    private Boolean isBusinessTravelCompleteData;
    private Boolean isBusinessTravelPartialData;
    private List<DataImpactmScope1FuelCombustionModel> dataImpactmScope1FuelCombustion;
    private List<DataImpactmScope1FuelCombustionModel> dataImpactmScope1MobileFuelCombustion;
    private List<DataImpactmScope1DistanceModel> dataImpactmScope1Distance;
    private List<DataImpactmScope1RefrigeratorsModel> dataImpactmScope1Refrigerators;
    private List<DataImpactmScope1ExtinguishersModel> dataImpactmScope1Extinguishers;
    private List<DataImpactmScope2ElectricityModel> dataImpactmScope2Electricity;
    private List<DataImpactmScope3EmployeeCommuteModel> dataImpactmScope3EmployeeCommute;
    private List<DataImpactmScope3BusinessTravelModel> dataImpactmScope3BusinessTravel;
}
