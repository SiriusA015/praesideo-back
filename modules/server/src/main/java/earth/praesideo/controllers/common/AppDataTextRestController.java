package earth.praesideo.controllers.common;

import earth.praesideo.controllers.BaseController;
import earth.praesideo.database.entities.common.CommonTextEntity;
import earth.praesideo.database.entities.suppliers.SupplierAllocation;
import earth.praesideo.database.repositories.common.CommonTextRepository;
import earth.praesideo.models.restapi.general.AppDataTextApiModel;
import earth.praesideo.models.restapi.suppliers.SupplierAllocationDto;
import earth.praesideo.services.tech.AppDataTextService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.*;

import java.util.Optional;

import java.util.List;

@RestController
@RequestMapping("/api")
public class AppDataTextRestController extends BaseController {

    private final CommonTextRepository commonTextRepository;
    private final AppDataTextService service;

    @Autowired
    public AppDataTextRestController(CommonTextRepository commonTextRepository, AppDataTextService appDataTextService ) {
        this.commonTextRepository = commonTextRepository;
        this.service = appDataTextService;
    }

    @GetMapping("/public/appdatatext/list")
    public ResponseEntity<List<CommonTextEntity>> retrieveAll() {
        return ResponseEntity.ok(commonTextRepository.findAll());
    }

    @GetMapping("/appdatatext/retrievebyid")
    public ResponseEntity<Optional<CommonTextEntity>> retrieveById(@RequestParam(name = "id") Integer id) {
        return ResponseEntity.ok(commonTextRepository.findById(id));
    }

    @GetMapping("/appdatatext/retrievebytextkey")
    public ResponseEntity<List<CommonTextEntity>> retrieveByTextKey(@RequestParam(name = "textkey") String textkey) {
        return ResponseEntity.ok(commonTextRepository.findByTextKey(textkey));
    }

    @PostMapping("/appdatatext/save")
    public ResponseEntity<Void> addAppDataText( @RequestBody AppDataTextApiModel request) {
        service.addAppDataText(request);
        return new ResponseEntity<>(HttpStatus.OK);
    }
    @PutMapping("/appdatatext/update")
    public ResponseEntity<CommonTextEntity> updateAppDataText( @RequestBody AppDataTextApiModel request) {
       CommonTextEntity updatedCte = service.updateAppDataText(request);
        return ResponseEntity.ok(updatedCte);
    }
    @DeleteMapping("/appdatatext/delete")
    public ResponseEntity<Void> deleteAppDataText(@RequestParam(name = "id") Integer id) {
        service.deleteAppDataText(id);
        return new ResponseEntity<>(HttpStatus.OK);
    }
}
