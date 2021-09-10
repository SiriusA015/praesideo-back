package earth.praesideo.services.suppliers

import earth.praesideo.database.entities.common.YearRepresentationEntity
import earth.praesideo.database.entities.suppliers.SupplierAllocation
import earth.praesideo.database.entities.suppliers.SupplyChain
import earth.praesideo.database.entities.users.CompanyEntity
import earth.praesideo.database.repositories.common.YearRepresentationRepository
import earth.praesideo.database.repositories.suppliers.SupplierAllocationRepository
import earth.praesideo.database.repositories.suppliers.SupplyChainRepository
import earth.praesideo.models.restapi.suppliers.AddSupplyChainDto
import earth.praesideo.models.security.CustomUserDetailsModel
import earth.praesideo.services.CompanyService
import earth.praesideo.services.SuppliersService
import org.junit.jupiter.api.Test
import org.junit.jupiter.api.extension.ExtendWith
import org.mockito.InjectMocks
import org.mockito.Mock
import org.mockito.junit.jupiter.MockitoExtension
import org.springframework.data.domain.PageImpl
import org.springframework.data.domain.PageRequest

import static org.junit.jupiter.api.Assertions.assertEquals
import static org.junit.jupiter.api.Assertions.assertNotNull
import static org.mockito.ArgumentMatchers.any
import static org.mockito.ArgumentMatchers.anyInt
import static org.mockito.Mockito.when

@ExtendWith(MockitoExtension.class)
class SuppliersServiceTest {
    @Mock
    private SupplyChainRepository supplyChainRepository
    @Mock
    private SupplierAllocationRepository supplierAllocationRepository
    @Mock
    private YearRepresentationRepository yearRepresentationRepository
    @Mock
    private CompanyService companyService

    @InjectMocks
    private SuppliersService service

    @Test
    void getSupplyChainsByRepresentationYearAndUser() {
        def companyId = 1
        def yearId = 1
        def year = 2020
        def supplyChain = new SupplyChain()
        def suppliers = Arrays.asList(supplyChain)
        def page = PageRequest.of(0, 1)
        when(yearRepresentationRepository.getById(yearId)).thenReturn(new YearRepresentationEntity(calendarYear: year))
        when(supplyChainRepository.findAllByCustomerCompanyIdAndYearAndDateRemovedIsNull(companyId, year, page)).thenReturn(new PageImpl(suppliers))

        def result = service.getSupplyChainsByRepresentationYearAndUser(companyId, yearId, page)
        assertNotNull result
        assertEquals 1, result.getTotalElements()
    }

    @Test
    void getYearRepresentations() {
        def companyId = 1
        def year = new YearRepresentationEntity()
        def years = Arrays.asList(year)
        when(yearRepresentationRepository.findAllBySupplyChainCustomerId(companyId)).thenReturn(years)

        def result = service.getYearRepresentations(companyId)
        assertNotNull result
        assertEquals 1, result.size()
    }

    @Test
    void selectSuppliers() {
        def userModel = new CustomUserDetailsModel(1, 0, "", "test", "", [], true)
        def query = ""
        def company = new CompanyEntity()
        def companies = Arrays.asList(company)
        def page = PageRequest.of(0, 1)
        when(companyService.selectSuppliers(query, userModel, page)).thenReturn(new PageImpl(companies))

        def result = service.selectSuppliers(query, userModel, page)
        assertNotNull result
        assertEquals 1, result.getTotalElements()
    }

    @Test
    void addSupplier() {
        def userModel = new CustomUserDetailsModel(1, 0, "", "test", "", [], true)
        def supplierId = 1
        def company = new CompanyEntity()
        def supplyChain = new SupplyChain()
        def supplierData = new AddSupplyChainDto(supplierId: supplierId)
        when(companyService.getCompanyEntityById(anyInt())).thenReturn(company)
        when(supplyChainRepository.save(any(SupplyChain.class))).thenReturn(supplyChain)

        def result = service.addSupplyChain(supplierData.getSupplierId(), supplierData.getSupplierContactEmail(), supplierData.getYearRepresentationId(), supplierData.getStartMonth(), supplierData.getIsFinancialYear(), userModel)
        assertNotNull result
        assertEquals(supplyChain, result)
    }

    @Test
    void addSupplier_whenCompanyNotExists() {
        def userModel = new CustomUserDetailsModel(1, 0, "", "test", "", [], true)
        def supplierId = 1, companyName = "companyName"
        def company = new CompanyEntity(companyId: supplierId, companyName: companyName)
        def supplyChain = new SupplyChain()
        def supplierData = new AddSupplyChainDto(supplierId: supplierId)
        when(companyService.createCompany(companyName)).thenReturn(company)
        when(companyService.getCompanyEntityById(anyInt())).thenReturn(company)
        when(supplyChainRepository.save(any(SupplyChain.class))).thenReturn(supplyChain)

        def result = service.addSupplyChain(companyName, "", supplierData.getYearRepresentationId(), supplierData.getStartMonth(), supplierData.getIsFinancialYear(), userModel)
        assertNotNull result
        assertEquals(supplyChain, result)
    }

    @Test
    void deleteSupplyChain() {
        def supplyChainId = 1
        def userModel = new CustomUserDetailsModel(1, 0, "", "test", "", [], true)
        def supplyChain = new SupplyChain()
        when(supplyChainRepository.findById(anyInt())).thenReturn(Optional.of(supplyChain))
        when(supplyChainRepository.save(any(SupplyChain.class))).thenReturn(supplyChain)

        service.deleteSupplyChain(supplyChainId, userModel)
    }

    @Test
    void getSupplierAllocationsBySupplyChain() {
        def supplyChainId = 1
        when(supplierAllocationRepository.findAllBySupplyChainSupplyChainId(supplyChainId)).thenReturn(Arrays.asList(new SupplierAllocation()))

        def result = service.getSupplierAllocationsBySupplyChain(supplyChainId)
        assertNotNull result
        assertEquals 1, result.size()
    }

    @Test
    void addSupplierAllocation() {
        def supplyChainId = 1
        def allocation = new SupplierAllocation()
        when(supplyChainRepository.findById(supplyChainId)).thenReturn(Optional.of(new SupplyChain()))
        when(supplierAllocationRepository.save(any(SupplierAllocation))).thenReturn(allocation)

        service.addSupplierAllocation(supplyChainId, allocation)
    }
}
