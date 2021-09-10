package earth.praesideo.services;

import earth.praesideo.database.entities.tech.AppLogEntity;
import earth.praesideo.database.entities.tech.AppLogType;
import earth.praesideo.database.entities.users.PermissionEntity;
import earth.praesideo.exceptions.ApiException;
import earth.praesideo.exceptions.ExceptionContent;
import earth.praesideo.models.restapi.auth.AuthRequestApiModel;
import earth.praesideo.models.restapi.auth.AuthResponseApiModel;
import earth.praesideo.models.security.CustomUserDetailsModel;
import earth.praesideo.services.tech.AppLogService;
import earth.praesideo.utils.JwtTokenUtil;
import org.modelmapper.ModelMapper;
import org.springframework.http.HttpStatus;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.stream.Collectors;

/**
 * @author Koshman Vadim
 */

@Service
public class AuthenticationService {
    private static final String TOKEN_TYPE_BEARER = "Bearer";
    private final PermissionService permissionService;
    private final ModelMapper modelMapper;
    private final AuthenticationManager authenticationManager;
    private final JwtTokenUtil jwtTokenUtil;
    private final AppLogService appLogService;
    public AuthenticationService(PermissionService permissionService,
                                 ModelMapper modelMapper,
                                 AuthenticationManager authenticationManager,
                                 JwtTokenUtil jwtTokenUtil,
                                 AppLogService appLogService) {
        this.permissionService = permissionService;
        this.modelMapper = modelMapper;
        this.authenticationManager = authenticationManager;
        this.jwtTokenUtil = jwtTokenUtil;
        this.appLogService = appLogService;
    }

    public AuthResponseApiModel login(AuthRequestApiModel authRequest) {
        CustomUserDetailsModel user;
        try {
            Authentication authenticate = authenticationManager
                    .authenticate(
                            new UsernamePasswordAuthenticationToken(
                                    authRequest.getUsername(), authRequest.getPassword()
                            )
                    );
            user = (CustomUserDetailsModel) authenticate.getPrincipal();
        } catch (BadCredentialsException e) {
            throw new ApiException(ExceptionContent.AUTH_INVALID_CREDENTIALS, HttpStatus.UNAUTHORIZED);
        }

        boolean accountConfirmed = null == user.getActivationString() || user.getActivationString().isEmpty();
        if (!user.getEnabled()) {
            throw new ApiException(ExceptionContent.AUTH_ACCOUNT_DISABLED, HttpStatus.UNAUTHORIZED);
        }
        if (accountConfirmed) {
            permissionService.storeDefaultPermissionIfNoExist(modelMapper.map(user, PermissionEntity.class),user);

            AuthResponseApiModel response = modelMapper.map(user, AuthResponseApiModel.class);
            response.setAccountConfirmed(true);
            String authToken = jwtTokenUtil.generateAccessToken(user);
            response.setAuthToken(authToken);
            response.setRefreshToken(jwtTokenUtil.generateRefreshToken(user));
            response.setTokenType(TOKEN_TYPE_BEARER);
            response.setRoles(user.getAuthorities().stream().map(GrantedAuthority::getAuthority).collect(Collectors.toList()));
            this.addLoginLog(user);
            return response;
        } else {
            throw new ApiException(ExceptionContent.AUTH_ACCOUNT_NOT_CONFIRMED, HttpStatus.UNAUTHORIZED);
        }
    }
    private void addLoginLog(CustomUserDetailsModel user)
    {
        AppLogEntity logEntity = new AppLogEntity();
        logEntity.setLogType(AppLogType.LOGIN);
        logEntity.setLogValue("Success");
        logEntity.setAdditionalInfoString1(user.getUsername());
        logEntity.setAdditionalinfoDatetime1(new Date());
        if (user.getCompanyId()!=null) {
            logEntity.setAdditionalInfoInt1(user.getCompanyId());
        }
        this.appLogService.addAppLog(logEntity);
    }
}
