package earth.praesideo.services.ref;

import earth.praesideo.database.entities.common.RefListEntity;
import earth.praesideo.database.repositories.common.RefListRepository;
import earth.praesideo.models.security.CustomUserDetailsModel;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.Cache;
import org.springframework.cache.CacheManager;
import org.springframework.cache.config.CacheManagementConfigUtils;
import org.springframework.stereotype.Service;

import java.util.Collection;
import java.util.Date;
import java.util.List;
import java.util.Optional;

@Service
public class RefListService {
    private final RefListRepository refListRepository;

    @Autowired
    public RefListService(RefListRepository refListRepository) {
        this.refListRepository = refListRepository;
    }

    public RefListEntity addNewRefListValue(CustomUserDetailsModel user, String listKey, String listValue) {
        var refListEntity
                = refListRepository.findByListKeyAndListValueIgnoreCase(listKey, listValue);
        if (refListEntity.isEmpty()) {
            var newListValue = new RefListEntity();
            newListValue.setListKey(listKey);
            newListValue.setListValue(listValue);
            newListValue.setAddedBy(user.getUsername());
            newListValue.setDateAdded(new Date());
            return refListRepository.save(newListValue);
        } else {
            return refListEntity.get();
        }
    }

    public RefListEntity updateRefListValue(CustomUserDetailsModel user, Integer Id, String listValue) {
        var refListEntity
                = refListRepository.findById(Id);
        if (!refListEntity.isEmpty()) {
            var newListValue = new RefListEntity();
            newListValue.setListValue(listValue);
            newListValue.setModifiedBy(user.getUsername());
            newListValue.setDateModified(new Date());
            return refListRepository.save(newListValue);
        }
        return null;
    }

    public List<RefListEntity> getRefListEntity() {
        return  this.refListRepository.findAll();
    }

    public List<RefListEntity> getRefListEntityByKey(String key) {
        return this.refListRepository.findByListKeyIgnoreCase(key);
    }
    public Optional<RefListEntity> getRefListEntityByKeyValue(String key, String value) {
        return this.refListRepository.findByListKeyAndListValueIgnoreCase(key,value);
    }
}
