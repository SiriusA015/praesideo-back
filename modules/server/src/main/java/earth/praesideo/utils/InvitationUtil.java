package earth.praesideo.utils;

import earth.praesideo.database.entities.suppliers.SupplyChain;
import earth.praesideo.database.entities.users.CompanyEntity;
import earth.praesideo.database.repositories.common.CommonTextRepository;
import earth.praesideo.database.repositories.suppliers.SupplyChainRepository;
import lombok.Getter;
import org.springframework.stereotype.Component;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * @author Koshman Vadim
 */
@Component
@Getter
public class InvitationUtil {
    private final String SUBJECT_KEY = "TraceInviteSupplierEmailTitle";
    private final String MESSAGE_KEY = "TraceInviteSupplierEmailMessage";

    private final String REGISTRATION_URL = "/signup";
    private final String INVITATION_PARAM = "?cid=";

    private final String REPLACEMENT_KEY_INVITER = "company_inviter_name";
    private final String REPLACEMENT_KEY_INVITEE = "company_invitee_name";
    private final String REPLACEMENT_KEY_LINK = "sign_up_custom_link";

    private final CommonTextRepository commonTextRepository;
    private final UrlGenerator urlGenerator;
    private final SupplyChainRepository supplyChainRepository;

    public InvitationUtil(CommonTextRepository commonTextRepository, UrlGenerator urlGenerator, SupplyChainRepository supplyChainRepository) {
        this.commonTextRepository = commonTextRepository;
        this.urlGenerator = urlGenerator;
        this.supplyChainRepository = supplyChainRepository;
    }

    @Getter
    public class Content {
        private String subject = commonTextRepository.findOneByTextKey(SUBJECT_KEY).getTextValue();
        private String body = commonTextRepository.findOneByTextKey(MESSAGE_KEY).getTextValue();

        public Content(CompanyEntity company, SupplyChain supplyChain) {
            this.subject = prepareInvitationContent(company, supplyChain, subject);
            this.body = prepareInvitationContent(company, supplyChain, body);
        }
    }

    public Content getPreparedContentByCompanyId(CompanyEntity company, SupplyChain supplyChain) {
        return new Content(company, supplyChain);
    }

    private String prepareInvitationContent(CompanyEntity company, SupplyChain supplyChain, String text) {
        StringBuffer result = new StringBuffer();

        Pattern p = Pattern.compile("\\{([\\w.]+)}");
        Matcher m = p.matcher(text.replaceAll("\n", "<br>"));

        while (m.find()) {
            m.appendReplacement(result, getValueByGroupKey(company, supplyChain, m.group(1)));
        }
        m.appendTail(result);
        return result.toString();
    }

    private String getValueByGroupKey(CompanyEntity company, SupplyChain supplyChain, String groupKey) {
        CompanyEntity supplier = supplyChain.getSupplier();
        if (groupKey.equals(REPLACEMENT_KEY_INVITER)) {
            return company.getCompanyName();
        }
        if (groupKey.equals(REPLACEMENT_KEY_INVITEE)) {
            return supplier.getCompanyName();
        }
        if (groupKey.equals(REPLACEMENT_KEY_LINK)) {
            return "<a href=" + urlGenerator.getBaseUrl() + REGISTRATION_URL + INVITATION_PARAM + supplier.getCompanyId() + ">invitation link</a>";
        }
        return groupKey;
    }
}
