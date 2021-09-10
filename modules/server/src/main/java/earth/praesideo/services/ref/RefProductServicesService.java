package earth.praesideo.services.ref;

import earth.praesideo.database.entities.common.RefProductServicesEntity;
import earth.praesideo.models.security.CustomUserDetailsModel;
import earth.praesideo.database.repositories.common.RefProductServicesRepository;
import earth.praesideo.exceptions.ApiException;
import earth.praesideo.exceptions.ExceptionContent;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;

import java.util.Date;

@Service
public class RefProductServicesService {
    private final RefProductServicesRepository refProductServicesRepository;

    @Autowired
    public RefProductServicesService(RefProductServicesRepository refProductServicesRepository) {
        this.refProductServicesRepository = refProductServicesRepository;
    }
    public RefProductServicesEntity createNewRefProductServices(CustomUserDetailsModel user, String prodServName) {
        var refProdServices
                = refProductServicesRepository.findRefProductServicesEntityByProdServNameIgnoreCase(prodServName);
        if (refProdServices.isPresent()) {
            throw new ApiException(ExceptionContent.PROD_SERV_ALREADY_EXISTS, HttpStatus.CONFLICT);
        }
        var newProdServ = new RefProductServicesEntity();
        newProdServ.setProdServName(prodServName);
        newProdServ.setAddedBy(user.getUsername());
        newProdServ.setDateAdded(new Date());
        return refProductServicesRepository.save(newProdServ);
    }
}
