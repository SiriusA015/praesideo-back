package earth.praesideo.database.entities.common;

import lombok.Getter;
import lombok.Setter;
import lombok.experimental.Accessors;

import javax.persistence.*;

@Entity
@Table(name = "t_ref_bank_accounts", schema = "static")
@Getter
@Setter
@Accessors(chain = true)
public class RefBankAccountsEntity extends BaseModifyListenedEntity{
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    private String bankName;
    private String accountName;
    private String accountNumber;
    private String bicCode;
    private String accountHolderAddress;

    @OneToOne
    @JoinColumn(name = "currencyId")
    private BaseCurrencyEntity currency;

    @OneToOne
    @JoinColumn(name = "countryId")
    private RefCountryEntity country;
}
