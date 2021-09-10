package earth.praesideo.services.tech;

import earth.praesideo.database.entities.common.CommonTextEntity;
import earth.praesideo.database.repositories.common.CommonTextRepository;
import earth.praesideo.models.restapi.general.AppDataTextApiModel;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class AppDataTextService {
    private final CommonTextRepository repository;

    @Autowired
    public AppDataTextService(CommonTextRepository repository) {
        this.repository = repository;
    }

    public void addAppDataText(AppDataTextApiModel request) {
        CommonTextEntity cte = new CommonTextEntity();
        cte.setTextKey(request.getTextkey());
        cte.setTextValue(request.getTextvalue());
        cte.setCulture(request.getCulture());
        repository.save(cte);
    }

    public CommonTextEntity updateAppDataText(AppDataTextApiModel request) {
        Optional<CommonTextEntity> cte = repository.findById(request.getId());
        if (cte.isPresent())
        {
            cte.get().setTextKey(request.getTextkey());
            cte.get().setTextValue(request.getTextvalue());
            cte.get().setCulture(request.getCulture());
            repository.save(cte.get());
        }
        return cte.get();
    }
    public void deleteAppDataText(Integer id) {
            repository.deleteById(id);
    }

    public List<CommonTextEntity> getAllText() {
        return repository.findAll();
    }
    public Optional<CommonTextEntity> getById(Integer id) {
        return repository.findById(id);
    }
    public List<CommonTextEntity> getByKey(String key) {
        return repository.findByTextKey(key);
    }
    public CommonTextEntity getFirstByKey(String key) {
        return repository.findFirstByTextKey(key);
    }
    public CommonTextEntity filterByKey (List<CommonTextEntity> list, String key) {
        for (CommonTextEntity row:list) {
            if (row.getTextKey().equalsIgnoreCase(key)) {
                return row;
            }
        }
        CommonTextEntity emptyRow = new CommonTextEntity();
        emptyRow.setTextKey(key);
        emptyRow.setTextValue(key);
        return emptyRow;
    }
}
