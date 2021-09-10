
DROP VIEW tech.v_python_supplychain_targets;

CREATE OR REPLACE VIEW tech.v_python_supplychain_targets
 AS
 WITH s2 AS (
         SELECT s1.customer_id,
            s1.baseline_year,
            s1.transition_pathway_overall_actual_short_term * s1.supplier_allocation_factor AS supplier_allocated_short_term_transition_pathway,
            s1.transition_pathway_overall_actual_long_term * s1.supplier_allocation_factor AS supplier_allocated_long_term_transition_pathway,
            s1.overall_baseline_value * s1.supplier_allocation_factor AS supplier_allocated_baseline
           FROM ( SELECT t1.customer_id,
                    t2.company_name AS trace_customer_name,
                    t3.company_name AS supplier_name,
                    t4.revenue::double precision * t5.conversion_rate AS supplier_revenue_chf,
                    t6.supplier_amount::double precision * t7.conversion_rate AS supplier_allocation_chf,
                    t6.supplier_amount::double precision * t7.conversion_rate / (t4.revenue::double precision * t5.conversion_rate) AS supplier_allocation_factor,
                    t8.calendar_year as baseline_year,
                    t9.transition_pathway_overall_actual_short_term,
                    t9.transition_pathway_overall_actual_long_term,
                    t9.transition_pathway_overall_baseline_value AS overall_baseline_value
                   FROM trace.t_supply_chain t1
                     JOIN t_companies t2 ON t2.company_id = t1.customer_id
                     JOIN t_companies t3 ON t3.company_id = t1.supplier_id
                     JOIN impact.t_data_financials t4 ON t4.company_id = t3.company_id
                     JOIN static.t_ref_base_currency t5 ON t5.base_currency_id = t4.base_currency_id
                     JOIN trace.t_supplier_allocation t6 ON t6.supply_chain_id = t1.supply_chain_id
                     JOIN static.t_ref_base_currency t7 ON t7.base_currency_id = t6.supplier_currency_id
				 	join impact.t_data_emissions_reduction t3_1 on t3_1.company_id = t2.company_id
                     JOIN static.t_ref_years t8 ON t8.year_representation_id = t3_1.year_representation_id
                     JOIN ( SELECT
						   	temp1.company_id,
                            temp1.transition_pathway_overall_actual_long_term,
                            temp1.transition_pathway_overall_actual_short_term,
                            temp1.transition_pathway_overall_baseline_value,
                            temp1.rank
                           FROM ( SELECT
                                    t_impact_temperature_alignment.company_id,
								 	t_impact_temperature_alignment.transition_pathway_overall_actual_long_term,
                                    t_impact_temperature_alignment.transition_pathway_overall_actual_short_term,
                                    t_impact_temperature_alignment.transition_pathway_overall_baseline_value,
                                    row_number() OVER (PARTITION BY t_impact_temperature_alignment.company_id ORDER BY t_impact_temperature_alignment.year DESC) AS rank
                                   FROM impact.t_impact_temperature_alignment
                                  WHERE t_impact_temperature_alignment.is_supplychain_aggregated = false) temp1
                          WHERE temp1.rank = 1) t9 ON t9.company_id = t1.supplier_id
                  WHERE 1 = 1 AND t1.date_removed IS NULL AND t4.revenue IS NOT NULL AND t4.net_profit IS NOT NULL AND t6.date_removed IS NULL) s1
        )
SELECT s2.customer_id,
       s2.baseline_year,
       sum(s2.supplier_allocated_baseline) AS baseline_allocation,
       sum(s2.supplier_allocated_short_term_transition_pathway) AS short_term_allocation,
       sum(s2.supplier_allocated_long_term_transition_pathway) AS long_term_allocation,
       ((sum(s2.supplier_allocated_baseline) - sum(s2.supplier_allocated_short_term_transition_pathway)) / sum(s2.supplier_allocated_baseline))::numeric(10,2) AS short_term_target,
        ((sum(s2.supplier_allocated_baseline) - sum(s2.supplier_allocated_long_term_transition_pathway)) / sum(s2.supplier_allocated_baseline))::numeric(10,2) AS long_term_target,
        2030 AS short_term_year,
       2050 AS long_term_year
FROM s2
GROUP BY s2.customer_id, s2.baseline_year;


