package earth.praesideo.controllers.products;

import earth.praesideo.controllers.BaseController;
import earth.praesideo.database.entities.products.ProductSubscription;
import earth.praesideo.exceptions.ApiException;
import earth.praesideo.exceptions.ExceptionContent;
import earth.praesideo.models.restapi.products.ProductDto;
import earth.praesideo.models.restapi.products.ProductSubscriptionDto;
import earth.praesideo.models.restapi.products.ProductVariantDto;
import earth.praesideo.services.ProductService;
import lombok.AllArgsConstructor;
import org.modelmapper.ModelMapper;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

@AllArgsConstructor
@RestController
@RequestMapping("/api/settings/products")
public class ProductRestController extends BaseController {

    private final ProductService service;
    private final ModelMapper    mapper;

    @GetMapping
    public List<ProductDto> getProducts() {
        return service.getProducts().stream().map(p -> mapper.map(p, ProductDto.class)).collect(Collectors.toList());
    }

    @GetMapping("/{productId}/variants")
    public List<ProductVariantDto> getProductVariantByProductId(@PathVariable("productId") final Integer productId) {
        return service.getProductVariantByProductId(productId).stream().map(p -> mapper.map(p, ProductVariantDto.class)).collect(Collectors.toList());
    }

    @ResponseStatus(HttpStatus.OK)
    @GetMapping("/variants/subscription/{companyId}")
    public ResponseEntity<ProductSubscriptionDto> getProductSubscriptionByCompanyId(@PathVariable("companyId") final Integer companyId) {
        Optional<ProductSubscription> productSubscription = service.getProductSubscriptionByCompanyId(companyId);
        return productSubscription
                .map(subscription -> {
                    ProductSubscriptionDto productSubscriptionDto = mapper.map(subscription, ProductSubscriptionDto.class);
                    productSubscriptionDto.setCompanyId(subscription.getCompany().getCompanyId());
                    productSubscriptionDto.setProductVariantId(subscription.getProductVariant().getId());
                    productSubscriptionDto.setProductVariantName(subscription.getProductVariant().getName());
                    return ResponseEntity.ok(productSubscriptionDto);
                })
                .orElseGet(() -> new ResponseEntity<>(HttpStatus.NO_CONTENT));
    }

    @PostMapping("/variants/{productVariantId}/subscribe")
    public ResponseEntity<ProductSubscriptionDto> subscribe(@PathVariable("productVariantId") final Integer productVariantId) {
        var user = getLoggedInUser().orElseThrow(() -> new ApiException(ExceptionContent.USER_NOT_FOUND, HttpStatus.BAD_REQUEST));
        var productSubscription = service.subscribe(productVariantId, user.getCompanyId());
        return Optional.of(productSubscription)
                .map(subscription -> {
                    ProductSubscriptionDto productSubscriptionDto = mapper.map(subscription, ProductSubscriptionDto.class);
                    productSubscriptionDto.setCompanyId(subscription.getCompany().getCompanyId());
                    productSubscriptionDto.setProductVariantId(subscription.getProductVariant().getId());
                    productSubscriptionDto.setProductVariantName(subscription.getProductVariant().getName());
                    return ResponseEntity.ok(productSubscriptionDto);
                })
                .orElseGet(() -> new ResponseEntity<>(HttpStatus.NO_CONTENT));
    }
}
