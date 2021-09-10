alter table impact.t_data_emissions_reduction_target
    ADD COLUMN IF NOT EXISTS date_added date
    ,ADD COLUMN IF NOT EXISTS added_by varchar(100)
    ,ADD COLUMN IF NOT EXISTS date_modified date
    ,ADD COLUMN IF NOT EXISTS modified_by varchar(100);
alter table impact.t_data_climate_mechanisms_influence
    ADD COLUMN IF NOT EXISTS date_added date
    ,ADD COLUMN IF NOT EXISTS added_by varchar(100)
    ,ADD COLUMN IF NOT EXISTS date_modified date
    ,ADD COLUMN IF NOT EXISTS modified_by varchar(100);
alter table impact.t_data_ghg_inventory_method
    ADD COLUMN IF NOT EXISTS date_added date
    ,ADD COLUMN IF NOT EXISTS added_by varchar(100)
    ,ADD COLUMN IF NOT EXISTS date_modified date
    ,ADD COLUMN IF NOT EXISTS modified_by varchar(100);
alter table impact.t_data_files
    ADD COLUMN IF NOT EXISTS date_added date
    ,ADD COLUMN IF NOT EXISTS added_by varchar(100)
    ,ADD COLUMN IF NOT EXISTS date_modified date
    ,ADD COLUMN IF NOT EXISTS modified_by varchar(100);
alter table impact.t_data_financials
    ADD COLUMN IF NOT EXISTS date_added date
    ,ADD COLUMN IF NOT EXISTS added_by varchar(100)
    ,ADD COLUMN IF NOT EXISTS date_modified date
    ,ADD COLUMN IF NOT EXISTS modified_by varchar(100);
alter table impact.t_data_emissions_reduction_short_term
    ADD COLUMN IF NOT EXISTS date_added date
    ,ADD COLUMN IF NOT EXISTS added_by varchar(100)
    ,ADD COLUMN IF NOT EXISTS date_modified date
    ,ADD COLUMN IF NOT EXISTS modified_by varchar(100);
alter table impact.t_data_ghg_inventory_method_operational_boundary
    ADD COLUMN IF NOT EXISTS date_added date
    ,ADD COLUMN IF NOT EXISTS added_by varchar(100)
    ,ADD COLUMN IF NOT EXISTS date_modified date
    ,ADD COLUMN IF NOT EXISTS modified_by varchar(100);
alter table impact.t_data_recent_year_emissions_carbon_credit_category
    ADD COLUMN IF NOT EXISTS date_added date
    ,ADD COLUMN IF NOT EXISTS added_by varchar(100)
    ,ADD COLUMN IF NOT EXISTS date_modified date
    ,ADD COLUMN IF NOT EXISTS modified_by varchar(100);
alter table impact.t_data_recent_year_emissions_carbon_credit_category_type
    ADD COLUMN IF NOT EXISTS date_added date
    ,ADD COLUMN IF NOT EXISTS added_by varchar(100)
    ,ADD COLUMN IF NOT EXISTS date_modified date
    ,ADD COLUMN IF NOT EXISTS modified_by varchar(100);
alter table impact.t_data_recent_year_emissions_source
    ADD COLUMN IF NOT EXISTS date_added date
    ,ADD COLUMN IF NOT EXISTS added_by varchar(100)
    ,ADD COLUMN IF NOT EXISTS date_modified date
    ,ADD COLUMN IF NOT EXISTS modified_by varchar(100);
alter table impact.t_data_climate_mechanisms_influence_metric
    ADD COLUMN IF NOT EXISTS date_added date
    ,ADD COLUMN IF NOT EXISTS added_by varchar(100)
    ,ADD COLUMN IF NOT EXISTS date_modified date
    ,ADD COLUMN IF NOT EXISTS modified_by varchar(100);
alter table impact.t_data_emissions_reduction
    ADD COLUMN IF NOT EXISTS date_added date
    ,ADD COLUMN IF NOT EXISTS added_by varchar(100)
    ,ADD COLUMN IF NOT EXISTS date_modified date
    ,ADD COLUMN IF NOT EXISTS modified_by varchar(100);
alter table impact.t_data_recent_year_emissions
    ADD COLUMN IF NOT EXISTS date_added date
    ,ADD COLUMN IF NOT EXISTS added_by varchar(100)
    ,ADD COLUMN IF NOT EXISTS date_modified date
    ,ADD COLUMN IF NOT EXISTS modified_by varchar(100);
alter table impact.t_impact_temperature_alignment
    ADD COLUMN IF NOT EXISTS date_added date
    ,ADD COLUMN IF NOT EXISTS added_by varchar(100)
    ,ADD COLUMN IF NOT EXISTS date_modified date
    ,ADD COLUMN IF NOT EXISTS modified_by varchar(100);
alter table public.t_users_permission
    ADD COLUMN IF NOT EXISTS date_added date
    ,ADD COLUMN IF NOT EXISTS added_by varchar(100)
    ,ADD COLUMN IF NOT EXISTS date_modified date
    ,ADD COLUMN IF NOT EXISTS modified_by varchar(100);
alter table public.t_user_properties
    ADD COLUMN IF NOT EXISTS date_added date
    ,ADD COLUMN IF NOT EXISTS added_by varchar(100)
    ,ADD COLUMN IF NOT EXISTS date_modified date
    ,ADD COLUMN IF NOT EXISTS modified_by varchar(100);
alter table public.t_users
    ADD COLUMN IF NOT EXISTS date_added date
    ,ADD COLUMN IF NOT EXISTS added_by varchar(100)
    ,ADD COLUMN IF NOT EXISTS date_modified date
    ,ADD COLUMN IF NOT EXISTS modified_by varchar(100);
alter table public.t_users_authentication
    ADD COLUMN IF NOT EXISTS date_added date
    ,ADD COLUMN IF NOT EXISTS added_by varchar(100)
    ,ADD COLUMN IF NOT EXISTS date_modified date
    ,ADD COLUMN IF NOT EXISTS modified_by varchar(100);
alter table public.t_companies
    ADD COLUMN IF NOT EXISTS date_added date
    ,ADD COLUMN IF NOT EXISTS added_by varchar(100)
    ,ADD COLUMN IF NOT EXISTS date_modified date
    ,ADD COLUMN IF NOT EXISTS modified_by varchar(100);
alter table static.t_ref_auditing_validation
    ADD COLUMN IF NOT EXISTS date_added date
    ,ADD COLUMN IF NOT EXISTS added_by varchar(100)
    ,ADD COLUMN IF NOT EXISTS date_modified date
    ,ADD COLUMN IF NOT EXISTS modified_by varchar(100);
alter table static.t_ref_company_status
    ADD COLUMN IF NOT EXISTS date_added date
    ,ADD COLUMN IF NOT EXISTS added_by varchar(100)
    ,ADD COLUMN IF NOT EXISTS date_modified date
    ,ADD COLUMN IF NOT EXISTS modified_by varchar(100);
alter table static.t_ref_emissions_inventory_method
    ADD COLUMN IF NOT EXISTS date_added date
    ,ADD COLUMN IF NOT EXISTS added_by varchar(100)
    ,ADD COLUMN IF NOT EXISTS date_modified date
    ,ADD COLUMN IF NOT EXISTS modified_by varchar(100);
alter table static.t_ref_industry_sector
    ADD COLUMN IF NOT EXISTS date_added date
    ,ADD COLUMN IF NOT EXISTS added_by varchar(100)
    ,ADD COLUMN IF NOT EXISTS date_modified date
    ,ADD COLUMN IF NOT EXISTS modified_by varchar(100);
alter table static.t_ref_countries
    ADD COLUMN IF NOT EXISTS date_added date
    ,ADD COLUMN IF NOT EXISTS added_by varchar(100)
    ,ADD COLUMN IF NOT EXISTS date_modified date
    ,ADD COLUMN IF NOT EXISTS modified_by varchar(100);
alter table static.t_ref_years
    ADD COLUMN IF NOT EXISTS date_added date
    ,ADD COLUMN IF NOT EXISTS added_by varchar(100)
    ,ADD COLUMN IF NOT EXISTS date_modified date
    ,ADD COLUMN IF NOT EXISTS modified_by varchar(100);
alter table static.t_ref_carbon_credit_category
    ADD COLUMN IF NOT EXISTS date_added date
    ,ADD COLUMN IF NOT EXISTS added_by varchar(100)
    ,ADD COLUMN IF NOT EXISTS date_modified date
    ,ADD COLUMN IF NOT EXISTS modified_by varchar(100);
alter table static.t_ref_carbon_price_coverage
    ADD COLUMN IF NOT EXISTS date_added date
    ,ADD COLUMN IF NOT EXISTS added_by varchar(100)
    ,ADD COLUMN IF NOT EXISTS date_modified date
    ,ADD COLUMN IF NOT EXISTS modified_by varchar(100);
alter table static.t_ref_regions
    ADD COLUMN IF NOT EXISTS date_added date
    ,ADD COLUMN IF NOT EXISTS added_by varchar(100)
    ,ADD COLUMN IF NOT EXISTS date_modified date
    ,ADD COLUMN IF NOT EXISTS modified_by varchar(100);
alter table static.t_ref_carbon_price_coverage_type
    ADD COLUMN IF NOT EXISTS date_added date
    ,ADD COLUMN IF NOT EXISTS added_by varchar(100)
    ,ADD COLUMN IF NOT EXISTS date_modified date
    ,ADD COLUMN IF NOT EXISTS modified_by varchar(100);
alter table static.t_ref_customer_type
    ADD COLUMN IF NOT EXISTS date_added date
    ,ADD COLUMN IF NOT EXISTS added_by varchar(100)
    ,ADD COLUMN IF NOT EXISTS date_modified date
    ,ADD COLUMN IF NOT EXISTS modified_by varchar(100);
alter table static.t_ref_base_currency
    ADD COLUMN IF NOT EXISTS date_added date
    ,ADD COLUMN IF NOT EXISTS added_by varchar(100)
    ,ADD COLUMN IF NOT EXISTS date_modified date
    ,ADD COLUMN IF NOT EXISTS modified_by varchar(100);
alter table static.t_ref_stock_exchange_zone
    ADD COLUMN IF NOT EXISTS date_added date
    ,ADD COLUMN IF NOT EXISTS added_by varchar(100)
    ,ADD COLUMN IF NOT EXISTS date_modified date
    ,ADD COLUMN IF NOT EXISTS modified_by varchar(100);
alter table static.t_ref_purchase_credit_categories
    ADD COLUMN IF NOT EXISTS date_added date
    ,ADD COLUMN IF NOT EXISTS added_by varchar(100)
    ,ADD COLUMN IF NOT EXISTS date_modified date
    ,ADD COLUMN IF NOT EXISTS modified_by varchar(100);
alter table static.t_ref_purchase_credit_category_type
    ADD COLUMN IF NOT EXISTS date_added date
    ,ADD COLUMN IF NOT EXISTS added_by varchar(100)
    ,ADD COLUMN IF NOT EXISTS date_modified date
    ,ADD COLUMN IF NOT EXISTS modified_by varchar(100);
alter table static.t_ref_industry_subsector
    ADD COLUMN IF NOT EXISTS date_added date
    ,ADD COLUMN IF NOT EXISTS added_by varchar(100)
    ,ADD COLUMN IF NOT EXISTS date_modified date
    ,ADD COLUMN IF NOT EXISTS modified_by varchar(100);
alter table static.t_ref_home_stock_exchange
    ADD COLUMN IF NOT EXISTS date_added date
    ,ADD COLUMN IF NOT EXISTS added_by varchar(100)
    ,ADD COLUMN IF NOT EXISTS date_modified date
    ,ADD COLUMN IF NOT EXISTS modified_by varchar(100);
alter table static.t_ref_carbon_compensation_type
    ADD COLUMN IF NOT EXISTS date_added date
    ,ADD COLUMN IF NOT EXISTS added_by varchar(100)
    ,ADD COLUMN IF NOT EXISTS date_modified date
    ,ADD COLUMN IF NOT EXISTS modified_by varchar(100);
alter table static.t_ref_emissions_reduction_target_scope
    ADD COLUMN IF NOT EXISTS date_added date
    ,ADD COLUMN IF NOT EXISTS added_by varchar(100)
    ,ADD COLUMN IF NOT EXISTS date_modified date
    ,ADD COLUMN IF NOT EXISTS modified_by varchar(100);
alter table static.t_ref_operational_boundary_scope
    ADD COLUMN IF NOT EXISTS date_added date
    ,ADD COLUMN IF NOT EXISTS added_by varchar(100)
    ,ADD COLUMN IF NOT EXISTS date_modified date
    ,ADD COLUMN IF NOT EXISTS modified_by varchar(100);
alter table static.t_ref_operational_boundary
    ADD COLUMN IF NOT EXISTS date_added date
    ,ADD COLUMN IF NOT EXISTS added_by varchar(100)
    ,ADD COLUMN IF NOT EXISTS date_modified date
    ,ADD COLUMN IF NOT EXISTS modified_by varchar(100);
alter table static.t_ref_organisational_boundary
    ADD COLUMN IF NOT EXISTS date_added date
    ,ADD COLUMN IF NOT EXISTS added_by varchar(100)
    ,ADD COLUMN IF NOT EXISTS date_modified date
    ,ADD COLUMN IF NOT EXISTS modified_by varchar(100);
alter table static.t_ref_organisational_boundary_criteria
    ADD COLUMN IF NOT EXISTS date_added date
    ,ADD COLUMN IF NOT EXISTS added_by varchar(100)
    ,ADD COLUMN IF NOT EXISTS date_modified date
    ,ADD COLUMN IF NOT EXISTS modified_by varchar(100);
alter table tech.t_app_data_text
    ADD COLUMN IF NOT EXISTS date_added date
    ,ADD COLUMN IF NOT EXISTS added_by varchar(100)
    ,ADD COLUMN IF NOT EXISTS date_modified date
    ,ADD COLUMN IF NOT EXISTS modified_by varchar(100);

