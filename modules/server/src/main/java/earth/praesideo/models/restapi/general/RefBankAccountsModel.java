package earth.praesideo.models.restapi.general;

import earth.praesideo.models.restapi.BaseApiModel;
import lombok.Data;

@Data
public class RefBankAccountsModel extends BaseApiModel {
    private Integer id;
    private String currency;
    private String bankName;
    private String accountName;
    private String accountNumber;
    private String bicCode;
    private String accountHolderAddress;
    private String country;
}
