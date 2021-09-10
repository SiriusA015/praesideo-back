package earth.praesideo.database.entities.datasets;

import com.fasterxml.jackson.annotation.JsonIgnore;
import earth.praesideo.database.entities.common.BaseModifyListenedEntity;
import earth.praesideo.database.entities.common.OperationalBoundaryEntity;
import lombok.Data;

import javax.persistence.*;

@Entity
@Table(name = "t_data_recent_year_emissions_source", schema = "impact")
@Data
public class DataSetRecentYearEmissionsSourceEntity extends BaseModifyListenedEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer recentYearEmissionsSourceIs;
    private Integer sourceValue;
    //TODO Add relation to operational boundary
    private Integer operationalBoundaryId;
    private Integer recentYearEmissionsId;

    @JsonIgnore
    @ManyToOne
    @JoinColumn(name = "recentYearEmissionsId", updatable = false, insertable = false)
    private DataSetRecentYearEmissionsEntity dataSetRecentYearEmissions;

    @OneToOne
    @JoinColumn(name = "operationalBoundaryId", updatable = false, insertable = false)
    private OperationalBoundaryEntity operationalBoundary;

}
