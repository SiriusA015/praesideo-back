
create table if not exists static.t_ref_fx
(
    id serial not null primary key,
    currency_id        integer,
    rate               double precision,
    date               timestamp,
    CONSTRAINT fk_t_ref_fx_t_ref_base_currency FOREIGN KEY (currency_id) REFERENCES static.t_ref_base_currency(base_currency_id)
);
