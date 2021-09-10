package earth.praesideo.services;

import earth.praesideo.database.entities.users.UserEntity;
import earth.praesideo.database.repositories.users.UserRepository;
import earth.praesideo.models.security.CustomUserDetailsModel;
import earth.praesideo.utils.JwtTokenUtil;
import earth.praesideo.utils.UserUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.http.HttpHeaders;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.WebAuthenticationDetailsSource;
import org.springframework.stereotype.Service;
import org.springframework.web.filter.OncePerRequestFilter;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.stream.Collectors;

import static java.util.List.of;
import static java.util.Optional.ofNullable;

@Service
public class JwtTokenFilterService extends OncePerRequestFilter {
    private static final Logger LOGGER = LoggerFactory.getLogger(JwtTokenFilterService.class);
    private final JwtTokenUtil jwtTokenUtil;
    private final UserRepository userRepository;
    private final UserUtils userUtils;

    @Autowired
    public JwtTokenFilterService(JwtTokenUtil jwtTokenUtil, UserRepository userRepository, @Lazy UserUtils userUtils) {
        LOGGER.info(this.getClass().getSimpleName()+" created.");
        this.jwtTokenUtil = jwtTokenUtil;
        this.userRepository = userRepository;
        this.userUtils = userUtils;
    }

    @Override
    protected void doFilterInternal(HttpServletRequest request, HttpServletResponse response, FilterChain filterChain) throws ServletException, IOException {
        final String header = request.getHeader(HttpHeaders.AUTHORIZATION);
        if(null == header || !header.startsWith("Bearer ")) {
            filterChain.doFilter(request, response);
            return;
        }
        final String token = header.split(" ")[1].trim();
        if (!jwtTokenUtil.validateToken(token)) {
            filterChain.doFilter(request, response);
            return;
        }
        UserEntity userEntity = userRepository
                .findByUsernameIgnoreCase(jwtTokenUtil.getUsernameFromToken(token));

        CustomUserDetailsModel customUserDetailsModel = new CustomUserDetailsModel(
                userEntity.getUserId(),
                userEntity.getCompany().getCompanyId(),
                userEntity.getActivationString(),
                userEntity.getUsername(),
                userEntity.getPassword(),
                userUtils.getGrantedAuthorities(userEntity.getAuthorities().stream().map(ua -> ua.getAuthority()).collect(Collectors.toList())),
                userEntity.getEnabled()
                );
        customUserDetailsModel.setYearRepresentationId(userEntity.getCompany().getYearRepresentationId());
        if(null != userEntity.getCompany().getIndustrySector()) {
            customUserDetailsModel.setIndustrySector(userEntity.getCompany().getIndustrySector().getName());
        }
        if(null != userEntity.getCompany().getIndustrySubSector()) {
            customUserDetailsModel.setIndustrySubsector(userEntity.getCompany().getIndustrySubSector().getName());
        }

        UsernamePasswordAuthenticationToken authentication = new UsernamePasswordAuthenticationToken(
                customUserDetailsModel, null,
                ofNullable(customUserDetailsModel).map(CustomUserDetailsModel::getAuthorities).orElse(of())
        );

        authentication
                .setDetails(new WebAuthenticationDetailsSource().buildDetails(request));

        SecurityContextHolder.getContext().setAuthentication(authentication);
        filterChain.doFilter(request, response);
    }
}
