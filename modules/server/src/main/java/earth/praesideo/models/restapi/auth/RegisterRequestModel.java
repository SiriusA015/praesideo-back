package earth.praesideo.models.restapi.auth;

import earth.praesideo.models.restapi.BaseApiModel;
import lombok.Data;

import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;

@Data
public class RegisterRequestModel extends BaseApiModel {
    private String firstName;
    private String lastName;
    @NotNull
    @NotEmpty
    private String email;
    @NotNull
    @NotEmpty
    private String password;
    private Integer companyId;
    private Integer cid;
    // User facing question: Which of the following best describes your entities business activities
    private Integer customerTypeId;
    private Integer customerSubTypeId;
    // Concept here would to have like a phone plan summary of the product options,
    // that overviews the features and allows a user to select which one they want to purchase.
    private Integer productTypeId;
}
