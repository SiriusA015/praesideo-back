package earth.praesideo.services;

import earth.praesideo.database.entities.users.AuthorityEntity;
import earth.praesideo.database.entities.users.UserEntity;
import earth.praesideo.database.repositories.users.UserRepository;
import earth.praesideo.exceptions.ApiException;
import earth.praesideo.exceptions.ExceptionContent;
import earth.praesideo.models.security.CustomUserDetailsModel;
import earth.praesideo.utils.UserUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.http.HttpStatus;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import java.util.Collections;
import java.util.stream.Collectors;

@Service
public class CustomUserDetailsService implements UserDetailsService {
    private static final Logger LOGGER = LoggerFactory.getLogger(CustomUserDetailsService.class);

    private final UserUtils userUtils;
    private final UserRepository userRepository;

    @Autowired
    public CustomUserDetailsService(@Lazy UserUtils userUtils, UserRepository userRepository) {
        LOGGER.info(this.getClass().getSimpleName() + " created.");
        this.userUtils = userUtils;
        this.userRepository = userRepository;
    }

    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        LOGGER.debug("Username: " + username);
        UserEntity userEntity = userRepository.findByUsernameIgnoreCase(username);
        if (null != userEntity) {
            CustomUserDetailsModel customUserDetails = new CustomUserDetailsModel(
                    userEntity.getUserId(),
                    userEntity.getCompany().getCompanyId(),
                    userEntity.getActivationString(),
                    userEntity.getUsername(),
                    userEntity.getPassword(),
                    userUtils.getGrantedAuthorities(
                            null != userEntity.getAuthorities()
                                    ? userEntity.getAuthorities().stream().map(AuthorityEntity::getAuthority).collect(Collectors.toList())
                                    : Collections.emptyList()
                    ),
                    userEntity.getEnabled()
            );
            customUserDetails.setYearRepresentationId(userEntity.getCompany().getYearRepresentationId());
            if (null != userEntity.getCompany().getIndustrySector()) {
                customUserDetails.setIndustrySector(userEntity.getCompany().getIndustrySector().getName());
            }
            if (null != userEntity.getCompany().getIndustrySubSector()) {
                customUserDetails.setIndustrySubsector(userEntity.getCompany().getIndustrySubSector().getName());
            }
            return customUserDetails;
        } else {
            throw new ApiException(ExceptionContent.AUTH_INVALID_CREDENTIALS, HttpStatus.UNAUTHORIZED);
        }
    }
}
