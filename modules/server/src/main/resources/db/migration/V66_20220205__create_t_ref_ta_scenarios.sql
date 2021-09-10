CREATE TABLE IF NOT EXISTS static.t_ref_ta_scenarios
(
    scenario_id smallint NOT NULL,
    name character varying COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT t_ref_ta_scenarios_pkey PRIMARY KEY (scenario_id)
    );
CREATE TABLE IF NOT EXISTS static.t_ref_ta_files
(
    scenario_source character varying COLLATE pg_catalog."default" NOT NULL,
    filter character varying COLLATE pg_catalog."default" NOT NULL,
    name character varying COLLATE pg_catalog."default" NOT NULL,
    content text COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT t_ref_ta_files_pkey PRIMARY KEY (scenario_source, filter, name)
    );
CREATE TABLE IF NOT EXISTS static.t_ref_ta_kyoto_emissions
(
    scenario_id smallint NOT NULL,
    year smallint NOT NULL,
    value double precision NOT NULL,
    is_interp boolean NOT NULL,
    CONSTRAINT t_ref_ta_kyoto_emissions_pkey PRIMARY KEY (scenario_id, year),
    CONSTRAINT t_ref_ta_kyoto_emissions_scenario_id_fkey FOREIGN KEY (scenario_id)
    REFERENCES static.t_ref_ta_scenarios (scenario_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    );
CREATE TABLE IF NOT EXISTS static.t_ref_ta_prob_target_15
(
    scenario_id smallint NOT NULL,
    year smallint NOT NULL,
    value double precision NOT NULL,
    CONSTRAINT t_ref_ta_prob_target_15_pkey PRIMARY KEY (scenario_id, year),
    CONSTRAINT t_ref_ta_prob_target_15_scenario_id_fkey FOREIGN KEY (scenario_id)
    REFERENCES static.t_ref_ta_scenarios (scenario_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    );
CREATE TABLE IF NOT EXISTS static.t_ref_ta_prob_target_20
(
    scenario_id smallint NOT NULL,
    year smallint NOT NULL,
    value double precision NOT NULL,
    CONSTRAINT t_ref_ta_prob_target_20_pkey PRIMARY KEY (scenario_id, year),
    CONSTRAINT t_ref_ta_prob_target_20_scenario_id_fkey FOREIGN KEY (scenario_id)
    REFERENCES static.t_ref_ta_scenarios (scenario_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    );
CREATE TABLE IF NOT EXISTS static.t_ref_ta_scenario_filters
(
    id smallint NOT NULL,
    scenario character varying COLLATE pg_catalog."default" NOT NULL,
    min_peak_year boolean NOT NULL,
    negative_emissions_th boolean NOT NULL,
    co2_error_th boolean NOT NULL,
    CONSTRAINT t_ref_ta_scenario_filters_pkey PRIMARY KEY (id)
    );

CREATE TABLE IF NOT EXISTS static.t_ref_ta_temp_2100
(
    scenario_id smallint NOT NULL,
    year smallint NOT NULL,
    value double precision NOT NULL,
    CONSTRAINT t_ref_ta_temp_2100_pkey PRIMARY KEY (scenario_id, year),
    CONSTRAINT t_ref_ta_temp_2100_scenario_id_fkey FOREIGN KEY (scenario_id)
    REFERENCES static.t_ref_ta_scenarios (scenario_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    );
