package earth.praesideo.database.entities.users;

import com.fasterxml.jackson.annotation.JsonFormat;
import earth.praesideo.database.entities.common.*;
import earth.praesideo.database.entities.impactm.DataImpactmEmissionEntity;
import lombok.Getter;
import lombok.Setter;
import lombok.experimental.Accessors;
import org.joda.time.DateTime;

import javax.persistence.*;
import java.sql.Timestamp;
import java.util.Date;
import java.util.List;

@Entity
@Table(name = "t_companies")
@Getter
@Setter
@Accessors(chain = true)
public class CompanyEntity extends BaseModifyListenedEntity{
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer companyId;
    private Integer statusId;
    private String companyName;
    private String companyDescription;
    private String city;
    private Integer countryId;
    private Integer stateId;
    private String location;
    private Boolean stockExchangeListed;
    private Integer homeStockExchangeId;
    private Integer industrySectorId;
    private Integer industrySubsectorId;
    private String companyDomain;
    private Integer productSelectionId;
    private Integer customerTypeId;
    private Boolean isParentcompany;
    private Boolean isSubsidiary;
    private Boolean isJointventure;
    private Boolean isStandalone;
    private Integer yearRepresentationId;
    private Integer startMonth;
    private Boolean isFinancialYear;
    @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "dd-MM-yyyy hh:mm:ss")
    private Timestamp statusDate;

    @Version
    private int version;

    @OneToOne
    @JoinColumn(name = "yearRepresentationId", insertable = false, updatable = false)
    private YearRepresentationEntity yearRepresentation;

    @OneToOne
    @JoinColumn(name = "homeStockExchangeId", insertable = false, updatable = false)
    private HomeStockExchangeEntity homeStockExchange;

    @OneToOne
    @JoinColumn(name = "industrySectorId", insertable = false, updatable = false)
    private IndustrySectorEntity industrySector;

    @OneToOne
    @JoinColumn(name = "industrySubsectorId", insertable = false, updatable = false)
    private IndustrySubSectorEntity industrySubSector;

    @OneToMany(mappedBy = "company")
    private List<UserEntity> users;

    @OneToOne
    @JoinColumn(name = "productSelectionId", insertable = false, updatable = false)
    private ProductSelectionEntity productSelection;

    @OneToOne
    @JoinColumn(name = "statusId", insertable = false, updatable = false)
    private CompanyStatusEntity companyStatus;

    @OneToOne
    @JoinColumn(name = "customerTypeId", insertable = false, updatable = false)
    private CustomerTypeEntity customerType;

    @OneToOne
    @JoinColumn(name = "countryId", insertable = false, updatable = false)
    private RefCountryEntity refCountry;

    @OneToOne
    @JoinColumn(name = "stateId", insertable = false, updatable = false)
    private RefCountryStateEntity refCountryState;

    @OneToOne(mappedBy = "company")
    private UserFinancialDetailsEntity userFinancialDetails;

    @OneToMany(mappedBy = "company")
    private List<CompanySecondaryIndustryEntity> companySecondaryIndustryEntity;

    @OneToMany(mappedBy = "company")
    private List<CompanyStructureEntity> companyStructureEntity;

    @OneToMany(mappedBy = "company")
    private List<CompanyFacilityEntity> companyFacilityEntity;

    @OneToMany(mappedBy = "company")
    private List<CompanyProductServicesEntity> CompanyProductServices;

    @OneToMany(mappedBy = "company")
    private List<DataImpactmEmissionEntity> dataImpactmEmission;
}
