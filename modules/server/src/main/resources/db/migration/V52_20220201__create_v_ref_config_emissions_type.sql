
create or replace view static.v_ref_config_emissions_type
   as
select
    T1.id
     ,T1.scope
     ,T1.etype_id
     ,T2.list_value as etype
     ,T1.etypeattr1_id
     ,T3.list_value as etypeattr1
     ,T1.etypeattr2_id
     ,T4.list_value as etypeattr2
     ,T1.etypeattr3_id
     ,T5.list_value as etypeattr3
     ,T1.etypeattr4_id
     ,T6.list_value as etypeattr4
     ,T1.etype_unit1_id
     ,T8.list_value as etype_unit1
     ,T1.etype_unit2_id
     ,T9.list_value as etype_unit2
     ,T1.date_added
     ,T1.added_by
     ,T1.date_modified
     ,T1.modified_by
FROM
    static.t_ref_config_emissions_type     T1
        inner join static.t_ref_list      T2 on T2.list_id = T1.etype_id
        inner join static.t_ref_list      T3 on T3.list_id = T1.etypeattr1_id
        left outer join static.t_ref_list  T4 on T4.list_id = T1.etypeattr2_id
        left outer join static.t_ref_list  T5 on T5.list_id = T1.etypeattr3_id
        left outer join static.t_ref_list  T6 on T6.list_id = T1.etypeattr4_id
        inner join static.t_ref_list      T8 on T8.list_id = T1.etype_unit1_id
        inner join static.t_ref_list      T9 on T9.list_id = T1.etype_unit2_id;



create or replace view static.v_ref_config_emissions_unit_factor
   as
select
    v8.etype
     ,v8.etypeattr1
     ,v8.etypeattr2
     ,v8.etypeattr3
     ,v8.etypeattr4
     ,T2.list_value as etype_unit1
     ,T3.list_value as etype_unit2
     ,T1.etype_unit1_factor
     ,T1.etype_unit2_factor
     ,T1.id
     ,T1.etype_unit1_id
     ,T1.etype_unit2_id
     ,T1.date_added
     ,T1.added_by
     ,T1.date_modified
     ,T1.modified_by
FROM
    static.t_ref_config_emissions_unit_factor  T1
        inner join static.t_ref_list      T2 on T2.list_id = T1.etype_unit1_id
        inner join static.t_ref_list      T3 on T3.list_id = T1.etype_unit2_id
        inner join static.V_ref_config_emissions_type  v8 on v8.id = t1.config_emission_type_id;


create or replace view static.v_ref_config_emissions_factor
   as
select
    t2.continent
     ,t3.region
     ,t4.country
     ,t5.name as industry_sector
     ,t6.name as industry_subsector
     ,t1.emission_factor
     ,t7.list_value as emission_factor_source
     ,v8.etype
     ,v8.etypeattr1
     ,v8.etypeattr2
     ,v8.etypeattr3
     ,v8.etypeattr4
     ,v8.etype_unit1
     ,v8.etype_unit2
FROM
    static.t_ref_config_emissions_factor         t1
        left outer join static.t_ref_continent           t2 on t2.id = t1.continent_id
        left outer join static.t_ref_regions         t3 on t3.id = t1.region_id
        left outer join static.t_ref_countries           t4 on t4.id = t1.country_id
        left outer join static.t_ref_industry_sector   t5 on t5.industry_sector_id = t1.industry_sector_id
        left outer join static.t_ref_industry_subsector t6 on t6.industry_subsector_id = t1.industry_subsector_id
        left outer join static.t_ref_list           t7 on t7.list_id = t1.emission_source_id
        inner join static.V_ref_config_emissions_type  v8 on v8.id = t1.config_etype_id;