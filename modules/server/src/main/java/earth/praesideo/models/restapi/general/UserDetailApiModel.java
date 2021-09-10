package earth.praesideo.models.restapi.general;

import earth.praesideo.database.entities.common.HomeStockExchangeEntity;
import earth.praesideo.database.entities.common.IndustrySectorEntity;
import earth.praesideo.database.entities.common.IndustrySubSectorEntity;
import lombok.Data;

@Data
public class UserDetailApiModel {
    private String companyName;
    private String companyDescription;
    private String city;
    private String country;
    private String location;
    private Boolean stockExchangeListed;

    private HomeStockExchangeEntity homeStockExchange;

    private IndustrySectorEntity industrySector;

    private IndustrySubSectorEntity industrySubSector;

}
