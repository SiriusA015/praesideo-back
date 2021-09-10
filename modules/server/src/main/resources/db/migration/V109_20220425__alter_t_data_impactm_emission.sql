alter table impact.t_data_impactm_emission ADD COLUMN IF NOT EXISTS is_employee_commute_complete_data boolean default false;
alter table impact.t_data_impactm_emission ADD COLUMN IF NOT EXISTS is_employee_commute_partial_data boolean default false;
alter table impact.t_data_impactm_emission ADD COLUMN IF NOT EXISTS is_employee_commute_approximate_data boolean default false;
alter table impact.t_data_impactm_emission ADD COLUMN IF NOT EXISTS is_business_travel_complete_data boolean default false;
alter table impact.t_data_impactm_emission ADD COLUMN IF NOT EXISTS is_business_travel_partial_data boolean default false;
