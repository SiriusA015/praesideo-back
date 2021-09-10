package earth.praesideo.services;

import earth.praesideo.database.entities.common.YearRepresentationEntity;
import earth.praesideo.database.entities.datasets.UserFilesEntity;
import earth.praesideo.database.entities.users.AuthorityEntity;
import earth.praesideo.database.entities.users.CompanyEntity;
import earth.praesideo.database.entities.users.CompanyStatusEntity;
import earth.praesideo.database.entities.users.UserEntity;
import earth.praesideo.database.repositories.common.RefBlockedDomainRepository;
import earth.praesideo.database.repositories.common.YearRepresentationRepository;
import earth.praesideo.database.repositories.datasets.UserFilesRepository;
import earth.praesideo.database.repositories.users.AuthorityRepository;
import earth.praesideo.database.repositories.users.CompanyRepository;
import earth.praesideo.database.repositories.users.UserRepository;
import earth.praesideo.exceptions.ApiException;
import earth.praesideo.exceptions.ExceptionContent;
import earth.praesideo.exceptions.FileAlreadyExistsException;
import earth.praesideo.models.restapi.auth.RegisterRequestModel;
import earth.praesideo.models.restapi.internal.AccountCreatedInternalModel;
import earth.praesideo.models.restapi.internal.ForgetPasswordInternalModel;
import earth.praesideo.models.restapi.permission.RestorePasswordModel;
import earth.praesideo.models.restapi.upload.UploadFileInfoRequestModel;
import earth.praesideo.services.email.EmailNotificationService;
import earth.praesideo.services.password.RestoreKeyService;
import earth.praesideo.services.policy.PasswordPolicyService;
import earth.praesideo.utils.*;

import java.time.Year;
import java.util.Objects;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationEventPublisher;
import org.springframework.http.HttpStatus;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import java.sql.Timestamp;
import java.util.Date;
import java.util.List;

@Service
public class UsersService {

    private static final Logger LOGGER = LoggerFactory.getLogger(UsersService.class);
    private static final Long activationStringExpirationDateInterval = 30 * 24 * 60 * 60 * 1000L;   //30 days

    private final UserUtils userUtils;
    private final UserRepository userRepository;
    private final CompanyRepository companyRepository;
    private final AuthorityRepository authorityRepository;
    private final ApplicationEventPublisher applicationEventPublisher;
    private final UserFilesRepository userFilesRepository;
    private final CompanyService companyService;
    private final PasswordPolicyService passwordPolicyService;
    private final RestoreKeyService restoreKeyService;
    private final PasswordEncoder passwordEncoder;
    private final YearRepresentationRepository yearRepresentationRepository;
    private final ProductService productService;
    private final RefBlockedDomainRepository refBlockedDomainRepository;
    private final EmailNotificationService emailNotificationService;

    @Autowired
    public UsersService(UserUtils userUtils, UserRepository userRepository, CompanyRepository companyRepository,
                        AuthorityRepository authorityRepository, UserFilesRepository userFilesRepository,
                        ApplicationEventPublisher applicationEventPublisher,
                        CompanyService companyService, PasswordPolicyService passwordPolicyService,
                        RestoreKeyService restoreKeyService, PasswordEncoder passwordEncoder,
                        YearRepresentationRepository yearRepresentationRepository,
                        ProductService productService, RefBlockedDomainRepository refBlockedDomainRepository,
                        EmailNotificationService emailNotificationService) {

        LOGGER.info(this.getClass().getSimpleName() + " created.");

        this.userUtils = userUtils;
        this.userRepository = userRepository;
        this.companyRepository = companyRepository;
        this.authorityRepository = authorityRepository;
        this.applicationEventPublisher = applicationEventPublisher;
        this.userFilesRepository = userFilesRepository;
        this.companyService = companyService;
        this.passwordPolicyService = passwordPolicyService;
        this.restoreKeyService = restoreKeyService;
        this.passwordEncoder = passwordEncoder;
        this.yearRepresentationRepository = yearRepresentationRepository;
        this.productService = productService;
        this.refBlockedDomainRepository = refBlockedDomainRepository;
        this.emailNotificationService = emailNotificationService;
    }

    public void validateAndRegisterSupplierUser(RegisterRequestModel registerModel) {
        UserEntity userEntity = userRepository.findByUsernameIgnoreCase(registerModel.getEmail());
        if (null != userEntity) {
            throw new ApiException(ExceptionContent.REGISTRATION_EMAIL_EXISTS, HttpStatus.BAD_REQUEST);
        }

        if (!passwordPolicyService.validityPasswordPattern(registerModel.getPassword())) {
            throw new ApiException(ExceptionContent.PASSWORDS_DO_NOT_MATCH_REGEX, HttpStatus.BAD_REQUEST);
        }

       String emailDomain = registerModel.getEmail().split("@")[1];
       if (this.refBlockedDomainRepository.findByDomainIgnoreCase(emailDomain).isPresent()) {
           throw new ApiException(ExceptionContent.BLOCKED_DOMAIN, HttpStatus.BAD_REQUEST);
       }

        Integer companyId = registerModel.getCompanyId() != null ? registerModel.getCompanyId() : null;
        CompanyEntity companyEntity;
        if (registerModel.getCid() != null) {
            companyEntity = companyService.getCompanyEntityById(registerModel.getCid());
        } else {
            companyEntity = companyService.checkExistingCompanyDomainByEmailOrReturnNew(companyId, registerModel.getEmail());
        }

        // if company is not set therefore is a new account for a new company, we register a new company in the database
        if (null == companyEntity.getCompanyId()) {
            prepareAndSaveNewCompany(registerModel, companyEntity);
        }
        //save new user
        UserEntity user = prepareAndSaveNewUser(registerModel, companyEntity);
        emailNotificationService.onApplicationEvent(new AccountCreatedInternalModel(this, user.getEmail(), user.getActivationString()));
        applicationEventPublisher.publishEvent(new AccountCreatedInternalModel(this, user.getEmail(), user.getActivationString()));
    }

    public void activateUserAccount(String activationString) {
        UserEntity userEntity = userRepository.findByActivationString(activationString);
        if (null != userEntity) {
            if (null != userEntity.getActivationString() && !userEntity.getActivationString().isEmpty()) {
                userEntity.setActivationString(null);
                userEntity.setActivationTokenDate(null);
                userRepository.save(userEntity);
                return;
            }
            throw new ApiException(ExceptionContent.ACTIVATION_ACCOUNT_ACTIVATED, HttpStatus.BAD_REQUEST);
        }
        throw new ApiException(ExceptionContent.ACTIVATION_ACCOUNT_NOT_FOUND, HttpStatus.BAD_REQUEST);
    }

    public boolean hasImpactMeasurementSubscription(final Integer companyId) {
        return productService.isImpactMeasurementOnlySubscription(companyId);
    }

    public UserEntity getUserFromDatabase(String username) {
        return userRepository.findByUsernameIgnoreCase(username);
    }

    public UserEntity getUserFromDatabase(Integer userId) {
        return userRepository.findByUserId(userId);
    }

    public void addSubmittedFile(UserEntity userEntity, String filename, String url, UploadFileInfoRequestModel info) throws FileAlreadyExistsException {
        UserFilesEntity userFilesEntity;

        if (!Objects.equals(info.getFileType(), UserFileTypeEnum.OTHER.getUserFileTypeId())) {
            userFilesEntity = userFilesRepository.findByFileTypeAndCompanyCompanyId(info.getFileType(), userEntity.getCompany().getCompanyId());
            if (null != userFilesEntity) {
                throw new FileAlreadyExistsException("File type already saved. Please delete file before submitting again");
            }
        }

        userFilesEntity = new UserFilesEntity();
        userFilesEntity.setFileType(info.getFileType());
        userFilesEntity.setFilename(filename);
        Timestamp timestamp = new Timestamp(System.currentTimeMillis());
        userFilesEntity.setInsertedDate(timestamp);
        userFilesEntity.setUpdatedDate(timestamp);
        userFilesEntity.setUrl(url);
        userFilesEntity.setCompany(userEntity.getCompany());

        userFilesRepository.save(userFilesEntity);
    }

    public void removeSubmittedFile(UserEntity userEntity, UploadFileInfoRequestModel info) {
        UserFilesEntity userFilesEntity = userFilesRepository.findByFileTypeAndFilenameAndCompanyCompanyId(info.getFileType(),
                info.getFilename(), userEntity.getCompany().getCompanyId());
        if (null != userFilesEntity) {
            userFilesRepository.delete(userFilesEntity);
        }
    }

    public List<UserFilesEntity> getSubmittedFiles(UserEntity userEntity) {
        return userFilesRepository.findAllByCompanyCompanyId(userEntity.getCompany().getCompanyId());
    }

    private UserEntity prepareAndSaveNewUser(RegisterRequestModel registerModel, CompanyEntity companyEntity) {
        UserEntity user = new UserEntity();
        String userEmail = registerModel.getEmail().toLowerCase();
        user.setUsername(userEmail);
        user.setPassword(userUtils.encodePassword(registerModel.getPassword()));
        user.setEmail(userEmail);
        user.setEnabled(true);
        user.setActivationString(StringUtils.getUUID());
        user.setActivationTokenDate(new Date(new Date().getTime() + activationStringExpirationDateInterval));
        user.setCompany(companyEntity);
        user.setApprovalDate(new Date());
        user = userRepository.save(user);
        user.setDateAdded(new Date());
        user.setAddedBy(userEmail);
        user.setDateModified(new Date());
        user.setModifiedBy(userEmail);
        user = userRepository.save(user);

        AuthorityEntity authorityEntity = new AuthorityEntity();
        authorityEntity.setUsername(userEmail);
        authorityEntity.setAuthority(RolesEnum.SUPPLIER.name());
        authorityEntity.setUser(user);
        authorityEntity = authorityRepository.save(authorityEntity);
        authorityEntity.setAddedBy(userEmail);
        authorityEntity.setDateAdded(new Date());
        authorityEntity.setModifiedBy(userEmail);
        authorityEntity.setDateModified(new Date());
        authorityRepository.save(authorityEntity);
        return user;
    }

    private void prepareAndSaveNewCompany(RegisterRequestModel registerModel, CompanyEntity companyEntity) {
        CompanyStatusEntity companyStatusEntity = new CompanyStatusEntity();
        companyStatusEntity.setStatusId(1);
        companyEntity.setCompanyStatus(companyStatusEntity);
        companyEntity.setStatusDate(new Timestamp(new Date().getTime()));
        companyEntity.setCustomerTypeId(registerModel.getCustomerTypeId());
        companyEntity.setProductSelectionId(registerModel.getProductTypeId());
        companyEntity.setCompanyDomain(registerModel.getEmail().split("@")[1]);
        companyEntity.setCompanyName(registerModel.getEmail().split("@")[1]);
        companyEntity.setIsFinancialYear(false);
        companyEntity.setStartMonth(0);
        YearRepresentationEntity currentYear = this.yearRepresentationRepository.findByCalendarYear(Year.now().getValue());
        companyEntity.setYearRepresentationId(currentYear.getYearRepresentationId());
        companyEntity.setDateAdded(new Date());
        companyEntity.setAddedBy(registerModel.getEmail());
        companyRepository.save(companyEntity);
    }

    public UserEntity sendPasswordRestoreKey(String email, String restoreLink) {
        UserEntity user = userRepository.findByEmailIgnoreCase(email);
        if (user == null) {
            throw new ApiException(ExceptionContent.ENTER_REGISTERED_EMAIL, HttpStatus.BAD_REQUEST);
        }
        String restoreKey = restoreKeyService.generateKey(user.getEmail());
        user.setRestoreKey(restoreKey);
        user.setDateModified(new Date());
        user.setModifiedBy(email);
        UserEntity updated = userRepository.save(user);
        emailNotificationService.onApplicationEvent(new ForgetPasswordInternalModel(this, email, restoreLink, restoreKey));
        applicationEventPublisher.publishEvent(new ForgetPasswordInternalModel(this, email, restoreLink, restoreKey));
        return updated;
    }

    public UserEntity restore(String key, RestorePasswordModel restorePasswordModel) {

        if (!restorePasswordModel.getNewPassword().equals(restorePasswordModel.getConfirmPassword())) {
            throw new ApiException(ExceptionContent.PASSWORDS_DO_NOT_MATCH, HttpStatus.BAD_REQUEST);
        }
        if (!passwordPolicyService.validityPasswordPattern(restorePasswordModel.getNewPassword())) {
            throw new ApiException(ExceptionContent.PASSWORDS_DO_NOT_MATCH_REGEX, HttpStatus.BAD_REQUEST);
        }
        String userEmail = restoreKeyService.extractUserEmail(key);

        UserEntity user = userRepository.findByEmailIgnoreCase(userEmail);
        if (user == null) {
            throw new ApiException(ExceptionContent.USER_NOT_FOUND, HttpStatus.BAD_REQUEST);
        }
        if (!restoreKeyService.verifyResetPasswordKey(user.getRestoreKey() != null ? user.getRestoreKey() : "", key)) {
            throw new ApiException(ExceptionContent.INVALID_RESET_PWD_KEY, HttpStatus.BAD_REQUEST);
        }
        if (passwordEncoder.matches(restorePasswordModel.getNewPassword(), user.getPassword())) {
            throw new ApiException(ExceptionContent.SIMILAR_PASSWORD, HttpStatus.BAD_REQUEST);
        }

        user.setPassword(passwordEncoder.encode(restorePasswordModel.getNewPassword()));
        user.setRestoreKey("");
        user.setModifiedBy(userEmail);
        user.setDateModified(new Date());
        return userRepository.save(user);
    }
}
