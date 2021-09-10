package earth.praesideo.controllers.common;

import earth.praesideo.controllers.BaseController;
import earth.praesideo.database.entities.common.HomeStockExchangeZoneEntity;
import earth.praesideo.database.repositories.common.HomeStockExchangeZoneRepository;
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
public class HomeStockExchangeZoneRestController extends BaseController {
    private static final Logger LOGGER = LoggerFactory.getLogger(HomeStockExchangeZoneRestController.class);
    @Autowired
    private HomeStockExchangeZoneRepository homeStockExchangeZoneRepository;

    public HomeStockExchangeZoneRestController() {
        LOGGER.info(this.getClass().getSimpleName() + " created.");
    }

    @GetMapping("/home-stock-exchange-zone/list")
    public ResponseEntity<List<HomeStockExchangeZoneEntity>> retrieve() {
        return ResponseEntity.ok(homeStockExchangeZoneRepository.findAll());
    }
}
