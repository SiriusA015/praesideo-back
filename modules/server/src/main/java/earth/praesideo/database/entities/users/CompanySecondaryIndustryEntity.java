package earth.praesideo.database.entities.users;

import com.fasterxml.jackson.annotation.JsonIgnore;
import earth.praesideo.database.entities.common.BaseModifyListenedEntity;
import earth.praesideo.database.entities.common.IndustrySectorEntity;
import earth.praesideo.database.entities.common.IndustrySubSectorEntity;
import earth.praesideo.database.entities.common.RefCountryEntity;
import lombok.Getter;
import lombok.Setter;
import lombok.experimental.Accessors;

import javax.persistence.*;
import java.util.Date;

@Entity
@Table(name = "t_companies_secondary_industry")
@Getter
@Setter
@Accessors(chain = true)
public class CompanySecondaryIndustryEntity extends BaseModifyListenedEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    private String city;
    private Integer countryId;
    private Integer industrySectorId;
    private Integer industrySubsectorId;
    private Integer companyId;

    @OneToOne
    @JoinColumn(name = "industrySectorId", insertable = false, updatable = false)
    private IndustrySectorEntity industrySector;

    @OneToOne
    @JoinColumn(name = "industrySubsectorId", insertable = false, updatable = false)
    private IndustrySubSectorEntity industrySubSector;

    @JsonIgnore
    @ManyToOne
    @JoinColumn(name = "companyId", insertable = false, updatable = false)
    private CompanyEntity company;

}
