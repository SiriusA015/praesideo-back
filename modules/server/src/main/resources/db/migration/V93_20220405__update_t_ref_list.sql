update static.t_ref_list set list_value='tCO2e' where list_value='tCO2' and list_key='impactm_measurement_unit';

alter table static.t_ref_config_emissions_type alter column etype_id set not null;
alter table static.t_ref_config_emissions_type alter column etypeattr_id1 set not null;
alter table static.t_ref_config_emissions_type alter column etype_unit_id1 set not null;
alter table static.t_ref_config_emissions_type alter column etype_unit_id2 set not null;
ALTER TABLE static.t_ref_config_emissions_unit_factor ALTER COLUMN config_emission_type_id 	SET NOT NULL;
ALTER TABLE static.t_ref_config_emissions_unit_factor ALTER COLUMN etype_unit_id1 		SET NOT NULL;
ALTER TABLE static.t_ref_config_emissions_unit_factor ALTER COLUMN etype_unit_id2 		SET NOT NULL;
ALTER TABLE static.t_ref_config_emissions_unit_factor ALTER COLUMN etype_unit_factor1 	SET NOT NULL;
ALTER TABLE static.t_ref_config_emissions_unit_factor ALTER COLUMN etype_unit_factor2 	SET NOT NULL;
ALTER TABLE static.t_ref_config_emissions_factor ALTER COLUMN config_etype_id SET NOT NULL;

DROP INDEX IF EXISTS unique_t_ref_config_emissions_type_1 CASCADE;
DROP INDEX IF EXISTS unique_t_ref_config_emissions_type_2 CASCADE;
CREATE UNIQUE INDEX unique_t_ref_config_emissions_type_1 ON static.t_ref_config_emissions_type (etype_id,etypeattr_id1) WHERE (etype_id!=44);
CREATE UNIQUE INDEX unique_t_ref_config_emissions_type_2 ON static.t_ref_config_emissions_type (etype_id,etypeattr_id1,etypeattr_id2) WHERE (etype_id=44);

DROP INDEX IF EXISTS unique_t_ref_config_emissions_unit_factor_1 CASCADE;
CREATE UNIQUE INDEX unique_t_ref_config_emissions_unit_factor_1 ON static.t_ref_config_emissions_unit_factor (config_emission_type_id,etype_unit_id1);

DROP INDEX IF EXISTS unique_t_ref_config_emissions_factor_1 CASCADE;
CREATE UNIQUE INDEX unique_t_ref_config_emissions_factor_1 ON static.t_ref_config_emissions_factor
    (continent_id,region_id,country_id,state_id,industry_sector_id,industry_subsector_id,config_etype_id,emission_source_id,start_date,end_date);