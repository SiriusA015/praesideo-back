package earth.praesideo.controllers

import earth.praesideo.controllers.products.ProductRestController
import earth.praesideo.database.entities.products.Product
import earth.praesideo.database.entities.products.ProductSubscription
import earth.praesideo.database.entities.products.ProductVariant
import earth.praesideo.database.entities.users.CompanyEntity
import earth.praesideo.models.restapi.products.ProductSubscriptionDto
import earth.praesideo.models.security.CustomUserDetailsModel
import earth.praesideo.services.ProductService
import org.junit.jupiter.api.Test
import org.junit.jupiter.api.extension.ExtendWith
import org.mockito.InjectMocks
import org.mockito.Mock
import org.mockito.Spy
import org.mockito.junit.jupiter.MockitoExtension
import org.mockito.junit.jupiter.MockitoSettings
import org.mockito.quality.Strictness
import org.modelmapper.ModelMapper

import static org.junit.jupiter.api.Assertions.assertNotNull
import static org.mockito.ArgumentMatchers.anyInt
import static org.mockito.Mockito.doReturn
import static org.mockito.Mockito.when

@ExtendWith(MockitoExtension.class)
@MockitoSettings(strictness = Strictness.LENIENT)
class ProductRestControllerTest {

    @Mock
    private ProductService service
    @Mock
    private ModelMapper mapper

    @Spy
    @InjectMocks
    private ProductRestController controller

    @Test
    void getProducts() {
        def product = new Product()
        def productList = Arrays.asList(product)
        when(service.getProducts()).thenReturn(productList)

        def result = controller.getProducts()
        assertNotNull result
    }

    @Test
    void getProductVariantByProductId() {
        def productVariant = new ProductVariant()
        def productVariantList = Arrays.asList(productVariant)
        when(service.getProductVariantByProductId(anyInt())).thenReturn(productVariantList)

        def result = controller.getProductVariantByProductId(1)
        assertNotNull result
    }

    @Test
    void subscribe() {
        def userModel = new CustomUserDetailsModel(1, 0, "", "test", "", [], true)
        doReturn(Optional.of(userModel)).when(controller).getLoggedInUser()
        def subscription = new ProductSubscription(company: new CompanyEntity(), productVariant: new ProductVariant())
        when(service.subscribe(anyInt(), anyInt())).thenReturn(subscription)
        when(mapper.map(subscription, ProductSubscriptionDto.class)).thenReturn(new ProductSubscriptionDto())

        def result = controller.subscribe(1)
        assertNotNull result
    }
}
