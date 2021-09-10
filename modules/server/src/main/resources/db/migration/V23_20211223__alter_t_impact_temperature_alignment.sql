
ALTER TABLE IF EXISTS impact.t_impact_temperature_alignment
    ADD COLUMN IF NOT EXISTS transition_pathway_overall_baseline_value double precision,
    ADD COLUMN IF NOT EXISTS scope1_baseline_value double precision,
    ADD COLUMN IF NOT EXISTS scope2_baseline_value double precision,
    ADD COLUMN IF NOT EXISTS scope3_baseline_value double precision;
