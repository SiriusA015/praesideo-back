package earth.praesideo.database.entities.impactm;

import com.fasterxml.jackson.annotation.JsonIgnore;
import earth.praesideo.database.entities.common.BaseModifyListenedEntity;
import earth.praesideo.database.entities.common.YearRepresentationEntity;
import earth.praesideo.database.entities.users.CompanyEntity;
import lombok.Getter;
import lombok.Setter;
import lombok.experimental.Accessors;

import javax.persistence.*;
import java.util.Date;
import java.util.List;

@Entity
@Table(name = "t_data_impactm_emission", schema = "impact")
@Getter
@Setter
@Accessors(chain = true)
public class DataImpactmEmissionEntity extends BaseModifyListenedEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
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

    @JsonIgnore
    @ManyToOne
    @JoinColumn(name = "companyId", insertable = false, updatable = false)
    private CompanyEntity company;

    @OneToOne
    @JoinColumn(name = "yearRepresentationId", insertable = false, updatable = false)
    private YearRepresentationEntity yearRepresentationEntity;

    @OneToMany(mappedBy = "dataImpactmEmission")
    private List<DataImpactmScope1FuelCombustionEntity> dataImpactmScope1FuelCombustion;

    @OneToMany(mappedBy = "dataImpactmEmission")
    private List<DataImpactmScope1DistanceEntity> dataImpactmScope1Distance;

    @OneToMany(mappedBy = "dataImpactmEmission")
    private List<DataImpactmScope1RefrigeratorsEntity> dataImpactmScope1Refrigerators;

    @OneToMany(mappedBy = "dataImpactmEmission")
    private List<DataImpactmScope1ExtinguishersEntity> dataImpactmScope1Extinguishers;

    @OneToMany(mappedBy = "dataImpactmEmission")
    private List<DataImpactmScope2ElectricityEntity> dataImpactmScope2Electricity;

    @OneToMany(mappedBy = "dataImpactmEmission")
    private List<DataImpactmScope3EmployeeCommuteEntity> dataImpactmScope3EmployeeCommute;

    @OneToMany(mappedBy = "dataImpactmEmission")
    private List<DataImpactmScope3BusinessTravelEntity> dataImpactmScope3BusinessTravel;

}
