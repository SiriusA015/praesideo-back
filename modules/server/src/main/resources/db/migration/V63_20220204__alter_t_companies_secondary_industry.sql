
alter table public.t_companies_secondary_industry ADD COLUMN IF NOT EXISTS country_id integer;
alter table public.t_companies_secondary_industry DROP CONSTRAINT IF EXISTS fk_t_companies_secondary_industry_country_id;
alter table public.t_companies_secondary_industry add CONSTRAINT fk_t_companies_secondary_industry_country_id FOREIGN KEY (country_id) REFERENCES static.t_ref_countries (id);