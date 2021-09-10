package earth.praesideo.configs;

import earth.praesideo.services.CustomUserDetailsService;
import earth.praesideo.services.JwtTokenFilterService;
import earth.praesideo.utils.RolesEnum;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.config.http.SessionCreationPolicy;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;

@Configuration
public class WebSecurityConfig extends WebSecurityConfigurerAdapter {
    private final JwtTokenFilterService jwtTokenFilterService;
    private final CustomUserDetailsService customUserDetailsService;

    @Autowired
    public WebSecurityConfig(JwtTokenFilterService jwtTokenFilterService, CustomUserDetailsService customUserDetailsService) {
        this.jwtTokenFilterService = jwtTokenFilterService;
        this.customUserDetailsService = customUserDetailsService;
    }

    @Bean
    public PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }

    @Override
    protected void configure(HttpSecurity http) throws Exception {
        http.cors().and().csrf().disable();
        http = http
                .sessionManagement()
                .sessionCreationPolicy(SessionCreationPolicy.STATELESS)
                .and();

        http.authorizeRequests()
                .antMatchers(
                        "/api/public/**", // do not add here other APIs
                        "/favicon.ico",
                        "/ws-stomp-common-endpoint/**",
                        //for h2 database console
                        "/h2-console/**",
                        //for swagger ui
                        "/swagger-ui/index.html",
                        "/swagger-ui/**",
                        "/swagger-resources/**",
                        "/v2/**",
                        "/webjars/**"
                )
                .permitAll()
                .and()
                .authorizeRequests()
                .antMatchers("/api/test/private")
                .hasRole(RolesEnum.SUPPLIER.name())
                .and()
                .authorizeRequests()
                .anyRequest()
                .authenticated();

        http.addFilterBefore(jwtTokenFilterService, UsernamePasswordAuthenticationFilter.class);

        //for h2-console
        http.headers().frameOptions().sameOrigin();
    }

    @Override
    protected void configure(AuthenticationManagerBuilder auth) throws Exception {
        auth.userDetailsService(customUserDetailsService);
        System.out.println(passwordEncoder().encode("cristi"));
    }

    @Bean
    public AuthenticationManager authenticationManagerBean() throws Exception {
        return super.authenticationManagerBean();
    }

}
