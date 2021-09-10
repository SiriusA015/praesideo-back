
Drop view if exists impact.v_data_emissions_short_term_targets cascade;
create or replace view impact.v_data_emissions_short_term_targets
   as
SELECT
    t1.company_id
     ,t6.name as scope
     ,case when t4.target_type_id=1 THEN 'ABSOLUTE' ELSE 'RELATIVE' END as target_type
     ,date_part('year', CURRENT_DATE) as target_reduction_short_term_plan1_year
     ,case when COALESCE(t4.is_assumed_substitution,false)=true
               THEN t3.target_reduction_percentage * (date_part('year', CURRENT_DATE)- t7.calendar_year)/(t3.target_year-t7.calendar_year)
           ELSE t4.target_reduction_short_term_plan1 END as target_reduction_short_term_plan1
     ,date_part('year', CURRENT_DATE)+1 as target_reduction_short_term_plan2_year
     ,case when COALESCE(t4.is_assumed_substitution,false)=true
               THEN t3.target_reduction_percentage * (date_part('year', CURRENT_DATE)+1- t7.calendar_year)/(t3.target_year-t7.calendar_year)
           ELSE t4.target_reduction_short_term_plan2 END as target_reduction_short_term_plan2
     ,date_part('year', CURRENT_DATE)+2 as target_reduction_short_term_plan3_year
     ,case when COALESCE(t4.is_assumed_substitution,false)=true
               THEN t3.target_reduction_percentage * (date_part('year', CURRENT_DATE)+2- t7.calendar_year)/(t3.target_year-t7.calendar_year)
           ELSE t4.target_reduction_short_term_plan3 END as target_reduction_short_term_plan3
     ,date_part('year', CURRENT_DATE)+3 as target_reduction_short_term_plan4_year
     ,case when COALESCE(t4.is_assumed_substitution,false)=true
               THEN t3.target_reduction_percentage * (date_part('year', CURRENT_DATE)+3- t7.calendar_year)/(t3.target_year-t7.calendar_year)
           ELSE t4.target_reduction_short_term_plan4 END as target_reduction_short_term_plan4
FROM
    public.t_companies t1
        inner join impact.t_data_emissions_reduction t2 ON t2.company_id = t1.company_id
        inner join impact.t_data_emissions_reduction_short_term t4 on t4.emissions_reduction_id = t2.emissions_reduction_id
        inner join impact.t_data_emissions_reduction_target t3 on t3.emissions_reduction_id = t4.emissions_reduction_id
        and t3.target_type_id=t4.target_type_id and t3.emissions_reduction_target_scope_id= t4.emissions_reduction_target_scope_id
        and t3.target_year<=2030
        left outer join static.t_ref_emissions_reduction_target_scope t6 on t6.emissions_reduction_target_scope_id = t4.emissions_reduction_target_scope_id
        inner join static.t_ref_years t7 on t7.year_representation_id = t2.year_representation_id
WHERE
        1=1 AND t3.target_year is not null;
