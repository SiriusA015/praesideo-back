ALTER TABLE impact.t_impact_temperature_alignment ADD COLUMN IF NOT EXISTS baseline_year integer;

drop view if exists tech.v_python_getcompanybasicinfo;

CREATE OR REPLACE VIEW tech.v_python_getcompanybasicinfo
as
SELECT
    t1.company_id
     ,t1.company_name
     ,t1.company_domain
     ,t1.company_description
     ,t1.city
     ,t8.country
     ,t1.industry_sector_id
     ,t2.name as industry_sector
     ,t1.industry_subsector_id
     ,t3.name as industry_subsector
     ,t7.code as currency
     ,t6.revenue
     ,t5.calendar_year as baseline_Year
     ,t4.scope1  as baseline_scope1
     ,t4.scope2  as baseline_scope2
     ,t4.scope3  as baseline_scope3
FROM
    public.t_companies 								t1
        inner join static.t_ref_industry_sector 			t2 ON t2.industry_sector_id = t1.industry_sector_id
        inner join static.t_ref_industry_subsector 		t3 ON t3.industry_subsector_id = t1.industry_subsector_id
        left outer join impact.t_data_emissions_reduction t4 ON t4.company_id = t1.company_id
        left outer join static.t_ref_years 				t5 on t5.year_representation_id = t4.year_representation_id
        left outer join impact.t_data_financials 			t6 on t6.company_id= t1.company_id
        left outer join static.t_ref_base_currency 		t7 on t7.base_currency_id = t6.base_currency_id
        inner join static.t_ref_countries 				t8 ON t8.id = t1.country_id;

drop view if exists  tech.v_python_getshorttermtargets;

CREATE OR REPLACE VIEW tech.v_python_getshorttermtargets
 AS
SELECT t1.company_id,
       t6.name AS scope,
       CASE
           WHEN t4.target_type_id = 1 THEN 'ABSOLUTE'::text
           ELSE 'RELATIVE'::text
           END AS target_type,
       date_part('year'::text, CURRENT_DATE) AS target_reduction_short_term_plan1_year,
       CASE
           WHEN COALESCE(t4.is_assumed_substitution, false) = true THEN t3.target_reduction_percentage::double precision * (date_part('year'::text, CURRENT_DATE) - t7.calendar_year::double precision) / (t3.target_year - t7.calendar_year)::double precision
            ELSE t4.target_reduction_short_term_plan1::double precision
END AS target_reduction_short_term_plan1,
    date_part('year'::text, CURRENT_DATE) + 1::double precision AS target_reduction_short_term_plan2_year,
        CASE
            WHEN COALESCE(t4.is_assumed_substitution, false) = true THEN t3.target_reduction_percentage::double precision * (date_part('year'::text, CURRENT_DATE) + 1::double precision - t7.calendar_year::double precision) / (t3.target_year - t7.calendar_year)::double precision
            ELSE t4.target_reduction_short_term_plan2::double precision
END AS target_reduction_short_term_plan2,
    date_part('year'::text, CURRENT_DATE) + 2::double precision AS target_reduction_short_term_plan3_year,
        CASE
            WHEN COALESCE(t4.is_assumed_substitution, false) = true THEN t3.target_reduction_percentage::double precision * (date_part('year'::text, CURRENT_DATE) + 2::double precision - t7.calendar_year::double precision) / (t3.target_year - t7.calendar_year)::double precision
            ELSE t4.target_reduction_short_term_plan3::double precision
END AS target_reduction_short_term_plan3,
    date_part('year'::text, CURRENT_DATE) + 3::double precision AS target_reduction_short_term_plan4_year,
        CASE
            WHEN COALESCE(t4.is_assumed_substitution, false) = true THEN t3.target_reduction_percentage::double precision * (date_part('year'::text, CURRENT_DATE) + 3::double precision - t7.calendar_year::double precision) / (t3.target_year - t7.calendar_year)::double precision
            ELSE t4.target_reduction_short_term_plan4::double precision
END AS target_reduction_short_term_plan4
   FROM t_companies t1
     JOIN impact.t_data_emissions_reduction t2 ON t2.company_id = t1.company_id
     JOIN impact.t_data_emissions_reduction_short_term t4 ON t4.emissions_reduction_id = t2.emissions_reduction_id
     JOIN impact.t_data_emissions_reduction_target t3 ON t3.emissions_reduction_id = t4.emissions_reduction_id AND t3.target_type_id = t4.target_type_id AND t3.emissions_reduction_target_scope_id = t4.emissions_reduction_target_scope_id AND t3.target_year <= 2030
     LEFT JOIN static.t_ref_emissions_reduction_target_scope t6 ON t6.emissions_reduction_target_scope_id = t4.emissions_reduction_target_scope_id
     JOIN static.t_ref_years t7 ON t7.year_representation_id = t2.year_representation_id
  WHERE 1 = 1 AND t3.target_year IS NOT NULL;


drop view if exists  tech.v_python_getmediumlongtermtargets;

CREATE OR REPLACE VIEW tech.v_python_getmediumlongtermtargets
 AS
SELECT
    t1.company_id
     ,t6.name as scope
     ,case when t3.target_type_id=1 THEN 'ABSOLUTE' ELSE 'RELATIVE' END as target_type
     ,t3.target_year
     ,t3.target_reduction_percentage
FROM
    public.t_companies t1
        inner join impact.t_data_emissions_reduction t2 ON t2.company_id = t1.company_id
        left outer join impact.t_data_emissions_reduction_target t3 on t3.emissions_reduction_id = t2.emissions_reduction_id
        left outer join static.t_ref_emissions_reduction_target_scope t6 on t6.emissions_reduction_target_scope_id = t3.emissions_reduction_target_scope_id
WHERE
        1=1;

drop view if exists  tech.v_python_getmediumlongtermtargetsincludingscenario;

CREATE OR REPLACE VIEW tech.v_python_getmediumlongtermtargetsincludingscenario
 AS
SELECT
    t1.company_id
     ,t7.name as scope
     ,case when t5.target_type_id=1 THEN 'ABSOLUTE' ELSE 'RELATIVE' END as target_type
     ,t5.target_year
     ,t5.target_reduction_percentage
FROM
    public.t_companies t1
        inner join impact.t_data_emissions_reduction t2 ON t2.company_id = t1.company_id
        inner join static.t_ref_years t3 on t3.year_representation_id = t2.year_representation_id
        left outer join impact.t_data_emissions_reduction_target t5 on t5.emissions_reduction_id = t2.emissions_reduction_id
        inner join static.t_ref_emissions_reduction_target_scope t7 on t7.emissions_reduction_target_scope_id = t5.emissions_reduction_target_scope_id
WHERE
        1=1
  and NOT EXISTS (SELECT 1 FROM impact.t_data_emissions_reduction_target_scenarios t6 WHERE t6.emissions_reduction_id = t2.emissions_reduction_id )
UNION ALL
SELECT
    t1.company_id
     ,t6.name as scope
     ,case when t5.target_type_id=1 THEN 'ABSOLUTE' ELSE 'RELATIVE' END as target_type
     ,t5.target_year
     ,t5.target_reduction_percentage
FROM
    public.t_companies t1
        inner join impact.t_data_emissions_reduction t2 ON t2.company_id = t1.company_id
        inner join static.t_ref_years t3 on t3.year_representation_id = t2.year_representation_id
        INNER JOIN  impact.t_data_emissions_reduction_target_scenarios t5 on t5.emissions_reduction_id = t2.emissions_reduction_id
        inner join static.t_ref_emissions_reduction_target_scope t6 on t6.emissions_reduction_target_scope_id = t5.emissions_reduction_target_scope_id
WHERE 1=1;

drop view if exists  tech.v_python_getsupplier;

CREATE OR REPLACE VIEW tech.v_python_getsupplier
 AS
SELECT
    supplier_id
     ,customer_id
from
    trace.t_supply_chain t6
        inner join public.t_companies t7 on t7.company_id = t6.supplier_id
        inner join static.t_ref_company_status t8 on t8.status_id = t7.status_id
where
        1=1
  and t6.date_removed is null and t8.Status = 'ACCEPTED';

drop view if exists  tech.v_python_getsupplierspend;

CREATE OR REPLACE VIEW tech.v_python_getsupplierspend
 AS
SELECT
    t2.supplier_id
     ,t3.code as currency
     ,t1.supplier_amount
     ,t2.customer_id
FROM
    trace.t_supplier_allocation t1
        inner join trace.t_supply_chain t2 on t2.supply_chain_id = t1.supply_chain_id
        inner join static.t_ref_base_currency t3 on t3.base_currency_id = t1.supplier_currency_id
WHERE
        1=1;
