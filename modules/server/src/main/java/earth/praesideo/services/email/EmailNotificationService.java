package earth.praesideo.services.email;

import earth.praesideo.database.entities.tech.AppLogType;
import earth.praesideo.models.restapi.internal.AccountCreatedInternalModel;
import earth.praesideo.models.restapi.internal.ForgetPasswordInternalModel;
import earth.praesideo.models.restapi.internal.SupplierInvitationInternalModel;
import earth.praesideo.services.email.factory.EmailFactory;
import earth.praesideo.services.email.service.EmailServiceImpl;
import earth.praesideo.services.template.EmailTemplate;
import earth.praesideo.services.template.RestorePasswordTemplate;
import earth.praesideo.services.template.SupplierInvitationTemplate;
import earth.praesideo.utils.MessageType;
import earth.praesideo.utils.NotificationUtil;
import earth.praesideo.utils.UrlGenerator;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.event.EventListener;
import org.springframework.stereotype.Component;

import java.util.Locale;

@Component
public class EmailNotificationService {
    private static final Logger LOGGER = LoggerFactory.getLogger(EmailNotificationService.class);
    private final EmailServiceImpl emailService;
    private final NotificationUtil notificationUtil;
    private final EmailFactory emailFactory;
    private final UrlGenerator urlGenerator;

    @Autowired
    public EmailNotificationService(EmailServiceImpl emailService, NotificationUtil notificationUtil, EmailFactory emailFactory, UrlGenerator urlGenerator) {
        this.urlGenerator = urlGenerator;
        LOGGER.info(this.getClass().getSimpleName() + " created.");
        this.emailService = emailService;
        this.notificationUtil = notificationUtil;
        this.emailFactory = emailFactory;
    }

    @EventListener
    public void onApplicationEvent(AccountCreatedInternalModel accountCreatedInternalModel) {
        LOGGER.debug("sending email: " + accountCreatedInternalModel);

        EmailTemplate template = emailFactory.getAccountVerifiedTemplate();
        template.setLink(urlGenerator.getBaseUrl()
                + "/activate-account/"
                + accountCreatedInternalModel.getActivationString());

        emailService.sendEmail(accountCreatedInternalModel.getEmail(), notificationUtil.getByType(MessageType.VERIFY_EMAIL).get(Locale.ENGLISH).getTitle(), template, AppLogType.EMAIL_REGISTRATION);
    }

    @EventListener
    public void onApplicationEvent(ForgetPasswordInternalModel forgetPasswordInternalModel) {
        LOGGER.debug("sending email: " + forgetPasswordInternalModel);
        RestorePasswordTemplate restorePasswordTemplate = emailFactory.getRestorePasswordTemplate();
        restorePasswordTemplate.setRestorePasswordHyperlink(urlGenerator.getBaseUrl() + String.format(forgetPasswordInternalModel.getRestoreLink(), forgetPasswordInternalModel.getVerificationKey()));
        emailService.sendEmail(forgetPasswordInternalModel.getEmail(), notificationUtil.getByType(MessageType.RESTORE_PASSWORD).get(Locale.ENGLISH).getTitle(), restorePasswordTemplate, AppLogType.RESTORE_PWD);
    }

    @EventListener
    public void onApplicationEvent(SupplierInvitationInternalModel supplierInvitationInternalModel) {
        LOGGER.debug("sending email: " + supplierInvitationInternalModel);
        SupplierInvitationTemplate supplierInvitationTemplate = emailFactory.getInvitationSupplierTemplate();
        supplierInvitationTemplate.setSupplierInvitationMessage(supplierInvitationInternalModel.getMessage());
        emailService.sendEmailBulk(supplierInvitationInternalModel.getEmail(), supplierInvitationInternalModel.getCc(),
                supplierInvitationInternalModel.getSubject(),
                supplierInvitationTemplate,
                AppLogType.SUPPLIER_INVITATION);
    }
}
