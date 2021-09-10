package earth.praesideo.services;

import earth.praesideo.database.entities.users.CompanyEntity;
import earth.praesideo.database.entities.users.PermissionEntity;
import earth.praesideo.database.entities.users.UserEntity;
import earth.praesideo.database.repositories.users.CompanyRepository;
import earth.praesideo.database.repositories.users.PermissionRepository;
import earth.praesideo.database.repositories.users.UserRepository;
import earth.praesideo.exceptions.ApiException;
import earth.praesideo.exceptions.ExceptionContent;
import earth.praesideo.models.restapi.permission.PermissionModel;
import earth.praesideo.models.security.CustomUserDetailsModel;
import earth.praesideo.services.policy.PasswordPolicyService;
import earth.praesideo.utils.PermissionEnum;
import earth.praesideo.utils.SettingRole;
import org.modelmapper.ModelMapper;
import org.springframework.http.HttpStatus;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

/**
 * @author Koshman Vadim
 */
@Service
public class PermissionService {
    private final PermissionRepository permissionRepository;
    private final CompanyRepository companyRepository;
    private final UserRepository userRepository;
    private final ModelMapper modelMapper;
    private final PasswordEncoder passwordEncoder;
    private final PasswordPolicyService passwordPolicyService;

    public PermissionService(PermissionRepository permissionRepository,
                             CompanyRepository companyRepository,
                             UserRepository userRepository,
                             ModelMapper modelMapper,
                             PasswordEncoder passwordEncoder, PasswordPolicyService passwordPolicyService) {
        this.permissionRepository = permissionRepository;
        this.companyRepository = companyRepository;
        this.userRepository = userRepository;
        this.modelMapper = modelMapper;
        this.passwordEncoder = passwordEncoder;
        this.passwordPolicyService = passwordPolicyService;
    }

    public void storeDefaultPermissionIfNoExist(PermissionEntity permissionEntity, CustomUserDetailsModel user) {
        if (!permissionRepository.existsByCompanyId(permissionEntity.getCompanyId())) {
            permissionEntity.setImpactPermission(PermissionEnum.EDITOR.name());
            permissionEntity.setTracePermission(PermissionEnum.EDITOR.name());
            permissionEntity.setRole(SettingRole.ACCOUNT_OWNER.name());
            permissionEntity.setModifiedBy(user.getUsername().toLowerCase());
            permissionEntity.setDateModified(new Date());
            save(permissionEntity);
        } else if (!permissionRepository.existsByCompanyIdAndUsernameIgnoreCase(permissionEntity.getCompanyId(), permissionEntity.getUsername())) {
            permissionEntity.setImpactPermission(PermissionEnum.VIEWER.name());
            permissionEntity.setTracePermission(PermissionEnum.VIEWER.name());
            permissionEntity.setRole(SettingRole.MEMBER.name());
            permissionEntity.setModifiedBy(user.getUsername().toLowerCase());
            permissionEntity.setDateModified(new Date());
            save(permissionEntity);
        }
    }

    public void changeUserPermission(PermissionModel model) {
        Optional<PermissionEntity> permissionEntity = permissionRepository.findByUsernameIgnoreCase(model.getUsername());
        if (permissionEntity.isPresent()){
            PermissionEntity entity = permissionEntity.get();
            entity.setTracePermission(model.getTraceDataPermission());
            entity.setImpactPermission(model.getImpactDataPermission());
            if (!model.getServices().isEmpty()) {
                entity.setServices(model.getServices());
            }
            save(entity);
        }
    }

    public void changeUserStatus(String userName, Boolean enabled) {
        UserEntity userEntity = userRepository.findByUsernameIgnoreCase(userName);
        userEntity.setEnabled(enabled);
        userEntity.setDateModified(new Date());
        userEntity.setModifiedBy(userName);
        userRepository.save(userEntity);
    }

    public void restorePassword(String newPassword, String confirmPassword, String userEmail) {
        if (!newPassword.equals(confirmPassword)) {
            throw new ApiException(ExceptionContent.PASSWORDS_DO_NOT_MATCH, HttpStatus.BAD_REQUEST);
        }
        if (!passwordPolicyService.validityPasswordPattern(newPassword)) {
            throw new ApiException(ExceptionContent.PASSWORDS_DO_NOT_MATCH_REGEX, HttpStatus.BAD_REQUEST);
        }

        UserEntity user = userRepository.findByEmailIgnoreCase(userEmail);
        if (user == null) {
            throw new ApiException(ExceptionContent.USER_NOT_FOUND, HttpStatus.BAD_REQUEST);
        }
        if (passwordEncoder.matches(newPassword, user.getPassword())) {
            throw new ApiException(ExceptionContent.SIMILAR_PASSWORD, HttpStatus.BAD_REQUEST);
        }

        user.setPassword(passwordEncoder.encode(newPassword));
        user.setDateModified(new Date());
        user.setModifiedBy(userEmail);
        userRepository.save(user);
    }

    public List<PermissionModel> getUsersWithPermissions(Integer companyId) {
        CompanyEntity companyEntity = companyRepository.findById(companyId).orElse(new CompanyEntity());
        return companyEntity.getUsers()
                .stream()
                .map(obj -> modelMapper.map(obj, PermissionModel.class))
                .peek(dto -> dto.setCompanyId(companyId))
                .peek(dto -> {
                    Optional<PermissionEntity> permissionEntity = permissionRepository.findByUsernameIgnoreCase(dto.getUsername());
                    if (permissionEntity.isPresent()){
                        PermissionEntity entity = permissionEntity.get();
                        dto.setRole(entity.getRole());
                        dto.setImpactDataPermission(entity.getImpactPermission());
                        dto.setTraceDataPermission(entity.getTracePermission());
                        dto.setServices(!entity.getServices().isEmpty() ? entity.getServices() : new HashSet<>());
                    }else{
                        //by default
                        PermissionEntity byDefaultPermission = new PermissionEntity();
                        byDefaultPermission.setImpactPermission(PermissionEnum.VIEWER.name());
                        byDefaultPermission.setCompanyId(dto.getCompanyId());
                        byDefaultPermission.setUsername(dto.getUsername());
                        byDefaultPermission.setTracePermission(PermissionEnum.VIEWER.name());
                        byDefaultPermission.setRole(SettingRole.MEMBER.name());
                        byDefaultPermission.setAddedBy(dto.getUsername());
                        byDefaultPermission.setDateAdded(new Date());
                        save(byDefaultPermission);

                        dto.setRole(SettingRole.MEMBER.name());
                        dto.setImpactDataPermission(PermissionEnum.VIEWER.name());
                        dto.setTraceDataPermission(PermissionEnum.VIEWER.name());
                        dto.setServices(new HashSet<>());
                    }
                })
                .collect(Collectors.toList());
    }

    public void save(PermissionEntity permissionEntity) {
        permissionRepository.save(permissionEntity);
    }

    public void delete(String userName) {
        permissionRepository.deleteByUsernameIgnoreCase(userName);
    }
}
