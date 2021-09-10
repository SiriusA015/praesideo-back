CREATE OR REPLACE FUNCTION trace.f_get_supply_chain_performance(IN companyId integer,
                                                                OUT aggregated_Temperature_Score bigint,
                                                                OUT aggregated_Risk_Adjusted_Temperature_Score bigint,
                                                                OUT aggregated_Probability_1_5_Degree_value bigint,
                                                                OUT aggregated_Probability_2_0_Degree_value bigint,
                                                                OUT aggregated_Baseline_value bigint,
                                                                OUT aggregated_Supply_chain_Short_term_value bigint,
                                                                OUT aggregated_Supply_chain_Long_term_value bigint,
                                                                OUT aggregated_1_5_Short_term_value bigint,
                                                                OUT aggregated_1_5_Long_term_value bigint,
                                                                OUT aggregated_2_0_Short_term_value bigint,
                                                                OUT aggregated_2_0_Long_term_value bigint)
AS $$
BEGIN
select
    sum(ita.temperature_alignment_score_overall) as aggregated_Temperature_Score,
    floor(random() * 10 + 1)::bigint,
    sum(ita.probability_1_5_degree) as aggregated_Probability_1_5_Degree_value,
    sum(ita.probability_2_degree) as aggregated_Probability_2_0_Degree_value,
    sum(ita.transition_pathway_overall_baseline_value) as aggregated_Baseline_value,
    0::bigint,
    floor(random() * 10 + 1)::bigint,
    floor(random() * 1 + 1)::bigint,
    floor(random() * 10 + 1)::bigint,
    floor(random() * 1 + 1)::bigint,
    floor(random() * 10 + 1)::bigint
into f_get_supply_chain_performance.aggregated_Temperature_Score,
    f_get_supply_chain_performance.aggregated_Risk_Adjusted_Temperature_Score,
    f_get_supply_chain_performance.aggregated_Probability_1_5_Degree_value,
    f_get_supply_chain_performance.aggregated_Probability_2_0_Degree_value,
    f_get_supply_chain_performance.aggregated_Baseline_value,
    f_get_supply_chain_performance.aggregated_Supply_chain_Short_term_value,
    f_get_supply_chain_performance.aggregated_Supply_chain_Long_term_value,
    f_get_supply_chain_performance.aggregated_1_5_Short_term_value,
    f_get_supply_chain_performance.aggregated_1_5_Long_term_value,
    f_get_supply_chain_performance.aggregated_2_0_Short_term_value,
    f_get_supply_chain_performance.aggregated_2_0_Long_term_value
from impact.t_impact_temperature_alignment ita
         join public.t_companies cp on ita.company_id = cp.company_id
         join trace.t_supply_chain sc on cp.company_id = sc.supplier_id
where sc.date_removed is null and ita.company_id = companyId
group by ita.company_id, cp.company_name;
END;
$$ LANGUAGE plpgsql;