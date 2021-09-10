package earth.praesideo.services;

import earth.praesideo.database.entities.common.YearRepresentationEntity;
import earth.praesideo.database.entities.suppliers.*;
import earth.praesideo.database.entities.users.CompanyEntity;
import earth.praesideo.database.repositories.common.YearRepresentationRepository;
import earth.praesideo.database.repositories.suppliers.*;
import earth.praesideo.exceptions.ApiException;
import earth.praesideo.exceptions.ExceptionContent;
import earth.praesideo.models.restapi.suppliers.SupplierAllocationDto;
import earth.praesideo.models.restapi.suppliers.SupplyChainDto;
import earth.praesideo.models.security.CustomUserDetailsModel;
import lombok.AllArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.*;
import java.util.stream.Collectors;

@AllArgsConstructor
@Service
public class SuppliersService {

    private final SupplyChainRepository supplyChainRepository;
    private final SupplierAllocationRepository supplierAllocationRepository;
    private final SupplierCategoryRepository supplierCategoryRepository;
    private final SupplierTypeRepository supplierTypeRepository;
    private final SupplierInvitationStatusRepository supplierInvitationStatusRepository;
    private final YearRepresentationRepository yearRepresentationRepository;
    private final CompanyService companyService;


    public List<SupplierCategory> getSupplierCategories() {
        return supplierCategoryRepository.findAll();
    }

    public List<SupplierType> getSupplierTypes() {
        return supplierTypeRepository.findAll();
    }

    public List<SupplierInvitationStatus> getSupplierInvitationStatuses() {
        return supplierInvitationStatusRepository.findAll();
    }

    public List<CompanyEntity> selectSuppliers(final String query, final CustomUserDetailsModel user) {
        return companyService.selectSuppliers(query, user);
    }

    public List<YearRepresentationEntity> getYearRepresentations(final Integer companyId) {
        return yearRepresentationRepository.findCreatedBySupplyChainCustomerId(companyId);
    }

    public Page<SupplyChain> getSupplyChainsByRepresentationYearAndUser(final Integer companyId,
                                                                        final Integer yearRepresentationId,
                                                                        final Pageable pageable) {
        var year = yearRepresentationRepository.getById(yearRepresentationId);
        return supplyChainRepository.findAllByCustomerCompanyIdAndYearAndDateRemovedIsNull(companyId, year.getCalendarYear(), pageable);
    }

    public Page<SupplyChain> getSupplyByCustomerCompanyIdAndDateInvitationPage(final Integer companyId,
                                                                        final Pageable pageable) {
        return supplyChainRepository.findAllByCustomerCompanyIdAndDateInvitationPage(companyId, pageable);
    }

    public Page<SupplyChain> getSupplyByCustomerCompanyIdAndYearAndDateInvitationPage(final Integer companyId,
                                                                        final Integer yearRepresentationId,
                                                                        final Pageable pageable) {
        var year = yearRepresentationRepository.getById(yearRepresentationId);
        return supplyChainRepository.findAllByCustomerCompanyIdAndYearAndDateInvitationPage(companyId, year.getCalendarYear(), pageable);
    }

    public SupplyChainDto getSupplyChainDtoInvitationDashboard(List<SupplierAllocationDto> supplierAllocationDtoList, SupplyChainDto supplyChainDto) {
        ClassificationStatus status = ClassificationStatus.COMPLETE;

        for (SupplierAllocationDto s : supplierAllocationDtoList) {
            if (s.getSupplierTypeId() == null || s.getSupplierAmount() == null || s.getSupplierCategoryId() == null || s.getSupplierCurrencyId() == null) {
                status = ClassificationStatus.INCOMPLETE;
                break;
            }
        }

        supplyChainDto.getSupplier().setStatus(status.name());

        if (!supplierAllocationDtoList.isEmpty()) {
            double amount = supplierAllocationDtoList
                    .stream()
                    .filter(f -> f.getSupplierAmount() != null)
                    .mapToDouble(SupplierAllocationDto::getSupplierAmount)
                    .sum();
            supplyChainDto.setAmount(amount);
            Set<Integer> setCurrencyIds = supplierAllocationDtoList
                    .stream()
                    .map(SupplierAllocationDto::getSupplierCurrencyId)
                    .filter(Objects::nonNull)
                    .collect(Collectors.toSet());

            supplyChainDto.setCurrency(setCurrencyIds.size() != 0 ? setCurrencyIds.size() > 1 ? "Multiple" : setCurrencyIds.stream().findFirst().get().toString() : "");
        }

        return supplyChainDto;
    }

    @Transactional
    public SupplyChain addSupplyChain(final String companyName,
                                      final Integer yearRepresentationId,
                                      final Integer startMonth,
                                      final Boolean isFinancialYear,
                                      final CustomUserDetailsModel user) {
        //TODO refactor
        var year = yearRepresentationRepository.getById(yearRepresentationId);
        Page<SupplyChain> suppliers = supplyChainRepository.findAllByCustomerCompanyIdAndYearAndDateRemovedIsNull(user.getCompanyId(), year.getCalendarYear(), PageRequest.of(0, Integer.MAX_VALUE));
        var company = companyService.createSupplierCompany(suppliers.getContent() ,companyName, user);
        return addSupplyChain(company.getCompanyId(), yearRepresentationId, startMonth, isFinancialYear, user);
    }

    @Transactional
    public SupplyChain addSupplyChain(final Integer supplierCompanyId,
                                      final Integer yearRepresentationId,
                                      final Integer startMonth,
                                      final Boolean isFinancialYear,
                                      final CustomUserDetailsModel user) {
        if (supplyChainRepository.existsByCustomerCompanyIdAndSupplierCompanyIdAndYearRepresentationIdAndDateRemovedIsNull(user.getCompanyId(), supplierCompanyId, yearRepresentationId)){
            throw new ApiException(ExceptionContent.SUPPLIER_EXIST_BY_YEAR, HttpStatus.BAD_REQUEST);
        }
        var supplier = companyService.getCompanyEntityById(supplierCompanyId);
        var customer = companyService.getCompanyEntityById(user.getCompanyId());


        //var invitation = supplierInvitationStatusRepository.findByValue(InvitationStatus.PENDING.name());
        var chain = new SupplyChain();

        chain.setSupplier(supplier);
        chain.setCustomer(customer);
        //chain.setSupplierInvitationStatus(invitation);
        chain.setStartMonth(startMonth);
        chain.setYearRepresentationId(yearRepresentationId);
        chain.setIsFinancialYear(isFinancialYear);
        return supplyChainRepository.save(chain);
    }

    public void deleteSupplyChain(final Integer supplyChainId, final CustomUserDetailsModel user) {
        supplyChainRepository.findById(supplyChainId).ifPresent(chain -> {
            chain.setDateRemoved(new Date());
            chain.setRemovedBy(user.getUsername());
            supplyChainRepository.save(chain);
        });
    }

    public void deleteSupplyAllocation(final Integer supplyAllocationId, final CustomUserDetailsModel user) {
        supplierAllocationRepository.findById(supplyAllocationId).ifPresent(allocation -> {
            allocation.setDateRemoved(new Date());
            allocation.setRemovedBy(user.getUsername());
            supplierAllocationRepository.save(allocation);
        });
    }

    public void addSupplierAllocation(final Integer supplyChainId, final SupplierAllocation allocation) {
        supplyChainRepository.findById(supplyChainId).ifPresent(chain -> {
            allocation.setSupplyChain(chain);
            supplierAllocationRepository.save(allocation);
        });
    }

    public void updateSupplierAllocation(final SupplierAllocation allocation) {
        supplierAllocationRepository.findById(allocation.getSupplierAllocationId()).ifPresent(chain -> {
            supplierAllocationRepository.save(allocation);
        });
    }

    public List<SupplierAllocation> getSupplierAllocationsBySupplyChain(final Integer supplyChainId) {
        return supplierAllocationRepository.findAllBySupplyChainSupplyChainIdAndDateRemovedIsNull(supplyChainId);
    }

    public boolean ifCompanyStatusSupplier(Integer supplierId) {
        return supplyChainRepository.statusSupplier(supplierId);
    }

    public List<SupplyChain> findAllSuppliersByInvitationStatus(Integer companyId, Integer invitationStatus) {
        return supplyChainRepository.findAllByCustomerCompanyIdAndDateRemovedIsNullAndSupplierInvitationStatusIdNotAndSupplierContactEmailIsNotNull(companyId, invitationStatus);
    }
}
