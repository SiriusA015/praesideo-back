package earth.praesideo.controllers.common;

import earth.praesideo.controllers.BaseController;
import earth.praesideo.database.entities.common.BaseCurrencyEntity;
import earth.praesideo.database.repositories.common.BaseCurrencyRepository;
import earth.praesideo.services.scheduled.UpdateCurrenciesService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/api/common")
public class BaseCurrencyRestController extends BaseController {
    private static final Logger LOGGER = LoggerFactory.getLogger(BaseCurrencyRestController.class);
    @Autowired
    private BaseCurrencyRepository  baseCurrencyRepository;
    @Autowired
    private UpdateCurrenciesService updateCurrenciesService;

    public BaseCurrencyRestController() {
        LOGGER.info("{} created.", this.getClass().getSimpleName());
    }

    @GetMapping("/base-currency/list")
    public ResponseEntity<List<BaseCurrencyEntity>> retrieve() {
        return ResponseEntity.ok(baseCurrencyRepository.findAllByOrderByOrderingAsc());
    }

    @PostMapping("/base-currency/update")
    public ResponseEntity<Void> update() {
        updateCurrenciesService.updateCurrencies();
        return new ResponseEntity<>(HttpStatus.OK);
    }
}
