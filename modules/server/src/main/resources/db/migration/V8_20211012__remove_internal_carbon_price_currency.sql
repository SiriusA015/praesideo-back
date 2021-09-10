ALTER TABLE impact.t_data_climate_mechanisms_influence DROP internal_carbon_price_currency_id,
ADD COLUMN base_currency_id INTEGER,
ADD CONSTRAINT fk_t_data_climate_mechanisms_influence_base_currency
   FOREIGN KEY (base_currency_id)
   REFERENCES static.t_ref_base_currency(base_currency_id);

DROP TABLE IF EXISTS internal_carbon_price_currency;
