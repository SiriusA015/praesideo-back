package earth.praesideo.database.entities.impactperformance;

import lombok.Data;
import lombok.experimental.Accessors;

import javax.persistence.*;
import java.util.Date;

@Entity
@Table(name = "t_impact_temperature_alignment", schema = "impact")
@Data
@Accessors(chain = true)
public class ImpactTemperatureAlignment {

    @EmbeddedId
    private ImpactTemperatureAlignmentKey key;

    @Embedded
    @AttributeOverride( name = "overall", column = @Column(name = "temperature_alignment_score_overall"))
    @AttributeOverride( name = "scope1", column = @Column(name = "temperature_score_overall_scope_1"))
    @AttributeOverride( name = "scope2", column = @Column(name = "temperature_score_overall_scope_2"))
    @AttributeOverride( name = "scope3", column = @Column(name = "temperature_score_overall_scope_3"))
    private TemperatureAlignmentScore temperatureAlignmentScore;

    @Embedded
    @AttributeOverride( name = "overall", column = @Column(name = "probability_1_5_degree"))
    @AttributeOverride( name = "scope1", column = @Column(name = "probability_1_5_degree_scope_1"))
    @AttributeOverride( name = "scope2", column = @Column(name = "probability_1_5_degree_scope_2"))
    @AttributeOverride( name = "scope3", column = @Column(name = "probability_1_5_degree_scope_3"))
    private TemperatureAlignmentScore probabilityOneDotFiveDegree;

    @Embedded
    @AttributeOverride( name = "overall", column = @Column(name = "probability_2_degree"))
    @AttributeOverride( name = "scope1", column = @Column(name = "probablity_2_degree_scope_1"))
    @AttributeOverride( name = "scope2", column = @Column(name = "probablity_2_degree_scope_2"))
    @AttributeOverride( name = "scope3", column = @Column(name = "probablity_2_degree_scope_3"))
    private TemperatureAlignmentScore probabilityTwoDegree;

    @Embedded
    @AttributeOverride( name = "baselineValue", column = @Column(name = "transition_pathway_overall_baseline_value"))
    @AttributeOverride( name = "oneDotFiveDegreeShortTerm", column = @Column(name = "transition_pathway_overall_1_5_short_term"))
    @AttributeOverride( name = "oneDotFiveDegreeLongTerm", column = @Column(name = "transition_pathway_overall_1_5_long_term"))
    @AttributeOverride( name = "twoDegreeShortTerm", column = @Column(name = "transition_pathway_overall_2_short_term"))
    @AttributeOverride( name = "twoDegreeLongTerm", column = @Column(name = "transition_pathway_overall_2_long_term"))
    @AttributeOverride( name = "actualShortTerm", column = @Column(name = "transition_pathway_overall_actual_short_term"))
    @AttributeOverride( name = "actualLongTerm", column = @Column(name = "transition_pathway_overall_actual_long_term"))
    private TransitionPathway overall;

    @Embedded
    @AttributeOverride( name = "baselineValue", column = @Column(name = "scope1_baseline_value"))
    @AttributeOverride( name = "oneDotFiveDegreeShortTerm", column = @Column(name = "scope1_1_5_short_term"))
    @AttributeOverride( name = "oneDotFiveDegreeLongTerm", column = @Column(name = "scope1_1_5_long_term"))
    @AttributeOverride( name = "twoDegreeShortTerm", column = @Column(name = "scope1_2_short_term"))
    @AttributeOverride( name = "twoDegreeLongTerm", column = @Column(name = "scope1_2_long_term"))
    @AttributeOverride( name = "actualShortTerm", column = @Column(name = "scope1_actual_short_term"))
    @AttributeOverride( name = "actualLongTerm", column = @Column(name = "scope1_actual_long_term"))
    private TransitionPathway scope1;

    @Embedded
    @AttributeOverride( name = "baselineValue", column = @Column(name = "scope2_baseline_value"))
    @AttributeOverride( name = "oneDotFiveDegreeShortTerm", column = @Column(name = "scope2_1_5_short_term"))
    @AttributeOverride( name = "oneDotFiveDegreeLongTerm", column = @Column(name = "scope2_1_5_long_term"))
    @AttributeOverride( name = "twoDegreeShortTerm", column = @Column(name = "scope2_2_short_term"))
    @AttributeOverride( name = "twoDegreeLongTerm", column = @Column(name = "scope2_2_long_term"))
    @AttributeOverride( name = "actualShortTerm", column = @Column(name = "scope2_actual_short_term"))
    @AttributeOverride( name = "actualLongTerm", column = @Column(name = "scope2_actual_long_term"))
    private TransitionPathway scope2;

    @Embedded
    @AttributeOverride( name = "baselineValue", column = @Column(name = "scope3_baseline_value"))
    @AttributeOverride( name = "oneDotFiveDegreeShortTerm", column = @Column(name = "scope3_1_5_short_term"))
    @AttributeOverride( name = "oneDotFiveDegreeLongTerm", column = @Column(name = "scope3_1_5_long_term"))
    @AttributeOverride( name = "twoDegreeShortTerm", column = @Column(name = "scope3_2_short_term"))
    @AttributeOverride( name = "twoDegreeLongTerm", column = @Column(name = "scope3_2_long_term"))
    @AttributeOverride( name = "actualShortTerm", column = @Column(name = "scope3_actual_short_term"))
    @AttributeOverride( name = "actualLongTerm", column = @Column(name = "scope3_actual_long_term"))
    private TransitionPathway scope3;

    @Column(name = "last_calculation_date")
    private Date lastCalculationDate;

}
