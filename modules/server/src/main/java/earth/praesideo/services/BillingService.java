package earth.praesideo.services;

import earth.praesideo.database.entities.common.RefBankAccountsEntity;
import earth.praesideo.database.entities.common.RefListEntity;
import earth.praesideo.database.entities.common.RefVATEntity;
import earth.praesideo.database.entities.products.Discount;
import earth.praesideo.database.entities.products.Invoice;
import earth.praesideo.database.entities.products.InvoiceItem;
import earth.praesideo.database.entities.products.ProductSubscription;
import earth.praesideo.database.repositories.common.*;
import earth.praesideo.database.repositories.products.DiscountRepository;
import earth.praesideo.database.repositories.products.InvoiceRepository;
import earth.praesideo.database.repositories.products.PaymentRepository;
import earth.praesideo.database.repositories.products.ProductSubscriptionRepository;
import earth.praesideo.database.repositories.suppliers.SupplyChainRepository;
import earth.praesideo.enums.RefListValue;
import earth.praesideo.database.repositories.products.*;
import earth.praesideo.enums.RefListKey;
import earth.praesideo.models.restapi.CompanyGeneralBackgroundModel;
import earth.praesideo.models.restapi.general.RefBankAccountsModel;
import earth.praesideo.models.restapi.products.InvoiceDto;
import earth.praesideo.models.restapi.products.InvoiceItemDto;
import earth.praesideo.services.ref.RefListService;
import earth.praesideo.utils.BigDecimalUtils;
import earth.praesideo.utils.DateUtils;
import earth.praesideo.utils.SubscriptionUtil;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.math.BigDecimal;
import java.util.*;
import java.math.RoundingMode;

@AllArgsConstructor
@Service
public class BillingService {

    private final SubscriptionUtil subscriptionUtil;
    private final RefListRepository refListRepository;
    private final ProductSubscriptionRepository productSubscriptionRepository;
    private final DiscountRepository discountRepository;
    private final InvoiceRepository invoiceRepository;
    private final InvoiceItemRepository invoiceItemRepository;
    private final PaymentRepository paymentRepository;
    private final SupplyChainRepository supplyChainRepository;
    private final CompanyService companyService;
    private final RefCountryStateRepository refCountryStateRepository;
    private final RefCountryRepository refCountryRepository;
    private final RefBankAccountsRepository refBankAccountsRepository;
    private final RefVATRepository refVATRepository;
    private final RefListService refListService;

    public List<RefBankAccountsModel> getBankAccounts() {
        List<RefBankAccountsModel> listAccounts = new LinkedList<>();
        List<RefBankAccountsEntity> accounts = this.refBankAccountsRepository.findAll();
        for (RefBankAccountsEntity account : accounts) {
            RefBankAccountsModel outAccount = new RefBankAccountsModel();
            outAccount.setId(account.getId());
            outAccount.setAccountName(account.getAccountName());
            outAccount.setAccountNumber(account.getAccountNumber());
            outAccount.setAccountHolderAddress(account.getAccountHolderAddress());
            outAccount.setBankName(account.getBankName());
            outAccount.setBicCode(account.getBicCode());
            outAccount.setCurrency(account.getCurrency().getCode());
            outAccount.setCountry(account.getCountry().getCountry());
            listAccounts.add(outAccount);
        }
        return listAccounts;
    }

    public List<InvoiceDto> getAllBillsForCompany(Integer companyId) {
        List<InvoiceDto> listInvoiceDto = new LinkedList<>();
        var companyGeneralBackground = companyService.getGeneralBackground(companyId);
        var allSubscription = productSubscriptionRepository.findByCompanyCompanyId(companyId);
        if (allSubscription != null && allSubscription.size() > 0) {
            for (ProductSubscription subs : allSubscription) {
                var allInvoices = invoiceRepository.findAllByProductSubscriptionId(subs.getId());
                if (allInvoices != null && allInvoices.size() > 0) {
                    for (Invoice invoice : allInvoices) {
                        InvoiceDto outInvoice = new InvoiceDto();
                        outInvoice.setId(invoice.getId());
                        outInvoice.setCustomer(companyGeneralBackground.getCompanyName());
                        outInvoice.setAddress(this.formatAddress(companyGeneralBackground));
                        outInvoice.setSubscription(subs.getProductVariant().getDescription());
                        outInvoice.setInvoiceType(invoice.getInvoiceType().getListValue());
                        outInvoice.setInvoiceAmount(invoice.getInvoiceAmount());
                        outInvoice.setInvoiceDate(invoice.getInvoiceDate());
                        outInvoice.setInvoiceDueDate(invoice.getInvoiceDueDate());
                        outInvoice.setInvoiceDateFormatted(DateUtils.getBillingDateFormatted(invoice.getInvoiceDate()));
                        outInvoice.setInvoiceDueDateFormatted(DateUtils.getBillingDateFormatted(invoice.getInvoiceDueDate()));
                        outInvoice.setPeriodFormatted(DateUtils.getBillingDateFormatted(subs.getStartDate())
                                .concat(" - ")
                                .concat(DateUtils.getBillingDateFormatted
                                        (DateUtils.addYearToDate(subs.getStartDate(), 1))));
                        outInvoice.setInvoiceStatus(invoice.getInvoiceStatus().getListValue());
                        outInvoice.setInvoiceCurrency(invoice.getInvoiceCurrency().getCurrency());
                        outInvoice.setInvoiceReference(invoice.getInvoiceReference());
                        outInvoice.setInvoiceAmountFormatted(invoice.getInvoiceCurrency().getCode()
                                .concat(" ")
                                .concat(BigDecimalUtils.getFormattedAmount(invoice.getInvoiceAmount())));
                        List<InvoiceItemDto> invoiceItemDtoList = new LinkedList<>();
                        for (InvoiceItem invoiceItem : invoice.getInvoiceItems()) {
                            InvoiceItemDto invoiceItemDto = new InvoiceItemDto();
                            invoiceItemDto.setId(invoiceItem.getId());
                            invoiceItemDto.setInvoiceItemText(invoiceItem.getInvoiceItemText());
                            invoiceItemDto.setInvoiceItemCurrency(invoiceItem.getInvoiceItemCurrency().getCode());
                            invoiceItemDto.setInvoiceItemAmount(invoiceItem.getInvoiceItemAmount());
                            invoiceItemDto.setInvoiceItemType(invoiceItem.getInvoiceItemType().getListValue());
                            invoiceItemDto.setInvoiceItemSequence(invoiceItem.getInvoiceItemSequence());
                            invoiceItemDto.setInvoiceItemDisplayAmount(invoiceItem.getInvoiceItemCurrency().getCode()
                                    .concat(" ")
                                    .concat(BigDecimalUtils.getFormattedAmount(invoiceItem.getInvoiceItemAmount())));
                            invoiceItemDtoList.add(invoiceItemDto);
                        }
                        invoiceItemDtoList.sort(Comparator.comparing((o -> o.getInvoiceItemSequence())));
                        outInvoice.setInvoiceLineItems(invoiceItemDtoList);
                        listInvoiceDto.add(outInvoice);
                    }
                }
            }
        }
        if (listInvoiceDto.size() > 0) {
            listInvoiceDto.sort(Comparator.comparing((o -> o.getId())));
        }
        return listInvoiceDto;
    }

    private String formatAddress(CompanyGeneralBackgroundModel generalBackgroundModel) {
        var formattedAddress = "";
        if (generalBackgroundModel.getCity() != null) {
            formattedAddress = formattedAddress.concat(generalBackgroundModel.getCity()).concat(", ");
        }
        if (generalBackgroundModel.getStateId() != null) {
            formattedAddress = formattedAddress.concat(this.refCountryStateRepository.findById(generalBackgroundModel.getStateId()).get().getStateName()).concat(", ");
        }
        if (generalBackgroundModel.getCountryId() != null) {
            formattedAddress = formattedAddress.concat(this.refCountryRepository.getById(generalBackgroundModel.getCountryId()).getCountry());
        }
        return formattedAddress;
    }

    public void generateDailyBills() {
        var activeSubscriptions = productSubscriptionRepository.findByEndDateIsNull();
        activeSubscriptions.forEach(subscription -> this.processActiveSubscription(subscription, true));
        // TODO
//        var inActiveSubscriptions = productSubscriptionRepository.findByEndDateIsNotNullAndEndDateAfter(new Date());
//        inActiveSubscriptions.forEach(this::processInActiveSubscription);
    }

    public void generateDailyBill(final Integer companyId) {
        var activeSubscription = productSubscriptionRepository.findByCompanyCompanyIdAndEndDateIsNull(companyId);
        activeSubscription.ifPresent(subscription -> this.processActiveSubscription(subscription, false));
        // TODO
//        var inActiveSubscription = productSubscriptionRepository
//                .findByCompanyCompanyIdAndEndDateIsNotNullAndEndDateAfter(companyId, new Date());
//        inActiveSubscription.ifPresent(this::processInActiveSubscription);
    }

    @Transactional
    public void processActiveSubscription(ProductSubscription subscription, boolean isFreePeriodCheck) {
        var invoice = invoiceRepository.findFirstByProductSubscriptionId(subscription.getId());
        if (invoice.isEmpty()) {
            if (!isFreePeriodCheck ||
                    (isFreePeriodCheck && subscriptionUtil.ifSubscriptionFreePeriodExpired(subscription))) {
                var invoiceEntity = createParentInvoice(subscription, RefListValue.INVOICE_TYPE_YEARLY_SUBSCRIPTION);
                invoiceEntity = calculateSubscriptionInvoice(invoiceEntity, subscription);
                invoiceRepository.save(invoiceEntity);
            }
        }

        var yearlyInvoice = invoiceRepository.findFirstByProductSubscriptionId(subscription.getId());
        if (yearlyInvoice.isEmpty() && subscriptionUtil.iYearPassed(subscription)) {
            var invoiceEntity = createParentInvoice(subscription, RefListValue.INVOICE_TYPE_YEARLY_SUBSCRIPTION);
            invoiceEntity = calculateSubscriptionInvoice(invoiceEntity, subscription);
            invoiceRepository.save(invoiceEntity);
        }
    }

    private void processInActiveSubscription(ProductSubscription subscription) {
        var invoicePaidStatus = refListRepository.findByListKeyAndListValueIgnoreCase(
                RefListKey.INVOICE_STATUS.getValue(), RefListValue.INVOICE_STATUS_PAID.getValue()
        ).get();
        var invoiceCancelledStatus = refListRepository.findByListKeyAndListValueIgnoreCase(
                RefListKey.INVOICE_STATUS.getValue(), RefListValue.INVOICE_STATUS_CANCELLED.getValue()
        ).get();

        var invoice = invoiceRepository.findFirstByProductSubscriptionId(subscription.getId());
        invoice.ifPresent(invoiceEntity -> {
            if (invoiceEntity.getInvoiceStatus().equals(invoicePaidStatus)
                    && paymentRepository.existsByInvoiceId(invoiceEntity.getId())) {// need check paid status for payment?
                // TODO
            } else {
                invoiceEntity.setInvoiceStatus(invoiceCancelledStatus);
            }
            invoiceRepository.save(invoiceEntity);
        });
    }

    private Invoice calculateSubscriptionInvoice(Invoice invoiceEntity, ProductSubscription subscription) {
        var firstItem = createFirstLineItem(invoiceEntity);
        var invoicePaidStatus = refListRepository.findByListKeyAndListValueIgnoreCase(
                RefListKey.INVOICE_STATUS.getValue(), RefListValue.INVOICE_STATUS_PAID.getValue()
        ).get();
        BigDecimal amount = firstItem.getInvoiceItemAmount();
        var discounts = discountRepository.findAllByProductVariantIdAndDiscountEndDateIsNullOrDiscountEndDateIsAfter(subscription.getProductVariant().getId(), new Date());
        if (discounts != null && !discounts.isEmpty()) {
            for (Discount discount : discounts) {
                if (discount.getIsDiscountOnProduct() && !discount.getIsDiscountOnTotal()
                        && (discount.getDiscountEndDate() == null || discount.getDiscountEndDate().after(new Date()))) {
                    var discountOnProductItem2 = createDiscountOnProductItem(invoiceEntity, discount);
                    var subTotal3 = createSubTotalItem(invoiceEntity, firstItem, discountOnProductItem2, 3);
                    amount = subTotal3.getInvoiceItemAmount();
                    if (discount.getIsDiscountOnCustomer() && !discount.getIsDiscountOnTotal()
                            && (discount.getDiscountEndDate() == null || discount.getDiscountEndDate().after(new Date()))) {
                        var discountOnCustomerItem4 = createDiscountOnCustomerItem(invoiceEntity, discount);
                        var subTotal5 = createSubTotalItem(invoiceEntity, subTotal3, discountOnCustomerItem4, 5);
                        amount = subTotal5.getInvoiceItemAmount();
                    }
                } else if (discount.getIsDiscountOnCustomer() && !discount.getIsDiscountOnTotal()
                        && (discount.getDiscountEndDate() == null || discount.getDiscountEndDate().after(new Date()))) {
                    var discountOnCustomerItem4 = createDiscountOnCustomerItem(invoiceEntity, discount);
                    var subTotal5 = createSubTotalItem(invoiceEntity, firstItem, discountOnCustomerItem4, 5);
                    amount = subTotal5.getInvoiceItemAmount();
                }
            }
        }
        var total = createTotalItem(invoiceEntity, amount, discounts);
        invoiceEntity.setInvoiceAmount(total.getInvoiceItemAmount());
        if (total.getInvoiceItemAmount().compareTo(BigDecimal.ZERO) == -1) {
            invoiceEntity.setInvoiceStatus(invoicePaidStatus);
        }

        Optional<RefListEntity> demoAccountCheck = this.refListService.getRefListEntityByKeyValue
                (RefListKey.PRAESIDEO_DEMO_COMPANY_ID.getValue(), subscription.getCompany().getCompanyId().toString());
        if (demoAccountCheck.isPresent()) {
            var invoiceCancelledStatus = refListRepository.findByListKeyAndListValueIgnoreCase(
                    RefListKey.INVOICE_STATUS.getValue(), RefListValue.INVOICE_STATUS_CANCELLED.getValue()
            ).get();
            invoiceEntity.setInvoiceStatus(invoiceCancelledStatus);
        }
        this.addVATIfApplicable(invoiceEntity, total.getInvoiceItemAmount(), subscription);
        return invoiceEntity;
    }

    private Invoice createParentInvoice(final ProductSubscription subscription, final RefListValue refListValue) {
        var invoiceTypeYearlySubscription = refListRepository.findByListKeyAndListValueIgnoreCase(
                RefListKey.INVOICE_TYPE.getValue(), refListValue.getValue()
        ).get();
        var invoiceNewStatus = refListRepository.findByListKeyAndListValueIgnoreCase(
                RefListKey.INVOICE_STATUS.getValue(), RefListValue.INVOICE_STATUS_NEW.getValue()
        ).get();
        var invoiceEntity = new Invoice();
        invoiceEntity.setInvoiceType(invoiceTypeYearlySubscription);
        invoiceEntity.setProductSubscription(subscription);
        invoiceEntity.setInvoiceAmount(subscription.getProductVariant().getProductSubscriptionAnnualCost());
        invoiceEntity.setInvoiceCurrency(subscription.getProductVariant().getProductSubscriptionCurrency());
        Date currentDate = new Date();
        Calendar c = Calendar.getInstance();
        c.setTime(currentDate);
        invoiceEntity.setInvoiceDate(currentDate);
        c.add(Calendar.DATE, 30);
        Date currentDatePlus30 = c.getTime();
        invoiceEntity.setInvoiceDueDate(currentDatePlus30);
        invoiceEntity = invoiceRepository.save(invoiceEntity);
        invoiceEntity.setInvoiceReference("Invoice#:" + invoiceEntity.getId().toString());
        invoiceEntity.setInvoiceStatus(invoiceNewStatus);
        return invoiceRepository.save(invoiceEntity);
    }

    private InvoiceItem createFirstLineItem(final Invoice invoice) {
        var invoiceItemType = refListRepository.findByListKeyAndListValueIgnoreCase(
                RefListKey.INVOICE_ITEM_TYPE.getValue(), RefListValue.INVOICE_ITEM_TYPE_ITEM.getValue()
        ).get();

        var item = new InvoiceItem();
        item.setInvoice(invoice);
        item.setInvoiceItemText(invoice.getInvoiceType().getListValue());
        item.setInvoiceItemCurrency(invoice.getInvoiceCurrency());
        item.setInvoiceItemAmount(invoice.getProductSubscription().getProductVariant().getProductSubscriptionAnnualCost());
        item.setInvoiceItemSequence(1);
        item.setInvoiceItemType(invoiceItemType);
        return invoiceItemRepository.save(item);
    }

    private InvoiceItem createDiscountOnProductItem(Invoice invoice, Discount discount) {
        var invoiceItemType = refListRepository.findByListKeyAndListValueIgnoreCase(
                RefListKey.INVOICE_ITEM_TYPE.getValue(), RefListValue.INVOICE_ITEM_TYPE_DISCOUNT.getValue()
        ).get();

        var item = new InvoiceItem();
        item.setInvoice(invoice);
        item.setInvoiceItemText("Discount on product");
        item.setInvoiceItemCurrency(invoice.getInvoiceCurrency());
        if (discount.getIsDiscountAbsolute()) {
            item.setInvoiceItemAmount(discount.getDiscountOnProductAbsolute());
        } else if (discount.getIsDiscountPercentage()) {
            item.setInvoiceItemAmount(discount.getDiscountOnProductPercentage()
                    .multiply(invoice.getProductSubscription().getProductVariant().getProductSubscriptionAnnualCost())
                    .divide(BigDecimal.valueOf(100)));
        }
        item.setInvoiceItemSequence(2);
        item.setInvoiceItemType(invoiceItemType);
        item.setDiscount(discount);
        return invoiceItemRepository.save(item);
    }

    private InvoiceItem createSubTotalItem(Invoice invoice, InvoiceItem item1, InvoiceItem item2, Integer invoiceItemSequence) {
        var invoiceItemType = refListRepository.findByListKeyAndListValueIgnoreCase(
                RefListKey.INVOICE_ITEM_TYPE.getValue(), RefListValue.INVOICE_ITEM_TYPE_SUBTOTAL.getValue()
        ).get();

        var item = new InvoiceItem();
        item.setInvoice(invoice);
        item.setInvoiceItemText("Sub Total");
        item.setInvoiceItemCurrency(invoice.getInvoiceCurrency());
        item.setInvoiceItemAmount(item1.getInvoiceItemAmount().add(item2.getInvoiceItemAmount().negate()));
        item.setInvoiceItemSequence(invoiceItemSequence);
        item.setInvoiceItemType(invoiceItemType);
        return invoiceItemRepository.save(item);
    }

    private InvoiceItem createDiscountOnCustomerItem(Invoice invoice, Discount discount) {
        var invoiceItemType = refListRepository.findByListKeyAndListValueIgnoreCase(
                RefListKey.INVOICE_ITEM_TYPE.getValue(), RefListValue.INVOICE_ITEM_TYPE_DISCOUNT.getValue()
        ).get();

        var item = new InvoiceItem();
        item.setInvoice(invoice);
        item.setInvoiceItemText("Discount on customer");
        item.setInvoiceItemCurrency(invoice.getInvoiceCurrency());
        if (discount.getIsDiscountAbsolute()) {
            item.setInvoiceItemAmount(discount.getDiscountOnCustomerAbsolute());
        } else if (discount.getIsDiscountPercentage()) {
            item.setInvoiceItemAmount(discount.getDiscountOnCustomerPercentage()
                    .multiply(invoice.getProductSubscription().getProductVariant().getProductSubscriptionAnnualCost())
                    .divide(BigDecimal.valueOf(100)));
        }
        item.setInvoiceItemSequence(4);
        item.setInvoiceItemType(invoiceItemType);
        item.setDiscount(discount);
        return invoiceItemRepository.save(item);
    }

    private InvoiceItem createTotalItem(Invoice invoice, BigDecimal amount, List<Discount> discountList) {
        var invoiceItemType = refListRepository.findByListKeyAndListValueIgnoreCase(
                RefListKey.INVOICE_ITEM_TYPE.getValue(), RefListValue.INVOICE_ITEM_TYPE_TOTAL.getValue()
        ).get();

        var invoiceItemTypeDiscount = refListRepository.findByListKeyAndListValueIgnoreCase(
                RefListKey.INVOICE_ITEM_TYPE.getValue(), RefListValue.INVOICE_ITEM_TYPE_DISCOUNT.getValue()
        ).get();

        if (discountList != null && !discountList.isEmpty()) {
            for (Discount discount : discountList) {
                if (discount.getIsDiscountOnTotal()) {
                    var item = new InvoiceItem();
                    item.setInvoice(invoice);
                    item.setInvoiceItemText("Discount on Total");
                    item.setInvoiceItemCurrency(invoice.getInvoiceCurrency());
                    item.setInvoiceItemSequence(6);
                    item.setInvoiceItemType(invoiceItemTypeDiscount);
                    if (discount.getIsDiscountAbsolute()) {
                        item.setInvoiceItemAmount(discount.getDiscountOnTotalAbsolute());
                        amount = amount.subtract(discount.getDiscountOnTotalAbsolute());
                    } else {
                        item.setInvoiceItemAmount(discount.getDiscountOnTotalPercentage().multiply(amount).divide(BigDecimal.valueOf(100)));
                        amount = amount.subtract(discount.getDiscountOnTotalPercentage().multiply(amount).divide(BigDecimal.valueOf(100)));
                    }
                    item.setDiscount(discount);
                    invoiceItemRepository.save(item);
                    break;
                }
            }
        }

        var item = new InvoiceItem();
        item.setInvoice(invoice);
        item.setInvoiceItemText("Total");
        item.setInvoiceItemCurrency(invoice.getInvoiceCurrency());
        if (amount.compareTo(BigDecimal.ZERO) == -1) {
            item.setInvoiceItemAmount(BigDecimal.ZERO);
        } else {
            item.setInvoiceItemAmount(amount);
        }
        item.setInvoiceItemSequence(7);
        item.setInvoiceItemType(invoiceItemType);
        return invoiceItemRepository.save(item);
    }

    public void addVATIfApplicable(Invoice invoice, BigDecimal amount, ProductSubscription subscription) {
        var countryId = subscription.getCompany().getCountryId();
        if (countryId > 0) {
            Optional<RefVATEntity> vatEntity = this.refVATRepository.findByCountryId(countryId);
            if (vatEntity.isPresent()) {
                var invoiceItemType = refListRepository.findByListKeyAndListValueIgnoreCase(
                        RefListKey.INVOICE_ITEM_TYPE.getValue(), RefListValue.INVOICE_ITEM_TYPE_VAT.getValue()
                ).get();
                var item = new InvoiceItem();
                item.setInvoice(invoice);
                item.setInvoiceItemText(RefListValue.INVOICE_ITEM_TYPE_VAT.getValue()
                        .concat(" (@")
                        .concat(vatEntity.get().getVatInPercentage().toString())
                        .concat("%, ")
                        .concat(subscription.getCompany().getRefCountry().getCountry())
                        .concat(")"));
                item.setInvoiceItemCurrency(invoice.getInvoiceCurrency());
                if (amount.compareTo(BigDecimal.ZERO) == -1) {
                    item.setInvoiceItemAmount(BigDecimal.ZERO);
                } else {
                    item.setInvoiceItemAmount(amount.multiply(vatEntity.get().getVatInPercentage()).divide(BigDecimal.valueOf(100)));
                }
                item.setInvoiceItemSequence(10);
                item.setInvoiceItemType(invoiceItemType);
                invoiceItemRepository.save(item);
            }
        }
    }

    public void generateYearlyBills() {
        var activeSubscriptions = productSubscriptionRepository.findByYear();
        activeSubscriptions.forEach(this::processYearSubscription);
    }

    private void processYearSubscription(final ProductSubscription subscription) {
        var suppliersCount = supplyChainRepository.countSupplyChainByCustomerCompanyIdAndDateAddedBeforeAndDateRemovedIsNullOrDateRemovedAfter(subscription.getCompany().getCompanyId(), subscription.getStartDate(),
                Optional.ofNullable(subscription.getEndDate()).orElse(new Date())
        );
        var parentInvoice = createParentInvoice(subscription, RefListValue.INVOICE_TYPE_YEARLY_SUBSCRIPTION);
        var firstItem = createYearFirstLineItem(parentInvoice, suppliersCount);
        BigDecimal amount = firstItem.getInvoiceItemAmount();
        var discounts = discountRepository.findAllByProductVariantIdAndDiscountEndDateIsNullOrDiscountEndDateIsAfter(subscription.getProductVariant().getId(), new Date());
        if (discounts != null && !discounts.isEmpty()) {
            for (Discount discount : discounts) {
                if (discount.getIsDiscountOnSupplierUsage()
                        && discount.getDiscountStartDate().after(subscription.getStartDate())
                        && (discount.getDiscountEndDate() == null || discount.getDiscountEndDate().after(subscription.getEndDate()))) {
                    if (discount.getIsDiscountOnProduct()
                            && (discount.getDiscountEndDate() == null || discount.getDiscountEndDate().after(new Date()))) {
                        var discountOnProductItem2 = createYearlyDiscountOnProductItem(parentInvoice, discount, suppliersCount);
                        var subTotal3 = createSubTotalItem(parentInvoice, firstItem, discountOnProductItem2, 3);
                        amount = subTotal3.getInvoiceItemAmount();
                        if (discount.getIsDiscountOnCustomer()
                                && (discount.getDiscountEndDate() == null || discount.getDiscountEndDate().after(new Date()))) {
                            var discountOnCustomerItem4 = createYearlyDiscountOnCustomerItem(parentInvoice, discount, suppliersCount);
                            var subTotal5 = createSubTotalItem(parentInvoice, subTotal3, discountOnCustomerItem4, 5);
                            amount = subTotal5.getInvoiceItemAmount();
                        }
                    } else if (discount.getIsDiscountOnCustomer()
                            && (discount.getDiscountEndDate() == null || discount.getDiscountEndDate().after(new Date()))) {
                        var discountOnCustomerItem4 = createYearlyDiscountOnCustomerItem(parentInvoice, discount, suppliersCount);
                        var subTotal5 = createSubTotalItem(parentInvoice, firstItem, discountOnCustomerItem4, 5);
                        amount = subTotal5.getInvoiceItemAmount();
                    }
                }
            }
        }
        var total = createTotalItem(parentInvoice, amount, discounts);
        parentInvoice.setInvoiceAmount(total.getInvoiceItemAmount());
    }

    private InvoiceItem createYearFirstLineItem(final Invoice invoice, final Integer suppliersCount) {
        var productVariant = invoice.getProductSubscription().getProductVariant();
        var invoiceItemType = refListRepository.findByListKeyAndListValueIgnoreCase(
                RefListKey.INVOICE_ITEM_TYPE.getValue(), RefListValue.INVOICE_ITEM_TYPE_ITEM.getValue()
        ).get();

        var item = new InvoiceItem();
        item.setInvoice(invoice);
        item.setInvoiceItemText(invoice.getInvoiceType().getListValue());
        item.setInvoiceItemCurrency(invoice.getInvoiceCurrency());
        item.setInvoiceItemAmount(productVariant.getProductSubscriptionTierCostPerSupplier().multiply(BigDecimal.valueOf(suppliersCount)));
        item.setInvoiceItemSequence(1);
        item.setInvoiceItemType(invoiceItemType);
        return invoiceItemRepository.save(item);
    }

    private InvoiceItem createYearlyDiscountOnProductItem(final Invoice invoice, final Discount discount, final Integer suppliersCount) {
        var invoiceItemType = refListRepository.findByListKeyAndListValueIgnoreCase(
                RefListKey.INVOICE_ITEM_TYPE.getValue(), RefListValue.INVOICE_ITEM_TYPE_DISCOUNT.getValue()
        ).get();

        var item = new InvoiceItem();
        item.setInvoice(invoice);
        item.setInvoiceItemText("Discount on product");
        item.setInvoiceItemCurrency(invoice.getInvoiceCurrency());
        if (discount.getIsDiscountAbsolute()) {
            item.setInvoiceItemAmount(discount.getDiscountOnProductAbsolute());
        } else if (discount.getIsDiscountPercentage()
                || invoice.getProductSubscription().getStartDate().before(new Date())) {
            item.setInvoiceItemAmount(discount.getDiscountOnProductPercentage()
                    .multiply(invoice.getProductSubscription().getProductVariant().getProductSubscriptionTierCostPerSupplier())
                    .multiply(BigDecimal.valueOf(suppliersCount))
                    .multiply(BigDecimal.valueOf(subscriptionUtil.daysBetween(invoice.getProductSubscription().getStartDate(), Optional.ofNullable(invoice.getProductSubscription().getEndDate()).orElse(new Date()))))
                    .divide(BigDecimal.valueOf(365), RoundingMode.HALF_UP)
            );
        }
        item.setInvoiceItemSequence(2);
        item.setInvoiceItemType(invoiceItemType);
        return invoiceItemRepository.save(item);
    }

    private InvoiceItem createYearlyDiscountOnCustomerItem(Invoice invoice, Discount discount, Integer suppliersCount) {
        var invoiceItemType = refListRepository.findByListKeyAndListValueIgnoreCase(
                RefListKey.INVOICE_ITEM_TYPE.getValue(), RefListValue.INVOICE_ITEM_TYPE_DISCOUNT.getValue()
        ).get();

        var item = new InvoiceItem();
        item.setInvoice(invoice);
        item.setInvoiceItemText("Discount on customer");
        item.setInvoiceItemCurrency(invoice.getInvoiceCurrency());
        if (discount.getIsDiscountAbsolute()) {
            item.setInvoiceItemAmount(discount.getDiscountOnCustomerAbsolute());
        } else if (discount.getIsDiscountPercentage()) {
            item.setInvoiceItemAmount(discount.getDiscountOnProductPercentage()
                    .multiply(invoice.getProductSubscription().getProductVariant().getProductSubscriptionTierCostPerSupplier())
                    .multiply(BigDecimal.valueOf(suppliersCount))
                    .multiply(BigDecimal.valueOf(subscriptionUtil.daysBetween(invoice.getProductSubscription().getStartDate(), Optional.ofNullable(invoice.getProductSubscription().getEndDate()).orElse(new Date()))))
                    .divide(BigDecimal.valueOf(365), RoundingMode.HALF_UP)
            );
        }
        item.setInvoiceItemSequence(4);
        item.setInvoiceItemType(invoiceItemType);
        return invoiceItemRepository.save(item);
    }
}
