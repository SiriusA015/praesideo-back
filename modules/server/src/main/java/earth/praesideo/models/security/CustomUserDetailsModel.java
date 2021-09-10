package earth.praesideo.models.security;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.User;

import java.util.Collection;

/**
 * Class
 * Developer: Cristian Ando-Ciupav
 * Email: accexpert@gmail.com
 * Date: 7/31/2021
 * Project: aws-test
 */
public class CustomUserDetailsModel extends User {
    private Integer userId;
    private String activationString;
    private Integer companyId;
    private String industrySector;
    private String industrySubsector;
    private Boolean enabled;
    private Integer yearRepresentationId;

    public CustomUserDetailsModel(Integer userId,
                                  Integer companyId,
                                  String activationString,
                                  String username,
                                  String password,
                                  Collection<? extends GrantedAuthority> authorities,
                                  Boolean enabled) {
        super(username, password, authorities);
        this.userId               = userId;
        this.companyId            = companyId;
        this.activationString     = activationString;
        this.enabled              = enabled;
    }

    public Integer getUserId() {
        return userId;
    }

    public Boolean getEnabled() {
        return enabled;
    }

    public void setEnabled(Boolean enabled) {
        this.enabled = enabled;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public String getActivationString() {
        return activationString;
    }

    public void setActivationString(String activationString) {
        this.activationString = activationString;
    }

    public Integer getCompanyId() {
        return companyId;
    }

    public void setCompanyId(Integer companyId) {
        this.companyId = companyId;
    }

    public String getIndustrySector() {
        return industrySector;
    }

    public void setIndustrySector(String industrySector) {
        this.industrySector = industrySector;
    }

    public String getIndustrySubsector() {
        return industrySubsector;
    }

    public void setIndustrySubsector(String industrySubsector) {
        this.industrySubsector = industrySubsector;
    }

    public Integer getYearRepresentationId() {
        return yearRepresentationId;
    }

    public void setYearRepresentationId(Integer yearRepresentationId) {
        this.yearRepresentationId = yearRepresentationId;
    }
}
