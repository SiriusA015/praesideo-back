alter table public.t_companies ADD COLUMN IF NOT EXISTS year_representation_id integer;
alter table public.t_companies ADD COLUMN IF NOT EXISTS start_month integer;
alter table public.t_companies ADD COLUMN IF NOT EXISTS is_financial_year boolean;

alter table public.t_companies DROP CONSTRAINT IF EXISTS fk_t_companies_year_representation_id;
alter table public.t_companies add CONSTRAINT fk_t_companies_year_representation_id FOREIGN KEY (year_representation_id) REFERENCES static.t_ref_years (year_representation_id);

