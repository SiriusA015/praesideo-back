create table if not exists static.t_ref_bank_accounts
(
    id serial not null primary key
    ,currency_id 				integer
    ,bank_name 					varchar(200)
    ,account_name			 	varchar(200)
    ,account_number				varchar(50)
    ,bic_code 					varchar(50)
    ,account_holder_address		varchar(500)
    ,country_id					integer
    ,date_added					timestamp
    ,added_by					varchar(100)
    ,date_modified				timestamp
    ,modified_by				varchar(100)
    ,CONSTRAINT fk_t_ref_bank_accounts_currency_id FOREIGN KEY (currency_id) REFERENCES static.t_ref_base_currency (base_currency_id)
    ,CONSTRAINT fk_t_ref_bank_accounts_country_id FOREIGN KEY (country_id) REFERENCES static.t_ref_countries (id)
    );

insert into static.t_ref_bank_accounts
(currency_id,bank_name,account_name,account_number,bic_code,account_holder_address,country_id,date_added,added_by,date_modified,modified_by)
select
    (select base_currency_id from static.t_ref_base_currency where code='CHF')
     ,'POSTFINANCE'
     ,'Praesideo SA'
     ,'CH123456789000000'
     ,'POFICHBEXXX'
     ,'Rue de Jargonnant 2,1207 Geneva'
     ,(SELECT id from static.t_ref_countries where country='Switzerland')
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish';

insert into static.t_ref_bank_accounts
(currency_id,bank_name,account_name,account_number,bic_code,account_holder_address,country_id,date_added,added_by,date_modified,modified_by)
select
    (select base_currency_id from static.t_ref_base_currency where code='USD')
     ,'POSTFINANCE'
     ,'Praesideo SA'
     ,'CH123456789000000'
     ,'POFICHBEXXX'
     ,'Rue de Jargonnant 2,1207 Geneva'
     ,(SELECT id from static.t_ref_countries where country='Switzerland')
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish';