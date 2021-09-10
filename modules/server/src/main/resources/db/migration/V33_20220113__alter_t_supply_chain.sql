alter table if exists trace.t_supply_chain
    add column if not exists financial_year_start_month integer,
    add column if not exists is_financial_year boolean,
    add column if not exists year_representation_id integer
		constraint fk_t_supply_chain_t_ref_years references static.t_ref_years;
