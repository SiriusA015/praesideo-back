package earth.praesideo.controllers.common;

import earth.praesideo.controllers.BaseController;
import earth.praesideo.database.entities.common.HomeStockExchangeEntity;
import earth.praesideo.database.repositories.common.HomeStockExchangeRepository;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/api/common")
public class HomeStockExchangeRestController extends BaseController {
    private static final Logger LOGGER = LoggerFactory.getLogger(HomeStockExchangeRestController.class);
    @Autowired
    private HomeStockExchangeRepository homeStockExchangeRepository;

    public HomeStockExchangeRestController() {
        LOGGER.info(this.getClass().getSimpleName() + " created.");
    }

    @GetMapping("/home-stock-exchange/list")
    public ResponseEntity<List<HomeStockExchangeEntity>> retrieve() {
        return ResponseEntity.ok(homeStockExchangeRepository.findAll());
    }
}
