package earth.praesideo.services.mapper;

import org.modelmapper.ModelMapper;
import org.modelmapper.convention.MatchingStrategies;
import org.springframework.stereotype.Service;

import javax.annotation.PostConstruct;

/**
 * @author Koshman Vadim
 */
@Service
public class ModelMapperFactoryImpl implements ModelMapperFactory{
    private ModelMapper modelMapper;

    public ModelMapper createMapper() {
        return modelMapper;
    }

    @PostConstruct
    private ModelMapper createModelMapper() {
        modelMapper = new ModelMapper();
        modelMapper.getConfiguration().setMatchingStrategy(MatchingStrategies.STRICT);

        return modelMapper;
    }
}
