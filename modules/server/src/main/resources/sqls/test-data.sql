insert into public.companies
values (1, 'Timisoara', 'Busy doing IT stuff', 'IT',
        'Busy Machines', 'Romania', 1, 1,
        1, 1, 'RO', 1, false, 1);

insert into public.users
values (1, null, transaction_timestamp(), 'praz@test.com', true,
        '$2a$10$lf4J1obX1aWcYREsuo1.Du5N1ojjaYBQijAnS4OWdk028gDjEjRwO',
        'praz@test.com', 1, 1);

insert into public.user_financial_details(base_currency_id, company_id, is_financial_year, net_profit, revenue, start_month, version, year_representation_id)
values (1, 1, false, 1, 2,
        999999999, 999, 1);

insert into public.user_data_set values (1, transaction_timestamp(), transaction_timestamp(), 0,
                                         1, 1);

insert into public.dataset_baseline_year_emissions
values (1, 1, true, 2, 3, 4, 1);

insert into public.dataset_emissions_reduction(financial_year_start_month, is_financial_year, year_representation_id, user_data_set_id)
values (1, false, 15, 20);

insert into public.dataset_emissions_reduction_target(emissions_reduction_target_id, emissions_reduction_target_scope_id, target_reduction_percentage, target_type_id, target_year)
values (1, 1, 15, 1, 2021);

insert into public.dataset_emissions_reduction_target(emissions_reduction_target_id, emissions_reduction_target_scope_id, target_reduction_percentage, target_type_id, target_year)
values (2, 2, 25, 0, 2022);