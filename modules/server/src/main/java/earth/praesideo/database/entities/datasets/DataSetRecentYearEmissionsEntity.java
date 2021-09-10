package earth.praesideo.database.entities.datasets;

import com.fasterxml.jackson.annotation.JsonIgnore;
import earth.praesideo.database.entities.common.BaseModifyListenedEntity;
import earth.praesideo.database.entities.common.YearRepresentationEntity;
import earth.praesideo.database.entities.users.CompanyEntity;
import lombok.Data;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "t_data_recent_year_emissions", schema = "impact")
@Data
public class DataSetRecentYearEmissionsEntity extends BaseModifyListenedEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer recentYearEmissionsId;

    private Integer yearRepresentationId;
    private Boolean isFinancialYear;
    private Integer financialYearStartMonth;
    private Double scope1;
    private Double scope2;
    private Integer scope2Method;
    private Double scope3;
    private Boolean participationOfCarbonCreditsOrCertificates;
    /**
     * if false then it's recent year emissions
     * if true then it's historical emissions
     */
    private Boolean isHistoricalEmissions;

    @OneToMany(mappedBy = "dataSetRecentYearEmissions", cascade = CascadeType.ALL)
    private List<DataSetRecentYearEmissionsSourceEntity> recentYearEmissionsSources = new ArrayList<>();

    @OneToMany(mappedBy = "dataSetRecentYearEmissions", cascade = CascadeType.ALL)
    private List<DataSetRecentYearEmissionsCarbonCreditsCategoryEntity> recentYearEmissionsCarbonCreditsCategories = new ArrayList<>();

    @JsonIgnore
    @OneToOne
    @JoinColumn(name = "yearRepresentationId", insertable = false, updatable = false)
    private YearRepresentationEntity yearRepresentation;

    @JsonIgnore
    @ManyToOne
    @JoinColumn(name = "companyId")
    private CompanyEntity company;

}
