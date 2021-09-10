drop table if exists tech.t_app_data_text;

create table if not exists tech.t_app_data_text
(
    id serial not null
    constraint t_app_data_text_pkey
    primary key,
    textkey varchar(100),
    textvalue varchar(5000),
    culture varchar(100),
    constraint uq_data_text_key_culture
    unique (textkey, culture)
    );