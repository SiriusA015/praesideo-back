package earth.praesideo.database.entities.datasets;

import com.fasterxml.jackson.annotation.JsonIgnore;
import earth.praesideo.database.entities.common.BaseModifyListenedEntity;
import lombok.Data;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "t_data_recent_year_emissions_carbon_credit_category", schema = "impact")
@Data
public class DataSetRecentYearEmissionsCarbonCreditsCategoryEntity extends BaseModifyListenedEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer recentYearEmissionsCarbonCreditCategoryIs;
    private Integer carbonCreditCategoryId; //TODO Add relation
    private Integer recentYearEmissionsId;

    @OneToMany(mappedBy = "recentYearEmissionsCarbonCreditsCategory", cascade = CascadeType.ALL)
    private List<DataSetRecentYearEmissionsCarbonCreditsCategoryTypeEntity> recentYearEmissionsCarbonCreditsCategoryTypes = new ArrayList<>();

    @JsonIgnore
    @ManyToOne
    @JoinColumn(name = "recentYearEmissionsId", updatable = false, insertable = false)
    private DataSetRecentYearEmissionsEntity dataSetRecentYearEmissions;
}
