CREATE TABLE IF NOT EXISTS impact.t_data_emissions_reduction_target_scenarios
(
    scenario_id serial not null PRIMARY KEY,
    emissions_reduction_id integer
        constraint fk_t_data_emissions_reduction_target_scenarios_t_data_emissions_reduction
        references impact.t_data_emissions_reduction,
    emissions_reduction_target_scope_id integer
        constraint fk_t_data_emissions_reduction_target_scenarios_t_ref_emissions_reduction_target_scope
        references static.t_ref_emissions_reduction_target_scope,
    target_reduction_percentage integer,
    target_type_id integer,
    target_year integer
);
