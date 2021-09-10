package earth.praesideo.services.password;

import earth.praesideo.exceptions.ApiException;
import earth.praesideo.exceptions.ExceptionContent;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.time.temporal.ChronoUnit;
import java.util.Base64;
import java.util.UUID;

/**
 * @author Koshman Vadim
 */
@Service
public class RestoreKeyService {
    private static final String SEPARATOR = ".";
    private static final String SEPARATOR_REGEX = "\\.";
    private static final DateTimeFormatter FORMATTER = DateTimeFormatter.ISO_LOCAL_DATE_TIME;
    private static final long RESET_PWD_KEY_LIFETIME_MINUTES = 10;

    public String generateKey(String userEmail) {
        return generateEncodedDateTime() + SEPARATOR + encode(userEmail) + SEPARATOR + generateEncodedUUID();
    }

    public boolean verifyResetPasswordKey(String expectedKey, String realKey) {
        return expectedKey.equals(realKey) && !this.isResetPasswordKeyExpired(realKey);
    }

    public String extractUserEmail(String realKey) {
        String[] keyParts = realKey.split(SEPARATOR_REGEX);
        if (keyParts.length != 3) {
            throw new ApiException(ExceptionContent.INVALID_VERIFICATION_KEY, HttpStatus.BAD_REQUEST);
        }
        return decode(keyParts[1]);
    }

    public boolean isResetPasswordKeyExpired(String key) {
        return this.getDifferenceInMinutes(key) >= RESET_PWD_KEY_LIFETIME_MINUTES;
    }

    private long getDifferenceInMinutes(String key) {
        LocalDateTime fromDateTime = extractDateTime(key);
        LocalDateTime toDateTime = LocalDateTime.now();
        return ChronoUnit.MINUTES.between(fromDateTime, toDateTime);
    }

    private LocalDateTime extractDateTime(String key){
        String encodedDateTime = key.split(SEPARATOR_REGEX)[0];
        String dateTime = decode(encodedDateTime);
        return LocalDateTime.parse(dateTime, FORMATTER);
    }

    private String generateEncodedDateTime(){
        String dateTime = LocalDateTime.now().format(FORMATTER);
        return encode(dateTime);
    }

    private String generateEncodedUUID(){
        String uuid = UUID.randomUUID().toString();
        return encode(uuid);
    }

    private String encode(String value){
        return Base64.getEncoder().encodeToString(value.getBytes());
    }

    private String decode(String value){
        return new String(Base64.getDecoder().decode(value));
    }
}
