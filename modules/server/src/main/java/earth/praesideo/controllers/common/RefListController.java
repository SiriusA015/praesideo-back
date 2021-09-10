package earth.praesideo.controllers.common;

import earth.praesideo.controllers.BaseController;
import earth.praesideo.database.entities.common.RefListEntity;
import earth.praesideo.database.repositories.common.RefListRepository;
import earth.praesideo.exceptions.ApiException;
import earth.praesideo.exceptions.ExceptionContent;
import earth.praesideo.models.restapi.BaseApiModel;
import earth.praesideo.models.restapi.general.DefaultErrorApiModel;
import earth.praesideo.models.restapi.general.RefListModel;
import earth.praesideo.services.ref.RefListService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.Comparator;
import java.util.List;
import java.util.Locale;

@RestController
@RequestMapping("/api/common")
public class RefListController extends BaseController {
    private static final Logger LOGGER = LoggerFactory.getLogger(RefListController.class);
    private final RefListService refListService;
    private final RefListRepository refListRepository;

    @Autowired
    public RefListController(RefListService refListService, RefListRepository refListRepository) {
        LOGGER.info(this.getClass().getSimpleName() + " created.");
        this.refListService = refListService;
        this.refListRepository = refListRepository;
    }

    @GetMapping("/ref-list/getall")
    public ResponseEntity<List<RefListEntity>> retrieveAll() {
        List<RefListEntity> response = refListRepository.findAll();
        response.sort(new RefListEntityComparer());
        return ResponseEntity.ok(response);
    }

    @GetMapping("/ref-list/getbylistkey")
    public ResponseEntity<List<RefListEntity>> retrieveByListKey(@RequestParam(name = "listKey") String listKey) {
        List<RefListEntity> response = refListRepository.findByListKeyIgnoreCase(listKey);
        response.sort(new RefListEntityComparer());
        return ResponseEntity.ok(response);
    }

    @PostMapping("/ref-list/add")
    public ResponseEntity<BaseApiModel> addNewRefListValue(@RequestBody RefListModel request) {
        try {
            var user = getLoggedInUser().orElseThrow(() -> new ApiException(ExceptionContent.USER_NOT_FOUND, HttpStatus.BAD_REQUEST));
            refListService.addNewRefListValue(user, request.getListKey(), request.getListValue());
            return new ResponseEntity<>(HttpStatus.CREATED);
        } catch (Exception ex) {
            LOGGER.error(ex.getMessage());
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(new DefaultErrorApiModel(ex.getMessage()));
        }
    }

    private class RefListEntityComparer implements Comparator<RefListEntity> {
        @Override
        public int compare(RefListEntity r1, RefListEntity r2) {
            int result = r1.getListKey().compareTo(r2.getListKey());
            if (result == 0) {
                if (r1.getListValue() == null) {
                    result = -1;
                }
                if (r2.getListValue() == null) {
                    result = 1;
                }
                if (r1.getListValue() != null && r2.getListValue() != null) {
                    result = r1.getListValue().toLowerCase(Locale.ROOT).compareTo(r2.getListValue().toLowerCase(Locale.ROOT));
                }
            }
            return result;
        }
    }

}
