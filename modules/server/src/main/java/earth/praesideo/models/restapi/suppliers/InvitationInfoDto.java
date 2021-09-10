package earth.praesideo.models.restapi.suppliers;

import lombok.Data;

import java.util.List;

/**
 * @author Koshman Vadim
 */
@Data
public class InvitationInfoDto {
    private String subject;
    private String body;
    List<InviteSupplyChainDto> cc;
    InviteSupplyChainDto to;
}
