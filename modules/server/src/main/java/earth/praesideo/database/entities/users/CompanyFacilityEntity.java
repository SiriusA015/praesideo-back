package earth.praesideo.database.entities.users;

import com.fasterxml.jackson.annotation.JsonIgnore;
import earth.praesideo.controllers.common.RefCountryStateController;
import earth.praesideo.database.entities.common.BaseModifyListenedEntity;
import earth.praesideo.database.entities.common.RefCountryEntity;
import earth.praesideo.database.entities.common.RefCountryStateEntity;
import lombok.Getter;
import lombok.Setter;
import lombok.experimental.Accessors;

import javax.persistence.*;
import java.util.Date;

@Entity
@Table(name = "t_company_facilities")
@Getter
@Setter
@Accessors(chain = true)
public class CompanyFacilityEntity extends BaseModifyListenedEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer facilityId;
    private Integer companyId;
    private String facilityName;
    private String facilityCity;
    private Integer facilityCountryId;
    private Integer facilityStateId;
    private String facilityAddress;
    private Integer facilityOwnerCompanyId;
    private Integer facilityOperationCompanyId;

    @JsonIgnore
    @ManyToOne
    @JoinColumn(name = "companyId", insertable = false, updatable = false)
    private CompanyEntity company;

    @JsonIgnore
    @OneToOne
    @JoinColumn(name = "facilityOwnerCompanyId", insertable = false, updatable = false)
    private CompanyEntity facilityOwnerCompany;

    @JsonIgnore
    @OneToOne
    @JoinColumn(name = "facilityOperationCompanyId", insertable = false, updatable = false)
    private CompanyEntity facilityOperationCompany;

    @JsonIgnore
    @OneToOne
    @JoinColumn(name = "facilityCountryId", insertable = false, updatable = false)
    private RefCountryEntity refCountry;

    @JsonIgnore
    @OneToOne
    @JoinColumn(name = "facilityStateId", insertable = false, updatable = false)
    private RefCountryStateEntity refCountryState;
}
