package earth.praesideo.controllers

import earth.praesideo.controllers.suppliers.SuppliersDictionariesRestController
import earth.praesideo.database.entities.suppliers.SupplierCategory
import earth.praesideo.database.entities.suppliers.SupplierInvitationStatus
import earth.praesideo.database.entities.suppliers.SupplierType
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
import org.springframework.http.HttpStatus

import static org.junit.jupiter.api.Assertions.assertEquals
import static org.junit.jupiter.api.Assertions.assertNotNull
import static org.mockito.Mockito.when

@ExtendWith(MockitoExtension.class)
@MockitoSettings(strictness = Strictness.LENIENT)
class SuppliersDictionariesRestControllerTest {

    @Mock
    private SuppliersService service
    @Mock
    private ModelMapper mapper

    @Spy
    @InjectMocks
    private SuppliersDictionariesRestController controller

    @Test
    void getSupplierCategories() {
        def category = new SupplierCategory()
        def supplierCategories = Arrays.asList(category)
        when(service.getSupplierCategories()).thenReturn(supplierCategories)

        def result = controller.getSupplierCategories()
        assertNotNull result
        assertEquals HttpStatus.OK, result.getStatusCode()
    }

    @Test
    void getSupplierTypes() {
        def supplierType = new SupplierType()
        def supplierTypes = Arrays.asList(supplierType)
        when(service.getSupplierTypes()).thenReturn(supplierTypes)

        def result = controller.getSupplierTypes()
        assertNotNull result
        assertEquals HttpStatus.OK, result.getStatusCode()
    }

    @Test
    void getSupplierInvitationStatuses() {
        def supplierInvitationStatus = new SupplierInvitationStatus()
        def supplierInvitationStatuses = Arrays.asList(supplierInvitationStatus)
        when(service.getSupplierInvitationStatuses()).thenReturn(supplierInvitationStatuses)

        def result = controller.getSupplierInvitationStatuses()
        assertNotNull result
        assertEquals HttpStatus.OK, result.getStatusCode()
    }
}
