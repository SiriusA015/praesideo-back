package earth.praesideo.controllers;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/public/healthcheck")
public final class HealthCheckRestController {

    @GetMapping
    public ResponseEntity<Void> check() {
        return new ResponseEntity<>(HttpStatus.OK);
    }
}
