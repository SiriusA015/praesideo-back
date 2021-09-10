ALTER TABLE impact.t_data_recent_year_emissions
    ADD CONSTRAINT uq_data_recent_year_emissions UNIQUE (company_id, year_representation_id);
