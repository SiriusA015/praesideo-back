
DROP VIEW if exists static.v_ref_config_emissions_factor;

CREATE OR REPLACE VIEW static.v_ref_config_emissions_factor
 AS
SELECT t2.continent,
       t3.region,
       t4.country,
       t9.state_name,
       t5.name AS industry_sector,
       t6.name AS industry_subsector,
       t1.emission_factor,
       t7.list_value AS emission_factor_source,
       v8.etype,
       v8.etypeattr1,
       v8.etypeattr2,
       v8.etypeattr3,
       v8.etypeattr4,
       v8.etype_unit1,
       v8.etype_unit2,
       t1.start_date,
       t1.end_date,
       t1.id
FROM static.t_ref_config_emissions_factor t1
         LEFT JOIN static.t_ref_continent t2 ON t2.id = t1.continent_id
         LEFT JOIN static.t_ref_regions t3 ON t3.id = t1.region_id
         LEFT JOIN static.t_ref_countries t4 ON t4.id = t1.country_id
         LEFT JOIN static.t_ref_industry_sector t5 ON t5.industry_sector_id = t1.industry_sector_id
         LEFT JOIN static.t_ref_industry_subsector t6 ON t6.industry_subsector_id = t1.industry_subsector_id
         LEFT JOIN static.t_ref_list t7 ON t7.list_id = t1.emission_source_id
         JOIN static.v_ref_config_emissions_type v8 ON v8.id = t1.config_etype_id
         left join static.t_ref_country_states t9 on t9.id = t1.state_id;

