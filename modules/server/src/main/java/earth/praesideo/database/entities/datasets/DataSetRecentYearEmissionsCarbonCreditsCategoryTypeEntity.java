package earth.praesideo.database.entities.datasets;

import com.fasterxml.jackson.annotation.JsonIgnore;
import earth.praesideo.database.entities.common.BaseModifyListenedEntity;
import lombok.Data;

import javax.persistence.*;

@Entity
@Table(name = "t_data_recent_year_emissions_carbon_credit_category_type", schema = "impact")
@Data
public class DataSetRecentYearEmissionsCarbonCreditsCategoryTypeEntity extends BaseModifyListenedEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer recentYearEmissionsCarbonCreditCategoryTypeIs;

    private Integer carbonCompensationTypeId; //TODO Add relation
    private Double quantity;
    private Integer cost;
    private String certificationBody;

    @JsonIgnore
    @ManyToOne
    @JoinColumn(name = "recentYearEmissionsCarbonCreditCategoryIs")
    private DataSetRecentYearEmissionsCarbonCreditsCategoryEntity recentYearEmissionsCarbonCreditsCategory;

}
