package earth.praesideo.database.repositories.datasets;

import earth.praesideo.database.entities.datasets.UserFilesEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface UserFilesRepository extends JpaRepository<UserFilesEntity, Integer> {
    UserFilesEntity findByFileTypeAndCompanyCompanyId(Integer fileTypeId, Integer companyId);

    UserFilesEntity findByFileTypeAndFilenameAndCompanyCompanyId(Integer fileTypeId, String filename, Integer companyId);

    List<UserFilesEntity> findAllByCompanyCompanyId(Integer companyId);
}
