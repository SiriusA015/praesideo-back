ALTER TABLE impact.t_data_emissions_reduction_target
    DROP COLUMN IF EXISTS is_assumed_substitution,
    DROP COLUMN IF EXISTS target_reduction_short_term_plan1,
    DROP COLUMN IF EXISTS target_reduction_short_term_plan2,
    DROP COLUMN IF EXISTS target_reduction_short_term_plan3,
    DROP COLUMN IF EXISTS target_reduction_short_term_plan4;
