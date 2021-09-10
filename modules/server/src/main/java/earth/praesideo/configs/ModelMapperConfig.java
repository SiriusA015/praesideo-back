package earth.praesideo.configs;

import earth.praesideo.services.mapper.ModelMapperFactory;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.modelmapper.ModelMapper;

/**
 * @author Koshman Vadim
 */
@Configuration
public class ModelMapperConfig {

    private final ModelMapperFactory modelMapperFactory;

    public ModelMapperConfig(ModelMapperFactory modelMapperFactory) {
        this.modelMapperFactory = modelMapperFactory;
    }


    @Bean
    public ModelMapper modelMapper() {
        return modelMapperFactory.createMapper();
    }
}
