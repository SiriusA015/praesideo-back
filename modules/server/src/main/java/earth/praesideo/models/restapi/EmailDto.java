package earth.praesideo.models.restapi;

import io.swagger.annotations.ApiModelProperty;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;

/**
 * @author Koshman Vadim
 */

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class EmailDto {

    @ApiModelProperty(name = "email", value = "A valid user email.", required = true)
    @NotNull(message = "Email must not be null.")
    private String email;
}
