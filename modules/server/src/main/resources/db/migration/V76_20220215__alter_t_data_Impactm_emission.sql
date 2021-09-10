alter table impact.t_data_impactm_emission DROP CONSTRAINT IF EXISTS unique_t_data_impactm_emission_1;
alter table impact.t_data_impactm_emission ADD CONSTRAINT unique_t_data_impactm_emission_1 UNIQUE
    (company_id,year_representation_id);
