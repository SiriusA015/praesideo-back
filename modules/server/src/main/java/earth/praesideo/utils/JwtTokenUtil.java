package earth.praesideo.utils;

import earth.praesideo.models.security.CustomUserDetailsModel;
import io.jsonwebtoken.*;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

import java.util.Date;

@Component
public class JwtTokenUtil {
    private static final Logger LOGGER = LoggerFactory.getLogger(JwtTokenUtil.class);
    private final String jwtSecret = "fsd86f7s6CDF86fd6fdsDF^76";
    private final String jwtRefreshTokenSecret = "afds7g6g7fdg67dsf#$fdsg7f";
    private final String jwtIssuer = "praesideo.com";

    public JwtTokenUtil() {
        LOGGER.info(this.getClass().getSimpleName()+" created.");
    }

    public String generateAccessToken(CustomUserDetailsModel user) {
        return Jwts.builder()
                .setSubject(String.format("%s,%s", user.getUserId(), user.getUsername()))
                .setIssuer(jwtIssuer)
                .setIssuedAt(new Date())
                .setExpiration(new Date(System.currentTimeMillis() + 60 * 60 * 1000)) // one hour
                .signWith(SignatureAlgorithm.HS512, jwtSecret)
                .compact();
    }
    public String generateRefreshToken(CustomUserDetailsModel user) {
        return Jwts.builder()
                .setSubject(String.format("%s,%s", user.getUserId(), user.getUsername()))
                .setIssuer(jwtIssuer)
                .setIssuedAt(new Date())
                .setExpiration(new Date(System.currentTimeMillis() + 60 * 60 * 1000)) // one hour
                .signWith(SignatureAlgorithm.HS512, jwtRefreshTokenSecret)
                .compact();
    }

    public String getUserId(String token) {
        Claims claims = Jwts.parser()
                .setSigningKey(jwtSecret)
                .parseClaimsJws(token)
                .getBody();

        return claims.getSubject().split(",")[0];
    }

    public String getUsernameFromToken(String token) {
        return getUsername(token, jwtSecret);
    }

    public String getUsernameFromRefreshToken(String token) {
        return getUsername(token, jwtRefreshTokenSecret);
    }

    private String getUsername(String token, String secret) {
        Claims claims = Jwts.parser()
                .setSigningKey(secret)
                .parseClaimsJws(token)
                .getBody();

        return claims.getSubject().split(",")[1];
    }

    public Date getExpirationDate(String token) {
        Claims claims = Jwts.parser()
                .setSigningKey(jwtSecret)
                .parseClaimsJws(token)
                .getBody();

        return claims.getExpiration();
    }

    public boolean validateToken(String token) {
        return validate(token, jwtSecret);
    }

    public boolean validateRefreshToken(String token) {
        return validate(token, jwtRefreshTokenSecret);
    }

    private boolean validate(String token, String secret) {
        try {
            Jwts.parser().setSigningKey(secret).parseClaimsJws(token);
            return true;
        } catch (SignatureException ex) {
            LOGGER.error("Invalid JWT signature - {}", ex.getMessage());
        } catch (MalformedJwtException ex) {
            LOGGER.error("Invalid JWT token - {}", ex.getMessage());
        } catch (ExpiredJwtException ex) {
            LOGGER.error("Expired JWT token - {}", ex.getMessage());
        } catch (UnsupportedJwtException ex) {
            LOGGER.error("Unsupported JWT token - {}", ex.getMessage());
        } catch (IllegalArgumentException ex) {
            LOGGER.error("JWT claims string is empty - {}", ex.getMessage());
        }
        return false;
    }
}
