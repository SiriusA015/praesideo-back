create table if not exists static.t_ref_blocked_domains
(
    id serial not null primary key
    ,domain		 		varchar(100) NOT NULL
    ,date_added			timestamp
    ,added_by			varchar(100)
    ,date_modified		timestamp
    ,modified_by		varchar(100)
    );

insert into static.t_ref_blocked_domains (domain,date_added,added_by)
values ('yahoo.com',now(),'nidhish');
insert into static.t_ref_blocked_domains (domain,date_added,added_by)
values ('gmail.com',now(),'nidhish');