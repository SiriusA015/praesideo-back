package earth.praesideo.services;

import earth.praesideo.database.entities.datasets.DataSetEmissionsReductionEntity;
import earth.praesideo.database.entities.datasets.DataSetEmissionsReductionTargetsEntity;
import earth.praesideo.database.entities.users.UserEntity;
import earth.praesideo.database.repositories.datasets.DataSetEmissionsReductionRepository;
import earth.praesideo.database.repositories.targetsscenario.DataEmissionsReductionTargetsScenarioRepository;
import earth.praesideo.models.restapi.datasets.DataSetEmissionsReductionModel;
import earth.praesideo.models.security.CustomUserDetailsModel;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Service
@AllArgsConstructor
public class TargetsScenarioService {

    private final DataSetEmissionsReductionRepository dataSetEmissionsReductionRepository;
    private final DataEmissionsReductionTargetsScenarioRepository targetsScenarioRepository;
    private final UsersService usersService;

    public DataSetEmissionsReductionModel getEmissionsReduction(final CustomUserDetailsModel user) {
        DataSetEmissionsReductionModel response = new DataSetEmissionsReductionModel();
        response.setEmissionsReduction(dataSetEmissionsReductionRepository
                .findFirstByCompanyCompanyId(user.getCompanyId()));
        return response;
    }

    @Transactional
    public DataSetEmissionsReductionModel saveEmissionsReduction(final CustomUserDetailsModel user, final DataSetEmissionsReductionModel data) {

        DataSetEmissionsReductionEntity entity = dataSetEmissionsReductionRepository
                .findFirstByCompanyCompanyId(user.getCompanyId());

        if (null == entity) {
            entity = new DataSetEmissionsReductionEntity();
            entity.setDateAdded(new Date());
            entity.setAddedBy(user.getUsername());
        }
        else{
            entity.setDateModified(new Date());
            entity.setModifiedBy(user.getUsername());
        }

        if (data.getEmissionsReduction().getIsEmissionsReductionPresent() != null && !data.getEmissionsReduction().getIsEmissionsReductionPresent()) {
            data.getEmissionsReduction().setScope1(null);
            data.getEmissionsReduction().setScope2(null);
            data.getEmissionsReduction().setScope3(null);
            data.getEmissionsReduction().setIsFinancialYear(null);
            data.getEmissionsReduction().setYearRepresentationId(null);
            data.getEmissionsReduction().setFinancialYearStartMonth(null);
            data.getEmissionsReduction().setYearRepresentation(null);
            data.getEmissionsReduction().setEmissionsReductionTargets(null);
            data.getEmissionsReduction().setEmissionsReductionShortTerms(null);
        }

        entity.setScope1(data.getEmissionsReduction().getScope1());
        entity.setScope2(data.getEmissionsReduction().getScope2());
        entity.setScope3(data.getEmissionsReduction().getScope3());
        entity.setIsEmissionsReductionPresent(data.getEmissionsReduction().getIsEmissionsReductionPresent());
        entity.setIsFinancialYear(data.getEmissionsReduction().getIsFinancialYear());
        entity.setYearRepresentationId(data.getEmissionsReduction().getYearRepresentationId());
        entity.setFinancialYearStartMonth(data.getEmissionsReduction().getFinancialYearStartMonth());

        if (entity.getEmissionsReductionId() == null) {
            UserEntity userEntity = usersService.getUserFromDatabase(user.getUsername());
            entity.setCompany(userEntity.getCompany());
        }
        entity.setEmissionsReductionTargets(null);
        targetsScenarioRepository.deleteAllByEmissionsReductionEmissionsReductionId(entity.getEmissionsReductionId());

        if (data.getEmissionsReduction().getEmissionsReductionTargets() != null &&
                !data.getEmissionsReduction().getEmissionsReductionTargets().isEmpty()) {

            List<DataSetEmissionsReductionTargetsEntity> reductionTargetsToBeSaved = new ArrayList<>();
            for (DataSetEmissionsReductionTargetsEntity reductionTarget : data.getEmissionsReduction().getEmissionsReductionTargets()) {
                reductionTarget.setEmissionsReductionId(entity.getEmissionsReductionId());
                if (reductionTarget.getEmissionsReductionTargetId()==null) {
                    reductionTarget.setDateAdded(new Date());
                    reductionTarget.setAddedBy(user.getUsername());
                }else{
                    reductionTarget.setDateModified(new Date());
                    reductionTarget.setModifiedBy(user.getUsername());
                }
                reductionTargetsToBeSaved.add(reductionTarget);
            }
            entity.setEmissionsReductionTargets(reductionTargetsToBeSaved);
        }
        dataSetEmissionsReductionRepository.save(entity);
        return getEmissionsReduction(user);
    }
}
