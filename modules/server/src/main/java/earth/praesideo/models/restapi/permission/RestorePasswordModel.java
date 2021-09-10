package earth.praesideo.models.restapi.permission;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

/**
 * @author Koshman Vadim
 */
@Data
@ApiModel
public class RestorePasswordModel {
    @ApiModelProperty(required = true, name = "email", value = "Email address of user")
    private String email;
    @ApiModelProperty(required = true, name = "newPassword", value = "New user password which has at least 6 characters.")
    @NotNull(message = "Password must not be null.")
    @Size(min = 6, message = "Your password must have at least 6 characters.")
    private String newPassword;

    @ApiModelProperty(required = true, name = "confirmedPassword", value = "Confirmed new user password.")
    @NotNull(message = "Confirmed password must not be null.")
    @Size(min = 6, message = "Your confirmed password must have at least 6 characters.")
    private String confirmPassword;
}
