package earth.praesideo.database.entities.datasets;

import com.fasterxml.jackson.annotation.JsonIgnore;

import java.util.Set;

import earth.praesideo.database.entities.common.BaseModifyListenedEntity;
import earth.praesideo.database.entities.common.YearRepresentationEntity;
import earth.praesideo.database.entities.users.CompanyEntity;
import lombok.Data;

import javax.persistence.*;
import java.util.List;

@Entity
@Table(name = "t_data_emissions_reduction", schema = "impact")
@Data
public class DataSetEmissionsReductionEntity extends BaseModifyListenedEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer emissionsReductionId;

    private Double scope1;
    private Double scope2;
    private Double scope3;

    private Integer yearRepresentationId;
    private Boolean isFinancialYear;
    private Integer financialYearStartMonth;

    @Column(columnDefinition = "boolean default true")
    private Boolean isEmissionsReductionPresent;

    @JsonIgnore
    @ManyToOne
    @JoinColumn(name = "companyId")
    private CompanyEntity company;

    @JsonIgnore
    @OneToOne
    @JoinColumn(name = "yearRepresentationId", insertable = false, updatable = false)
    private YearRepresentationEntity yearRepresentation;

    @OneToMany(mappedBy = "emissionsReduction", cascade = CascadeType.ALL)
    private List<DataSetEmissionsReductionTargetsEntity> emissionsReductionTargets;

    @OneToMany(mappedBy = "emissionsReduction", cascade = CascadeType.ALL, orphanRemoval = true)
    private Set<DataSetEmissionsReductionShortTermEntity> emissionsReductionShortTerms;

    public void setEmissionsReductionShortTerms(Set<DataSetEmissionsReductionShortTermEntity> emissionsReductionShortTerms) {
        if (this.emissionsReductionShortTerms == null) {
            this.emissionsReductionShortTerms = emissionsReductionShortTerms;
        } else {
            this.emissionsReductionShortTerms.clear();
            if (emissionsReductionShortTerms != null) {
                this.emissionsReductionShortTerms.addAll(emissionsReductionShortTerms);
            }
        }
    }
}
