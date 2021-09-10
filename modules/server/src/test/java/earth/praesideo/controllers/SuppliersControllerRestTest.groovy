package earth.praesideo.controllers

import earth.praesideo.controllers.suppliers.SuppliersRestController
import earth.praesideo.database.entities.common.YearRepresentationEntity
import earth.praesideo.database.entities.suppliers.SupplierAllocation
import earth.praesideo.database.entities.suppliers.SupplyChain
import earth.praesideo.database.entities.users.CompanyEntity
import earth.praesideo.models.restapi.CompanyGeneralBackgroundModel
import earth.praesideo.models.restapi.suppliers.AddSupplyChainDto
import earth.praesideo.models.restapi.suppliers.SupplierAllocationDto
import earth.praesideo.models.restapi.suppliers.SupplyChainDto
import earth.praesideo.models.security.CustomUserDetailsModel
import earth.praesideo.services.SuppliersService
import org.junit.jupiter.api.Test
import org.junit.jupiter.api.extension.ExtendWith
import org.mockito.InjectMocks
import org.mockito.Mock
import org.mockito.Spy
import org.mockito.junit.jupiter.MockitoExtension
import org.mockito.junit.jupiter.MockitoSettings
import org.mockito.quality.Strictness
import org.modelmapper.ModelMapper
import org.springframework.data.domain.PageImpl
import org.springframework.data.domain.PageRequest
import org.springframework.http.HttpStatus

import static org.junit.jupiter.api.Assertions.assertEquals
import static org.junit.jupiter.api.Assertions.assertNotNull
import static org.mockito.ArgumentMatchers.anyInt
import static org.mockito.Mockito.doReturn
import static org.mockito.Mockito.verify
import static org.mockito.Mockito.when

@ExtendWith(MockitoExtension.class)
@MockitoSettings(strictness = Strictness.LENIENT)
class SuppliersControllerRestTest {

    @Mock
    private SuppliersService service
    @Mock
    private ModelMapper mapper

    @Spy
    @InjectMocks
    private SuppliersRestController controller

    @Test
    void getUserSuppliersByRepresentationYear() {
        def yearId = 1
        def companyId = 1
        def company = new CompanyEntity()
        def supplyChain = new SupplyChain(supplier: company)
        def suppliersList = Arrays.asList(supplyChain)
        def page = PageRequest.of(0, 1)
        when(service.getSupplyChainsByRepresentationYearAndUser(companyId, yearId, page)).thenReturn(new PageImpl(suppliersList))
        when(mapper.map(supplyChain, SupplyChainDto.class)).thenReturn(new SupplyChainDto())

        def result = controller.getUserSuppliersByRepresentationYear(companyId, yearId, page)
        assertNotNull result
        assertEquals HttpStatus.OK, result.getStatusCode()
    }

    @Test
    void getYearRepresentations() {
        def companyId = 1
        when(service.getYearRepresentations(companyId)).thenReturn(Arrays.asList(new YearRepresentationEntity()))

        def result = controller.getYearRepresentations()
        assertNotNull result
        assertEquals HttpStatus.OK, result.getStatusCode()
    }

    @Test
    void selectSuppliers() {
        def userModel = new CustomUserDetailsModel(1, 0, "", "test", "", [], true)
        def query = ""
        def company = new CompanyEntity()
        def companies = Arrays.asList(company)
        def page = PageRequest.of(0, 1)
        doReturn(Optional.of(userModel)).when(controller).getLoggedInUser()
        when(service.selectSuppliers(query, userModel, page)).thenReturn(new PageImpl(companies))
        when(mapper.map(company, CompanyGeneralBackgroundModel.class)).thenReturn(new CompanyGeneralBackgroundModel())

        def result = controller.selectSuppliers(query, page)
        assertNotNull result
        assertEquals HttpStatus.OK, result.getStatusCode()
    }

    @Test
    void addSupplier_whenCompanyExists() {
        def companyId = 1
        def userModel = new CustomUserDetailsModel(1, 0, "", "test", "", [], true)
        doReturn(Optional.of(userModel)).when(controller).getLoggedInUser()

        def result = controller.addSupplier(new AddSupplyChainDto(supplierId: companyId))
        assertNotNull result
        assertEquals HttpStatus.CREATED, result.getStatusCode()
    }

    @Test
    void addSupplier_whenCompanyNotExists() {
        def companyName = "Company Name"
        def userModel = new CustomUserDetailsModel(1, 0, "", "test", "", [], true)
        doReturn(Optional.of(userModel)).when(controller).getLoggedInUser()

        def result = controller.addSupplier(new AddSupplyChainDto(companyName: companyName))
        assertNotNull result
        assertEquals HttpStatus.CREATED, result.getStatusCode()
    }

    @Test
    void deleteSupplier() {
        def userModel = new CustomUserDetailsModel(1, 0, "", "test", "", [], true)
        doReturn(Optional.of(userModel)).when(controller).getLoggedInUser()

        def result = controller.deleteSupplier(1)
        assertNotNull result
        assertEquals HttpStatus.OK, result.getStatusCode()
    }

    @Test
    void getSupplierAllocationsBySupplyChain() {
        def supplyChainId = 1
        def allocation = new SupplierAllocation()
        def supplierAllocationsList = Arrays.asList(allocation)

        when(service.getSupplierAllocationsBySupplyChain(anyInt())).thenReturn(supplierAllocationsList)
        when(mapper.map(allocation, SupplierAllocationDto.class)).thenReturn(new SupplierAllocationDto())

        def result = controller.getSupplierAllocationsBySupplyChain(supplyChainId)
        assertNotNull result
        assertEquals HttpStatus.OK, result.getStatusCode()
    }

    @Test
    void addSupplierAllocation() {
        def supplyChainId = 1
        def dto = new SupplierAllocationDto()
        def allocation = new SupplierAllocation()
        when(mapper.map(dto, SupplierAllocation.class)).thenReturn(allocation)

        controller.addSupplierAllocationBySupplyChain(supplyChainId, dto)
        verify(service).addSupplierAllocation(supplyChainId, allocation)
    }
}
