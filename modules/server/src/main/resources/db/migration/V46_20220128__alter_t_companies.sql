alter table public.t_companies ADD COLUMN IF NOT EXISTS country_code VARCHAR(3);
alter table public.t_companies ADD COLUMN IF NOT EXISTS state_code VARCHAR(3);
alter table public.t_companies ADD COLUMN IF NOT EXISTS state VARCHAR(200);

alter table public.t_company_facilities ADD COLUMN IF NOT EXISTS facility_state_code VARCHAR(3);
alter table public.t_company_facilities ADD COLUMN IF NOT EXISTS facility_country_code VARCHAR(3);

