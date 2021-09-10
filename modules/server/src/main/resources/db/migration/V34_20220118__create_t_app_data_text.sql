create table if not exists tech.t_app_data_text
(
    id integer primary key
    ,textkey varchar(100)
    ,textvalue varchar(5000)
    ,culture varchar(100)
    ,constraint uq_data_text_key_culture UNIQUE (textkey,culture)
)