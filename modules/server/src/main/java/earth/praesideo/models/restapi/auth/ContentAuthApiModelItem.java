package earth.praesideo.models.restapi.auth;

import earth.praesideo.enums.BlockContext;
import lombok.Data;

@Data
public class ContentAuthApiModelItem {
    public BlockContext blockContext;
    public Boolean isBlock;
    public String blockMessage;
}
