package earth.praesideo.exceptions;

import lombok.Getter;
import org.springframework.context.MessageSource;

import java.util.Locale;


/**
 * @author Koshman Vadim
 */

@Getter
public enum ExceptionContent {
    // Api Exception
    USER_NOT_FOUND("api.exception.userNotFound"),
    SIMILAR_PASSWORD("api.exception.similarPassword"),
    PASSWORDS_DO_NOT_MATCH("api.exception.passwordsDoNotMatch"),
    PASSWORDS_DO_NOT_MATCH_REGEX("api.exception.passwordsDoNotMatchRegex"),
    REGISTRATION_EMAIL_EXISTS("api.exception.registration.emailAlreadyExists"),
    ENTER_REGISTERED_EMAIL("api.exception.enterRegisteredEmail"),
    INVALID_VERIFICATION_KEY("api.exception.invalidVerificationKey"),
    INVALID_RESET_PWD_KEY("api.exception.invalidResetPwdKey"),
    REGISTRATION_EMAIL_DOMAIN_IS_DIFFERENT("api.exception.registration.domainIsDifferent"),
    AUTH_ACCOUNT_DISABLED("api.exception.auth.accountDisabled"),
    AUTH_ACCOUNT_NOT_CONFIRMED("api.exception.auth.accountNotConfirmed"),
    AUTH_INVALID_CREDENTIALS("api.exception.auth.invalidCredentials"),
    AUTH_INVALID_REFRESH_TOKEN("api.exception.auth.invalidRefreshToken"),
    ACTIVATION_ACCOUNT_NOT_FOUND("api.exception.activation.accountNotFound"),
    ACTIVATION_ACCOUNT_ACTIVATED("api.exception.activation.accountActivated"),
    SUBMIT_IN_REVIEW("api.exception.submit.inReview"),
    SUBMIT_DATASET_NOT_FOUND("api.exception.submit.dataSetNotFound"),
    MESSAGE_CANNOT_SENT("api.exception.messageCannotSent"),
    COMPANY_NOT_FOUND("api.exception.company.notFound"),
    SUPPLIER_EXIST_BY_YEAR("api.exception.supplier.exist.by.year"),
    COMPANY_ALREADY_EXISTS("api.exception.company.alreadyExists"),
    PROD_SERV_ALREADY_EXISTS("api.exception.refprodserv.alreadyExists"),
    INVALID_YEAR("api.exception.general.invalid.year"),
    BLOCKED_DOMAIN("api.exception.user.registration.blocked.domain")
    ;

    String path;
    static MessageSource messageSource;

    ExceptionContent(String path) {
        this.path = path;
    }

    public static void setMessageSource(MessageSource messageSource) {
        ExceptionContent.messageSource = messageSource;
    }

    public String getText() {
        return messageSource.getMessage(path, null, Locale.ENGLISH);
    }

    public String getText(Locale locale) {
        return messageSource.getMessage(path, null, locale);
    }

}
