alter table public.t_companies
drop COLUMN IF EXISTS country
	,drop COLUMN IF EXISTS country_code
	,drop COLUMN IF EXISTS state_code
	,drop COLUMN IF EXISTS state ;

alter table public.t_company_facilities
drop COLUMN IF EXISTS facility_state
	,drop COLUMN IF EXISTS facility_state_code
	,drop COLUMN IF EXISTS facility_country
	,drop COLUMN IF EXISTS facility_country_code;

alter table public.t_companies_secondary_industry drop COLUMN IF EXISTS country;