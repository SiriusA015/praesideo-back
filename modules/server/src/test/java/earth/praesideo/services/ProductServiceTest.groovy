package earth.praesideo.services

import earth.praesideo.database.entities.products.Product
import earth.praesideo.database.entities.products.ProductSubscription
import earth.praesideo.database.entities.products.ProductVariant
import earth.praesideo.database.entities.users.CompanyEntity
import earth.praesideo.database.repositories.products.ProductRepository
import earth.praesideo.database.repositories.products.ProductSubscriptionRepository
import earth.praesideo.database.repositories.products.ProductVariantRepository
import org.junit.jupiter.api.Test
import org.junit.jupiter.api.extension.ExtendWith
import org.mockito.InjectMocks
import org.mockito.Mock
import org.mockito.junit.jupiter.MockitoExtension

import static org.junit.jupiter.api.Assertions.assertNotNull
import static org.mockito.ArgumentMatchers.any
import static org.mockito.ArgumentMatchers.anyInt
import static org.mockito.Mockito.when

@ExtendWith(MockitoExtension.class)
class ProductServiceTest {

    @Mock
    private ProductRepository productRepository
    @Mock
    private ProductVariantRepository productVariantRepository
    @Mock
    private ProductSubscriptionRepository productSubscriptionRepository
    @Mock
    private CompanyService companyService

    @InjectMocks
    private ProductService service

    @Test
    void getProducts() {
        def product = new Product()
        def productList = Arrays.asList(product)
        when(productRepository.findAll()).thenReturn(productList)

        def result = service.getProducts()
        assertNotNull result
    }

    @Test
    void getProductVariantByProductId() {
        def productVariant = new ProductVariant()
        def productVariantList = Arrays.asList(productVariant)
        when(productVariantRepository.findAllByProductId(anyInt())).thenReturn(productVariantList)

        def result = service.getProductVariantByProductId(1)
        assertNotNull result
    }

    @Test
    void subscribe() {
        def variant = new ProductVariant()
        def company = new CompanyEntity()
        def subscription = new ProductSubscription()
        subscription.setCompany(company)
        subscription.setProductVariant(variant)

        when(productSubscriptionRepository.findByCompanyCompanyIdAndEndDateIsNull(anyInt())).thenReturn(Optional.of(subscription))
        when(companyService.getCompanyEntityById(anyInt())).thenReturn(company)
        when(productVariantRepository.getById(anyInt())).thenReturn(variant)
        when(productSubscriptionRepository.save(any(ProductSubscription))).thenReturn(subscription)

        def result = service.subscribe(1, 1)
        assertNotNull result
    }
}
