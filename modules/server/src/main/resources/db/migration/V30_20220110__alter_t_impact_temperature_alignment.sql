
ALTER TABLE IF EXISTS impact.t_impact_temperature_alignment
    ALTER COLUMN is_scenario DROP DEFAULT;
ALTER TABLE IF EXISTS impact.t_impact_temperature_alignment
    ALTER is_scenario TYPE boolean USING CASE WHEN is_scenario=0 THEN FALSE ELSE TRUE END;
ALTER TABLE IF EXISTS impact.t_impact_temperature_alignment
    ALTER COLUMN is_scenario SET DEFAULT FALSE;

ALTER TABLE IF EXISTS impact.t_impact_temperature_alignment
    ADD COLUMN IF NOT EXISTS is_supplychain_aggregated boolean DEFAULT FALSE;

ALTER TABLE IF EXISTS impact.t_impact_temperature_alignment
    DROP CONSTRAINT t_impact_temperature_alignment_pkey;
ALTER TABLE IF EXISTS impact.t_impact_temperature_alignment
    ADD PRIMARY KEY (company_id, record_type, year, is_scenario, is_supplychain_aggregated);
