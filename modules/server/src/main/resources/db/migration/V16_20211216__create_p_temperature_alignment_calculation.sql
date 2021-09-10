create or replace procedure public.p_temperature_alignment_calculation(company_id integer, year integer, record_type integer, is_scenario integer)
    language plpgsql
as
$$
begin

insert into impact.t_impact_temperature_alignment (
    company_id,
    year,
    record_type,
    is_scenario,

    temperature_alignment_score_overall,
    temperature_score_overall_scope_1,
    temperature_score_overall_scope_2,
    temperature_score_overall_scope_3,

    probability_1_5_degree,
    probability_1_5_degree_scope_1,
    probability_1_5_degree_scope_2,
    probability_1_5_degree_scope_3,

    probability_2_degree,
    probablity_2_degree_scope_1,
    probablity_2_degree_scope_2,
    probablity_2_degree_scope_3,

    transition_pathway_overall_actual_short_term,
    transition_pathway_overall_actual_long_term,
    transition_pathway_overall_1_5_short_term,
    transition_pathway_overall_1_5_long_term,
    transition_pathway_overall_2_short_term,
    transition_pathway_overall_2_long_term,

    scope1_actual_short_term,
    scope1_actual_long_term,
    scope1_1_5_short_term,
    scope1_1_5_long_term,
    scope1_2_short_term,
    scope1_2_long_term,

    scope2_actual_short_term,
    scope2_actual_long_term,
    scope2_1_5_short_term,
    scope2_1_5_long_term,
    scope2_2_short_term,
    scope2_2_long_term,

    scope3_actual_short_term,
    scope3_actual_long_term,
    scope3_1_5_short_term,
    scope3_1_5_long_term,
    scope3_2_short_term,
    scope3_2_long_term

)
values (
           company_id,
           year,
           record_type,
           is_scenario,

           3.1,  -- Overall Temperature alignment score
           1.5,  -- Overall Scope 1 Temperature score
           1.5,  -- Overall Scope 2 Temperature score
           3.2,  -- Overall Scope 3 Temperature score

           0.2,  -- Probability of 1.5 degree
           73.7, -- Probablity of 1.5 degree for scope 1
           73.7, -- Probablity of 1.5 degree for scope 2
           0,    -- Probablity of 1.5 degree for scope 3

           0.2,  -- Probability of 2 degree
           93.5, -- Probablity of 2 degree for scope 1
           93.5, -- Probablity of 2 degree for scope 2
           0.2,  -- Probablity of 2 degree for scope 3

           240, -- Transition pathway overall
           230,
           100,
           0,
           160,
           80,

           1.2,
           0,
           0.9,
           0,
           1.2,
           0,

           0.2,
           0,
           0.1,
           0,
           0.2,
           0,

           240,
           240,
           100,
           0,
           150,
           75
       );

commit;
end;
$$;
