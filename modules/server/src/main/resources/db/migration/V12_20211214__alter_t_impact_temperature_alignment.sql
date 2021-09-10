
ALTER TABLE IF EXISTS impact.t_impact_temperature_alignment
    DROP COLUMN IF EXISTS probability_1_5_degree_type,
    DROP COLUMN IF EXISTS probability_1_5_degree_scope_1_type,
    DROP COLUMN IF EXISTS probability_1_5_degree_scope_2_type,
    DROP COLUMN IF EXISTS probability_1_5_degree_scope_3_type,
    DROP COLUMN IF EXISTS probability_2_degree_type,
    DROP COLUMN IF EXISTS probablity_2_degree_scope_1_type,
    DROP COLUMN IF EXISTS probablity_2_degree_scope_2_type,
    DROP COLUMN IF EXISTS probablity_2_degree_scope_3_type,
    DROP COLUMN IF EXISTS temperature_alignment_score_overall_type,
    DROP COLUMN IF EXISTS temperature_score_overall_scope_1_type,
    DROP COLUMN IF EXISTS temperature_score_overall_scope_2_type,
    DROP COLUMN IF EXISTS temperature_score_overall_scope_3_type,
    ADD COLUMN is_scenario INT not null DEFAULT 0;

ALTER TABLE IF EXISTS impact.t_impact_temperature_alignment DROP CONSTRAINT t_impact_temperature_alignment_pkey;
ALTER TABLE IF EXISTS impact.t_impact_temperature_alignment ADD PRIMARY KEY (company_id, record_type, year, is_scenario);
