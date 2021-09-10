package earth.praesideo.database.entities.impactperformance;

import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.Embeddable;

@Embeddable
@NoArgsConstructor
@Data
public class TransitionPathway {

    private Double baselineValue;

    private Double oneDotFiveDegreeShortTerm;

    private Double oneDotFiveDegreeLongTerm;

    private Double twoDegreeShortTerm;

    private Double twoDegreeLongTerm;

    private Double actualShortTerm;

    private Double actualLongTerm;
}
