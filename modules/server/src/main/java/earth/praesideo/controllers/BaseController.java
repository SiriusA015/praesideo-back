package earth.praesideo.controllers;

import earth.praesideo.models.restapi.general.DefaultErrorApiModel;
import earth.praesideo.models.security.CustomUserDetailsModel;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.validation.BindingResult;

import java.util.Optional;
import java.util.stream.Collectors;

public abstract class BaseController {

    protected DefaultErrorApiModel getApiReturnErrorObject(BindingResult bindingResult) {
        return new DefaultErrorApiModel(
                bindingResult.getFieldErrors()
                        .stream().map(e -> e.getField()+" "+e.getDefaultMessage())
                        .collect(Collectors.joining(", ")));
    }

    protected DefaultErrorApiModel getApiReturnErrorObject(String message) {
        return new DefaultErrorApiModel(message);
    }

    public Optional<CustomUserDetailsModel> getLoggedInUser() {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        if(null != auth && auth.getPrincipal() instanceof CustomUserDetailsModel) {
            CustomUserDetailsModel user = (CustomUserDetailsModel)auth.getPrincipal();
            return Optional.of(user);
        }
        return Optional.empty();
    }
}
