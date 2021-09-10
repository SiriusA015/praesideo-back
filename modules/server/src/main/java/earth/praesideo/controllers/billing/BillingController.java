package earth.praesideo.controllers.billing;

import earth.praesideo.models.restapi.general.RefBankAccountsModel;
import earth.praesideo.models.restapi.products.InvoiceDto;
import earth.praesideo.services.BillingService;
import lombok.AllArgsConstructor;
import lombok.Getter;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/billing")
@AllArgsConstructor
public class BillingController {

    private final BillingService billingService;

    @GetMapping("/get/{companyId}")
    public List<InvoiceDto> getBill(@PathVariable(name = "companyId") Integer companyId) {
       return billingService.getAllBillsForCompany(companyId);
    }
    @GetMapping("/getbankaccounts")
    public List<RefBankAccountsModel> getBankAccounts() {
        return billingService.getBankAccounts();
    }
    @PostMapping("/generate/daily")
    public void generateBill() {
        billingService.generateDailyBills();
    }

    @PostMapping("/generate/daily/{companyId}")
    public void generateBill(@PathVariable(name = "companyId") Integer companyId) {
        billingService.generateDailyBill(companyId);
    }

    @PostMapping("/generate/yearly")
    public void generateYearlyBill() {
        billingService.generateYearlyBills();
    }
}
