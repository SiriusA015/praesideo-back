alter table static.t_ref_countries ADD COLUMN IF NOT EXISTS country_code VARCHAR(3);
create table if not exists static.t_ref_country_states
(
    id serial not null primary key
    ,country_id		 			integer
    ,state_name					varchar(500)
    ,state_code					varchar(10)
    ,date_added					timestamp
    ,added_by					varchar(100)
    ,date_modified				timestamp
    ,modified_by				varchar(100)
    ,CONSTRAINT fk_t_ref_country_states_country_id FOREIGN KEY (country_id) REFERENCES static.t_ref_countries(id)
    );
INSERT INTO static.t_ref_country_states (country_id,state_name,state_code,date_added,added_by)
SELECT (select id from static.t_ref_countries where country='United States of America')
     ,'Alabama','AL',now(),'nidhish' WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_country_states
WHERE country_id=(select id from static.t_ref_countries where country='United States of America')
and state_code ='AL'
);
INSERT INTO static.t_ref_country_states (country_id,state_name,state_code,date_added,added_by)
SELECT (select id from static.t_ref_countries where country='United States of America')
     ,'Alaska','AK',now(),'nidhish' WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_country_states
WHERE country_id=(select id from static.t_ref_countries where country='United States of America')
and state_code ='AK'
);
INSERT INTO static.t_ref_country_states (country_id,state_name,state_code,date_added,added_by)
SELECT (select id from static.t_ref_countries where country='United States of America')
     ,'American Samoa','AS',now(),'nidhish' WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_country_states
WHERE country_id=(select id from static.t_ref_countries where country='United States of America')
and state_code ='AS'
);
INSERT INTO static.t_ref_country_states (country_id,state_name,state_code,date_added,added_by)
SELECT (select id from static.t_ref_countries where country='United States of America')
     ,'Arizona','AZ',now(),'nidhish' WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_country_states
WHERE country_id=(select id from static.t_ref_countries where country='United States of America')
and state_code ='AZ'
);
INSERT INTO static.t_ref_country_states (country_id,state_name,state_code,date_added,added_by)
SELECT (select id from static.t_ref_countries where country='United States of America')
     ,'Arkansas','AR',now(),'nidhish' WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_country_states
WHERE country_id=(select id from static.t_ref_countries where country='United States of America')
and state_code ='AR'
);
INSERT INTO static.t_ref_country_states (country_id,state_name,state_code,date_added,added_by)
SELECT (select id from static.t_ref_countries where country='United States of America')
     ,'California','CA',now(),'nidhish' WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_country_states
WHERE country_id=(select id from static.t_ref_countries where country='United States of America')
and state_code ='CA'
);
INSERT INTO static.t_ref_country_states (country_id,state_name,state_code,date_added,added_by)
SELECT (select id from static.t_ref_countries where country='United States of America')
     ,'Colorado','CO',now(),'nidhish' WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_country_states
WHERE country_id=(select id from static.t_ref_countries where country='United States of America')
and state_code ='CO'
);
INSERT INTO static.t_ref_country_states (country_id,state_name,state_code,date_added,added_by)
SELECT (select id from static.t_ref_countries where country='United States of America')
     ,'Connecticut','CT',now(),'nidhish' WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_country_states
WHERE country_id=(select id from static.t_ref_countries where country='United States of America')
and state_code ='CT'
);
INSERT INTO static.t_ref_country_states (country_id,state_name,state_code,date_added,added_by)
SELECT (select id from static.t_ref_countries where country='United States of America')
     ,'Delaware','DE',now(),'nidhish' WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_country_states
WHERE country_id=(select id from static.t_ref_countries where country='United States of America')
and state_code ='DE'
);
INSERT INTO static.t_ref_country_states (country_id,state_name,state_code,date_added,added_by)
SELECT (select id from static.t_ref_countries where country='United States of America')
     ,'District Of Columbia','DC',now(),'nidhish' WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_country_states
WHERE country_id=(select id from static.t_ref_countries where country='United States of America')
and state_code ='DC'
);
INSERT INTO static.t_ref_country_states (country_id,state_name,state_code,date_added,added_by)
SELECT (select id from static.t_ref_countries where country='United States of America')
     ,'Federated States Of Micronesia','FM',now(),'nidhish' WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_country_states
WHERE country_id=(select id from static.t_ref_countries where country='United States of America')
and state_code ='FM'
);
INSERT INTO static.t_ref_country_states (country_id,state_name,state_code,date_added,added_by)
SELECT (select id from static.t_ref_countries where country='United States of America')
     ,'Florida','FL',now(),'nidhish' WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_country_states
WHERE country_id=(select id from static.t_ref_countries where country='United States of America')
and state_code ='FL'
);
INSERT INTO static.t_ref_country_states (country_id,state_name,state_code,date_added,added_by)
SELECT (select id from static.t_ref_countries where country='United States of America')
     ,'Georgia','GA',now(),'nidhish' WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_country_states
WHERE country_id=(select id from static.t_ref_countries where country='United States of America')
and state_code ='GA'
);
INSERT INTO static.t_ref_country_states (country_id,state_name,state_code,date_added,added_by)
SELECT (select id from static.t_ref_countries where country='United States of America')
     ,'Guam','GU',now(),'nidhish' WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_country_states
WHERE country_id=(select id from static.t_ref_countries where country='United States of America')
and state_code ='GU'
);
INSERT INTO static.t_ref_country_states (country_id,state_name,state_code,date_added,added_by)
SELECT (select id from static.t_ref_countries where country='United States of America')
     ,'Hawaii','HI',now(),'nidhish' WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_country_states
WHERE country_id=(select id from static.t_ref_countries where country='United States of America')
and state_code ='HI'
);
INSERT INTO static.t_ref_country_states (country_id,state_name,state_code,date_added,added_by)
SELECT (select id from static.t_ref_countries where country='United States of America')
     ,'Idaho','ID',now(),'nidhish' WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_country_states
WHERE country_id=(select id from static.t_ref_countries where country='United States of America')
and state_code ='ID'
);
INSERT INTO static.t_ref_country_states (country_id,state_name,state_code,date_added,added_by)
SELECT (select id from static.t_ref_countries where country='United States of America')
     ,'Illinois','IL',now(),'nidhish' WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_country_states
WHERE country_id=(select id from static.t_ref_countries where country='United States of America')
and state_code ='IL'
);
INSERT INTO static.t_ref_country_states (country_id,state_name,state_code,date_added,added_by)
SELECT (select id from static.t_ref_countries where country='United States of America')
     ,'Indiana','IN',now(),'nidhish' WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_country_states
WHERE country_id=(select id from static.t_ref_countries where country='United States of America')
and state_code ='IN'
);
INSERT INTO static.t_ref_country_states (country_id,state_name,state_code,date_added,added_by)
SELECT (select id from static.t_ref_countries where country='United States of America')
     ,'Iowa','IA',now(),'nidhish' WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_country_states
WHERE country_id=(select id from static.t_ref_countries where country='United States of America')
and state_code ='IA'
);
INSERT INTO static.t_ref_country_states (country_id,state_name,state_code,date_added,added_by)
SELECT (select id from static.t_ref_countries where country='United States of America')
     ,'Kansas','KS',now(),'nidhish' WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_country_states
WHERE country_id=(select id from static.t_ref_countries where country='United States of America')
and state_code ='KS'
);
INSERT INTO static.t_ref_country_states (country_id,state_name,state_code,date_added,added_by)
SELECT (select id from static.t_ref_countries where country='United States of America')
     ,'Kentucky','KY',now(),'nidhish' WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_country_states
WHERE country_id=(select id from static.t_ref_countries where country='United States of America')
and state_code ='KY'
);
INSERT INTO static.t_ref_country_states (country_id,state_name,state_code,date_added,added_by)
SELECT (select id from static.t_ref_countries where country='United States of America')
     ,'Louisiana','LA',now(),'nidhish' WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_country_states
WHERE country_id=(select id from static.t_ref_countries where country='United States of America')
and state_code ='LA'
);
INSERT INTO static.t_ref_country_states (country_id,state_name,state_code,date_added,added_by)
SELECT (select id from static.t_ref_countries where country='United States of America')
     ,'Maine','ME',now(),'nidhish' WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_country_states
WHERE country_id=(select id from static.t_ref_countries where country='United States of America')
and state_code ='ME'
);
INSERT INTO static.t_ref_country_states (country_id,state_name,state_code,date_added,added_by)
SELECT (select id from static.t_ref_countries where country='United States of America')
     ,'Marshall Islands','MH',now(),'nidhish' WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_country_states
WHERE country_id=(select id from static.t_ref_countries where country='United States of America')
and state_code ='MH'
);
INSERT INTO static.t_ref_country_states (country_id,state_name,state_code,date_added,added_by)
SELECT (select id from static.t_ref_countries where country='United States of America')
     ,'Maryland','MD',now(),'nidhish' WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_country_states
WHERE country_id=(select id from static.t_ref_countries where country='United States of America')
and state_code ='MD'
);
INSERT INTO static.t_ref_country_states (country_id,state_name,state_code,date_added,added_by)
SELECT (select id from static.t_ref_countries where country='United States of America')
     ,'Massachusetts','MS',now(),'nidhish' WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_country_states
WHERE country_id=(select id from static.t_ref_countries where country='United States of America')
and state_code ='MS'
);
INSERT INTO static.t_ref_country_states (country_id,state_name,state_code,date_added,added_by)
SELECT (select id from static.t_ref_countries where country='United States of America')
     ,'Michigan','MI',now(),'nidhish' WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_country_states
WHERE country_id=(select id from static.t_ref_countries where country='United States of America')
and state_code ='MI'
);
INSERT INTO static.t_ref_country_states (country_id,state_name,state_code,date_added,added_by)
SELECT (select id from static.t_ref_countries where country='United States of America')
     ,'Minnesota','MN',now(),'nidhish' WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_country_states
WHERE country_id=(select id from static.t_ref_countries where country='United States of America')
and state_code ='MN'
);
INSERT INTO static.t_ref_country_states (country_id,state_name,state_code,date_added,added_by)
SELECT (select id from static.t_ref_countries where country='United States of America')
     ,'Mississippi','MS',now(),'nidhish' WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_country_states
WHERE country_id=(select id from static.t_ref_countries where country='United States of America')
and state_code ='MS'
);
INSERT INTO static.t_ref_country_states (country_id,state_name,state_code,date_added,added_by)
SELECT (select id from static.t_ref_countries where country='United States of America')
     ,'Missouri','MO',now(),'nidhish' WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_country_states
WHERE country_id=(select id from static.t_ref_countries where country='United States of America')
and state_code ='MO'
);
INSERT INTO static.t_ref_country_states (country_id,state_name,state_code,date_added,added_by)
SELECT (select id from static.t_ref_countries where country='United States of America')
     ,'Montana','MT',now(),'nidhish' WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_country_states
WHERE country_id=(select id from static.t_ref_countries where country='United States of America')
and state_code ='MT'
);
INSERT INTO static.t_ref_country_states (country_id,state_name,state_code,date_added,added_by)
SELECT (select id from static.t_ref_countries where country='United States of America')
     ,'Nebraska','NE',now(),'nidhish' WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_country_states
WHERE country_id=(select id from static.t_ref_countries where country='United States of America')
and state_code ='NE'
);
INSERT INTO static.t_ref_country_states (country_id,state_name,state_code,date_added,added_by)
SELECT (select id from static.t_ref_countries where country='United States of America')
     ,'Nevada','NV',now(),'nidhish' WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_country_states
WHERE country_id=(select id from static.t_ref_countries where country='United States of America')
and state_code ='NV'
);
INSERT INTO static.t_ref_country_states (country_id,state_name,state_code,date_added,added_by)
SELECT (select id from static.t_ref_countries where country='United States of America')
     ,'New Hampshire','NH',now(),'nidhish' WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_country_states
WHERE country_id=(select id from static.t_ref_countries where country='United States of America')
and state_code ='NH'
);
INSERT INTO static.t_ref_country_states (country_id,state_name,state_code,date_added,added_by)
SELECT (select id from static.t_ref_countries where country='United States of America')
     ,'New Jersey','NJ',now(),'nidhish' WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_country_states
WHERE country_id=(select id from static.t_ref_countries where country='United States of America')
and state_code ='NJ'
);
INSERT INTO static.t_ref_country_states (country_id,state_name,state_code,date_added,added_by)
SELECT (select id from static.t_ref_countries where country='United States of America')
     ,'New Mexico','NM',now(),'nidhish' WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_country_states
WHERE country_id=(select id from static.t_ref_countries where country='United States of America')
and state_code ='NM'
);
INSERT INTO static.t_ref_country_states (country_id,state_name,state_code,date_added,added_by)
SELECT (select id from static.t_ref_countries where country='United States of America')
     ,'New York','NY',now(),'nidhish' WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_country_states
WHERE country_id=(select id from static.t_ref_countries where country='United States of America')
and state_code ='NY'
);
INSERT INTO static.t_ref_country_states (country_id,state_name,state_code,date_added,added_by)
SELECT (select id from static.t_ref_countries where country='United States of America')
     ,'North Carolina','NC',now(),'nidhish' WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_country_states
WHERE country_id=(select id from static.t_ref_countries where country='United States of America')
and state_code ='NC'
);
INSERT INTO static.t_ref_country_states (country_id,state_name,state_code,date_added,added_by)
SELECT (select id from static.t_ref_countries where country='United States of America')
     ,'North Dakota','ND',now(),'nidhish' WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_country_states
WHERE country_id=(select id from static.t_ref_countries where country='United States of America')
and state_code ='ND'
);
INSERT INTO static.t_ref_country_states (country_id,state_name,state_code,date_added,added_by)
SELECT (select id from static.t_ref_countries where country='United States of America')
     ,'Northern Mariana Islands','MP',now(),'nidhish' WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_country_states
WHERE country_id=(select id from static.t_ref_countries where country='United States of America')
and state_code ='MP'
);
INSERT INTO static.t_ref_country_states (country_id,state_name,state_code,date_added,added_by)
SELECT (select id from static.t_ref_countries where country='United States of America')
     ,'Ohio','OH',now(),'nidhish' WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_country_states
WHERE country_id=(select id from static.t_ref_countries where country='United States of America')
and state_code ='OH'
);
INSERT INTO static.t_ref_country_states (country_id,state_name,state_code,date_added,added_by)
SELECT (select id from static.t_ref_countries where country='United States of America')
     ,'Oklahoma','OK',now(),'nidhish' WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_country_states
WHERE country_id=(select id from static.t_ref_countries where country='United States of America')
and state_code ='OK'
);
INSERT INTO static.t_ref_country_states (country_id,state_name,state_code,date_added,added_by)
SELECT (select id from static.t_ref_countries where country='United States of America')
     ,'Oregon','OR',now(),'nidhish' WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_country_states
WHERE country_id=(select id from static.t_ref_countries where country='United States of America')
and state_code ='OR'
);
INSERT INTO static.t_ref_country_states (country_id,state_name,state_code,date_added,added_by)
SELECT (select id from static.t_ref_countries where country='United States of America')
     ,'Palau','PW',now(),'nidhish' WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_country_states
WHERE country_id=(select id from static.t_ref_countries where country='United States of America')
and state_code ='PW'
);
INSERT INTO static.t_ref_country_states (country_id,state_name,state_code,date_added,added_by)
SELECT (select id from static.t_ref_countries where country='United States of America')
     ,'Pennsylvania','PA',now(),'nidhish' WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_country_states
WHERE country_id=(select id from static.t_ref_countries where country='United States of America')
and state_code ='PA'
);
INSERT INTO static.t_ref_country_states (country_id,state_name,state_code,date_added,added_by)
SELECT (select id from static.t_ref_countries where country='United States of America')
     ,'Puerto Rico','PR',now(),'nidhish' WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_country_states
WHERE country_id=(select id from static.t_ref_countries where country='United States of America')
and state_code ='PR'
);
INSERT INTO static.t_ref_country_states (country_id,state_name,state_code,date_added,added_by)
SELECT (select id from static.t_ref_countries where country='United States of America')
     ,'Rhode Island','RI',now(),'nidhish' WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_country_states
WHERE country_id=(select id from static.t_ref_countries where country='United States of America')
and state_code ='RI'
);
INSERT INTO static.t_ref_country_states (country_id,state_name,state_code,date_added,added_by)
SELECT (select id from static.t_ref_countries where country='United States of America')
     ,'South Carolina','SC',now(),'nidhish' WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_country_states
WHERE country_id=(select id from static.t_ref_countries where country='United States of America')
and state_code ='SC'
);
INSERT INTO static.t_ref_country_states (country_id,state_name,state_code,date_added,added_by)
SELECT (select id from static.t_ref_countries where country='United States of America')
     ,'South Dakota','SD',now(),'nidhish' WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_country_states
WHERE country_id=(select id from static.t_ref_countries where country='United States of America')
and state_code ='SD'
);
INSERT INTO static.t_ref_country_states (country_id,state_name,state_code,date_added,added_by)
SELECT (select id from static.t_ref_countries where country='United States of America')
     ,'Tennessee','TN',now(),'nidhish' WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_country_states
WHERE country_id=(select id from static.t_ref_countries where country='United States of America')
and state_code ='TN'
);
INSERT INTO static.t_ref_country_states (country_id,state_name,state_code,date_added,added_by)
SELECT (select id from static.t_ref_countries where country='United States of America')
     ,'Texas','TX',now(),'nidhish' WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_country_states
WHERE country_id=(select id from static.t_ref_countries where country='United States of America')
and state_code ='TX'
);
INSERT INTO static.t_ref_country_states (country_id,state_name,state_code,date_added,added_by)
SELECT (select id from static.t_ref_countries where country='United States of America')
     ,'Utah','UT',now(),'nidhish' WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_country_states
WHERE country_id=(select id from static.t_ref_countries where country='United States of America')
and state_code ='UT'
);
INSERT INTO static.t_ref_country_states (country_id,state_name,state_code,date_added,added_by)
SELECT (select id from static.t_ref_countries where country='United States of America')
     ,'Vermont','VT',now(),'nidhish' WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_country_states
WHERE country_id=(select id from static.t_ref_countries where country='United States of America')
and state_code ='VT'
);
INSERT INTO static.t_ref_country_states (country_id,state_name,state_code,date_added,added_by)
SELECT (select id from static.t_ref_countries where country='United States of America')
     ,'Virgin Islands','VI',now(),'nidhish' WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_country_states
WHERE country_id=(select id from static.t_ref_countries where country='United States of America')
and state_code ='VI'
);
INSERT INTO static.t_ref_country_states (country_id,state_name,state_code,date_added,added_by)
SELECT (select id from static.t_ref_countries where country='United States of America')
     ,'Virginia','VA',now(),'nidhish' WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_country_states
WHERE country_id=(select id from static.t_ref_countries where country='United States of America')
and state_code ='VA'
);
INSERT INTO static.t_ref_country_states (country_id,state_name,state_code,date_added,added_by)
SELECT (select id from static.t_ref_countries where country='United States of America')
     ,'Washington','WA',now(),'nidhish' WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_country_states
WHERE country_id=(select id from static.t_ref_countries where country='United States of America')
and state_code ='WA'
);
INSERT INTO static.t_ref_country_states (country_id,state_name,state_code,date_added,added_by)
SELECT (select id from static.t_ref_countries where country='United States of America')
     ,'West Virginia','WV',now(),'nidhish' WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_country_states
WHERE country_id=(select id from static.t_ref_countries where country='United States of America')
and state_code ='WV'
);
INSERT INTO static.t_ref_country_states (country_id,state_name,state_code,date_added,added_by)
SELECT (select id from static.t_ref_countries where country='United States of America')
     ,'Wisconsin','WI',now(),'nidhish' WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_country_states
WHERE country_id=(select id from static.t_ref_countries where country='United States of America')
and state_code ='WI'
);
INSERT INTO static.t_ref_country_states (country_id,state_name,state_code,date_added,added_by)
SELECT (select id from static.t_ref_countries where country='United States of America')
     ,'Wyoming','WY',now(),'nidhish' WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_country_states
WHERE country_id=(select id from static.t_ref_countries where country='United States of America')
and state_code ='WY'
);


insert into static.t_ref_countries (id,country,iso_code,region_id,country_code)
SELECT (select max(id)+1 from static.t_ref_countries ),
       'England','ENG',16,'ENG' WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_countries WHERE country='England');

insert into static.t_ref_countries (id,country,iso_code,region_id,country_code)
SELECT (select max(id)+1 from static.t_ref_countries ),
       'Scotland','SCT',16,'SCT' WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_countries WHERE country='Scotland');

insert into static.t_ref_countries (id,country,iso_code,region_id,country_code)
SELECT (select max(id)+1 from static.t_ref_countries ),
       'Wales','WLS',16,'WLS' WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_countries WHERE country='Wales');

insert into static.t_ref_countries (id,country,iso_code,region_id,country_code)
SELECT (select max(id)+1 from static.t_ref_countries ),
       'Northern Ireland','NIR',16,'NIR' WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_countries WHERE country='Northern Ireland');


INSERT INTO static.t_ref_country_states (country_id,state_name,state_code,date_added,added_by)
SELECT (select id from static.t_ref_countries where country='England')
     ,'Avon','AVN',now(),'nidhish' WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_country_states WHERE country_id=
(select id from static.t_ref_countries where country='England') and state_code ='AVN'
);
INSERT INTO static.t_ref_country_states (country_id,state_name,state_code,date_added,added_by)
SELECT (select id from static.t_ref_countries where country='England')
     ,'Bedfordshire','BDF',now(),'nidhish' WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_country_states WHERE country_id=
(select id from static.t_ref_countries where country='England') and state_code ='BDF'
);
INSERT INTO static.t_ref_country_states (country_id,state_name,state_code,date_added,added_by)
SELECT (select id from static.t_ref_countries where country='England')
     ,'Berkshire','BRK',now(),'nidhish' WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_country_states WHERE country_id=
(select id from static.t_ref_countries where country='England') and state_code ='BRK'
);
INSERT INTO static.t_ref_country_states (country_id,state_name,state_code,date_added,added_by)
SELECT (select id from static.t_ref_countries where country='England')
     ,'Buckinghamshire','BKM',now(),'nidhish' WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_country_states WHERE country_id=
(select id from static.t_ref_countries where country='England') and state_code ='BKM'
);
INSERT INTO static.t_ref_country_states (country_id,state_name,state_code,date_added,added_by)
SELECT (select id from static.t_ref_countries where country='England')
     ,'Cambridgeshire','CAM',now(),'nidhish' WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_country_states WHERE country_id=
(select id from static.t_ref_countries where country='England') and state_code ='CAM'
);
INSERT INTO static.t_ref_country_states (country_id,state_name,state_code,date_added,added_by)
SELECT (select id from static.t_ref_countries where country='England')
     ,'Cheshire','CHS',now(),'nidhish' WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_country_states WHERE country_id=
(select id from static.t_ref_countries where country='England') and state_code ='CHS'
);
INSERT INTO static.t_ref_country_states (country_id,state_name,state_code,date_added,added_by)
SELECT (select id from static.t_ref_countries where country='England')
     ,'Cleveland','CLV',now(),'nidhish' WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_country_states WHERE country_id=
(select id from static.t_ref_countries where country='England') and state_code ='CLV'
);
INSERT INTO static.t_ref_country_states (country_id,state_name,state_code,date_added,added_by)
SELECT (select id from static.t_ref_countries where country='England')
     ,'Cornwall','CON',now(),'nidhish' WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_country_states WHERE country_id=
(select id from static.t_ref_countries where country='England') and state_code ='CON'
);
INSERT INTO static.t_ref_country_states (country_id,state_name,state_code,date_added,added_by)
SELECT (select id from static.t_ref_countries where country='England')
     ,'Cumbria','CMA',now(),'nidhish' WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_country_states WHERE country_id=
(select id from static.t_ref_countries where country='England') and state_code ='CMA'
);
INSERT INTO static.t_ref_country_states (country_id,state_name,state_code,date_added,added_by)
SELECT (select id from static.t_ref_countries where country='England')
     ,'Derbyshire','DBY',now(),'nidhish' WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_country_states WHERE country_id=
(select id from static.t_ref_countries where country='England') and state_code ='DBY'
);
INSERT INTO static.t_ref_country_states (country_id,state_name,state_code,date_added,added_by)
SELECT (select id from static.t_ref_countries where country='England')
     ,'Devon','DEV',now(),'nidhish' WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_country_states WHERE country_id=
(select id from static.t_ref_countries where country='England') and state_code ='DEV'
);
INSERT INTO static.t_ref_country_states (country_id,state_name,state_code,date_added,added_by)
SELECT (select id from static.t_ref_countries where country='England')
     ,'Dorset','DOR',now(),'nidhish' WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_country_states WHERE country_id=
(select id from static.t_ref_countries where country='England') and state_code ='DOR'
);
INSERT INTO static.t_ref_country_states (country_id,state_name,state_code,date_added,added_by)
SELECT (select id from static.t_ref_countries where country='England')
     ,'Durham','DUR',now(),'nidhish' WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_country_states WHERE country_id=
(select id from static.t_ref_countries where country='England') and state_code ='DUR'
);
INSERT INTO static.t_ref_country_states (country_id,state_name,state_code,date_added,added_by)
SELECT (select id from static.t_ref_countries where country='England')
     ,'East Sussex','SXE',now(),'nidhish' WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_country_states WHERE country_id=
(select id from static.t_ref_countries where country='England') and state_code ='SXE'
);
INSERT INTO static.t_ref_country_states (country_id,state_name,state_code,date_added,added_by)
SELECT (select id from static.t_ref_countries where country='England')
     ,'Essex','ESS',now(),'nidhish' WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_country_states WHERE country_id=
(select id from static.t_ref_countries where country='England') and state_code ='ESS'
);
INSERT INTO static.t_ref_country_states (country_id,state_name,state_code,date_added,added_by)
SELECT (select id from static.t_ref_countries where country='England')
     ,'Gloucestershire','GLS',now(),'nidhish' WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_country_states WHERE country_id=
(select id from static.t_ref_countries where country='England') and state_code ='GLS'
);
INSERT INTO static.t_ref_country_states (country_id,state_name,state_code,date_added,added_by)
SELECT (select id from static.t_ref_countries where country='England')
     ,'Hampshire','HAM',now(),'nidhish' WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_country_states WHERE country_id=
(select id from static.t_ref_countries where country='England') and state_code ='HAM'
);
INSERT INTO static.t_ref_country_states (country_id,state_name,state_code,date_added,added_by)
SELECT (select id from static.t_ref_countries where country='England')
     ,'Herefordshire','HEF',now(),'nidhish' WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_country_states WHERE country_id=
(select id from static.t_ref_countries where country='England') and state_code ='HEF'
);
INSERT INTO static.t_ref_country_states (country_id,state_name,state_code,date_added,added_by)
SELECT (select id from static.t_ref_countries where country='England')
     ,'Hertfordshire','HRT',now(),'nidhish' WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_country_states WHERE country_id=
(select id from static.t_ref_countries where country='England') and state_code ='HRT'
);
INSERT INTO static.t_ref_country_states (country_id,state_name,state_code,date_added,added_by)
SELECT (select id from static.t_ref_countries where country='England')
     ,'Isle of Wight','IOW',now(),'nidhish' WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_country_states WHERE country_id=
(select id from static.t_ref_countries where country='England') and state_code ='IOW'
);
INSERT INTO static.t_ref_country_states (country_id,state_name,state_code,date_added,added_by)
SELECT (select id from static.t_ref_countries where country='England')
     ,'Kent','KEN',now(),'nidhish' WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_country_states WHERE country_id=
(select id from static.t_ref_countries where country='England') and state_code ='KEN'
);
INSERT INTO static.t_ref_country_states (country_id,state_name,state_code,date_added,added_by)
SELECT (select id from static.t_ref_countries where country='England')
     ,'Lancashire','LAN',now(),'nidhish' WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_country_states WHERE country_id=
(select id from static.t_ref_countries where country='England') and state_code ='LAN'
);
INSERT INTO static.t_ref_country_states (country_id,state_name,state_code,date_added,added_by)
SELECT (select id from static.t_ref_countries where country='England')
     ,'Leicestershire','LEI',now(),'nidhish' WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_country_states WHERE country_id=
(select id from static.t_ref_countries where country='England') and state_code ='LEI'
);
INSERT INTO static.t_ref_country_states (country_id,state_name,state_code,date_added,added_by)
SELECT (select id from static.t_ref_countries where country='England')
     ,'Lincolnshire','LIN',now(),'nidhish' WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_country_states WHERE country_id=
(select id from static.t_ref_countries where country='England') and state_code ='LIN'
);
INSERT INTO static.t_ref_country_states (country_id,state_name,state_code,date_added,added_by)
SELECT (select id from static.t_ref_countries where country='England')
     ,'London','LDN',now(),'nidhish' WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_country_states WHERE country_id=
(select id from static.t_ref_countries where country='England') and state_code ='LDN'
);
INSERT INTO static.t_ref_country_states (country_id,state_name,state_code,date_added,added_by)
SELECT (select id from static.t_ref_countries where country='England')
     ,'Merseyside','MSY',now(),'nidhish' WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_country_states WHERE country_id=
(select id from static.t_ref_countries where country='England') and state_code ='MSY'
);
INSERT INTO static.t_ref_country_states (country_id,state_name,state_code,date_added,added_by)
SELECT (select id from static.t_ref_countries where country='England')
     ,'Norfolk','NFK',now(),'nidhish' WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_country_states WHERE country_id=
(select id from static.t_ref_countries where country='England') and state_code ='NFK'
);
INSERT INTO static.t_ref_country_states (country_id,state_name,state_code,date_added,added_by)
SELECT (select id from static.t_ref_countries where country='England')
     ,'Northamptonshire','NTH',now(),'nidhish' WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_country_states WHERE country_id=
(select id from static.t_ref_countries where country='England') and state_code ='NTH'
);
INSERT INTO static.t_ref_country_states (country_id,state_name,state_code,date_added,added_by)
SELECT (select id from static.t_ref_countries where country='England')
     ,'Northumberland','NBL',now(),'nidhish' WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_country_states WHERE country_id=
(select id from static.t_ref_countries where country='England') and state_code ='NBL'
);
INSERT INTO static.t_ref_country_states (country_id,state_name,state_code,date_added,added_by)
SELECT (select id from static.t_ref_countries where country='England')
     ,'North Yorkshire','NYK',now(),'nidhish' WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_country_states WHERE country_id=
(select id from static.t_ref_countries where country='England') and state_code ='NYK'
);
INSERT INTO static.t_ref_country_states (country_id,state_name,state_code,date_added,added_by)
SELECT (select id from static.t_ref_countries where country='England')
     ,'Nottinghamshire','NTT',now(),'nidhish' WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_country_states WHERE country_id=
(select id from static.t_ref_countries where country='England') and state_code ='NTT'
);
INSERT INTO static.t_ref_country_states (country_id,state_name,state_code,date_added,added_by)
SELECT (select id from static.t_ref_countries where country='England')
     ,'Oxfordshire','OXF',now(),'nidhish' WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_country_states WHERE country_id=
(select id from static.t_ref_countries where country='England') and state_code ='OXF'
);
INSERT INTO static.t_ref_country_states (country_id,state_name,state_code,date_added,added_by)
SELECT (select id from static.t_ref_countries where country='England')
     ,'Rutland','RUT',now(),'nidhish' WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_country_states WHERE country_id=
(select id from static.t_ref_countries where country='England') and state_code ='RUT'
);
INSERT INTO static.t_ref_country_states (country_id,state_name,state_code,date_added,added_by)
SELECT (select id from static.t_ref_countries where country='England')
     ,'Shropshire','SAL',now(),'nidhish' WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_country_states WHERE country_id=
(select id from static.t_ref_countries where country='England') and state_code ='SAL'
);
INSERT INTO static.t_ref_country_states (country_id,state_name,state_code,date_added,added_by)
SELECT (select id from static.t_ref_countries where country='England')
     ,'Somerset','SOM',now(),'nidhish' WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_country_states WHERE country_id=
(select id from static.t_ref_countries where country='England') and state_code ='SOM'
);
INSERT INTO static.t_ref_country_states (country_id,state_name,state_code,date_added,added_by)
SELECT (select id from static.t_ref_countries where country='England')
     ,'South Yorkshire','SYK',now(),'nidhish' WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_country_states WHERE country_id=
(select id from static.t_ref_countries where country='England') and state_code ='SYK'
);
INSERT INTO static.t_ref_country_states (country_id,state_name,state_code,date_added,added_by)
SELECT (select id from static.t_ref_countries where country='England')
     ,'Staffordshire','STS',now(),'nidhish' WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_country_states WHERE country_id=
(select id from static.t_ref_countries where country='England') and state_code ='STS'
);
INSERT INTO static.t_ref_country_states (country_id,state_name,state_code,date_added,added_by)
SELECT (select id from static.t_ref_countries where country='England')
     ,'Suffolk','SFK',now(),'nidhish' WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_country_states WHERE country_id=
(select id from static.t_ref_countries where country='England') and state_code ='SFK'
);
INSERT INTO static.t_ref_country_states (country_id,state_name,state_code,date_added,added_by)
SELECT (select id from static.t_ref_countries where country='England')
     ,'Surrey','SRY',now(),'nidhish' WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_country_states WHERE country_id=
(select id from static.t_ref_countries where country='England') and state_code ='SRY'
);
INSERT INTO static.t_ref_country_states (country_id,state_name,state_code,date_added,added_by)
SELECT (select id from static.t_ref_countries where country='England')
     ,'Tyne and Wear','TWR',now(),'nidhish' WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_country_states WHERE country_id=
(select id from static.t_ref_countries where country='England') and state_code ='TWR'
);
INSERT INTO static.t_ref_country_states (country_id,state_name,state_code,date_added,added_by)
SELECT (select id from static.t_ref_countries where country='England')
     ,'Warwickshire','WAR',now(),'nidhish' WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_country_states WHERE country_id=
(select id from static.t_ref_countries where country='England') and state_code ='WAR'
);
INSERT INTO static.t_ref_country_states (country_id,state_name,state_code,date_added,added_by)
SELECT (select id from static.t_ref_countries where country='England')
     ,'West Midlands','WMD',now(),'nidhish' WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_country_states WHERE country_id=
(select id from static.t_ref_countries where country='England') and state_code ='WMD'
);
INSERT INTO static.t_ref_country_states (country_id,state_name,state_code,date_added,added_by)
SELECT (select id from static.t_ref_countries where country='England')
     ,'West Sussex','SXW',now(),'nidhish' WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_country_states WHERE country_id=
(select id from static.t_ref_countries where country='England') and state_code ='SXW'
);
INSERT INTO static.t_ref_country_states (country_id,state_name,state_code,date_added,added_by)
SELECT (select id from static.t_ref_countries where country='England')
     ,'West Yorkshire','WYK',now(),'nidhish' WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_country_states WHERE country_id=
(select id from static.t_ref_countries where country='England') and state_code ='WYK'
);
INSERT INTO static.t_ref_country_states (country_id,state_name,state_code,date_added,added_by)
SELECT (select id from static.t_ref_countries where country='England')
     ,'Wiltshire','WIL',now(),'nidhish' WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_country_states WHERE country_id=
(select id from static.t_ref_countries where country='England') and state_code ='WIL'
);
INSERT INTO static.t_ref_country_states (country_id,state_name,state_code,date_added,added_by)
SELECT (select id from static.t_ref_countries where country='England')
     ,'Worcestershire','WOR',now(),'nidhish' WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_country_states WHERE country_id=
(select id from static.t_ref_countries where country='England') and state_code ='WOR'
);
INSERT INTO static.t_ref_country_states (country_id,state_name,state_code,date_added,added_by)
SELECT (select id from static.t_ref_countries where country='Wales')
     ,'Clwyd','CWD',now(),'nidhish' WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_country_states WHERE country_id=
(select id from static.t_ref_countries where country='Wales') and state_code ='CWD'
);
INSERT INTO static.t_ref_country_states (country_id,state_name,state_code,date_added,added_by)
SELECT (select id from static.t_ref_countries where country='Wales')
     ,'Dyfed','DFD',now(),'nidhish' WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_country_states WHERE country_id=
(select id from static.t_ref_countries where country='Wales') and state_code ='DFD'
);
INSERT INTO static.t_ref_country_states (country_id,state_name,state_code,date_added,added_by)
SELECT (select id from static.t_ref_countries where country='Wales')
     ,'Gwent','GNT',now(),'nidhish' WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_country_states WHERE country_id=
(select id from static.t_ref_countries where country='Wales') and state_code ='GNT'
);
INSERT INTO static.t_ref_country_states (country_id,state_name,state_code,date_added,added_by)
SELECT (select id from static.t_ref_countries where country='Wales')
     ,'Gwynedd','GWN',now(),'nidhish' WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_country_states WHERE country_id=
(select id from static.t_ref_countries where country='Wales') and state_code ='GWN'
);
INSERT INTO static.t_ref_country_states (country_id,state_name,state_code,date_added,added_by)
SELECT (select id from static.t_ref_countries where country='Wales')
     ,'Mid Glamorgan','MGM',now(),'nidhish' WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_country_states WHERE country_id=
(select id from static.t_ref_countries where country='Wales') and state_code ='MGM'
);
INSERT INTO static.t_ref_country_states (country_id,state_name,state_code,date_added,added_by)
SELECT (select id from static.t_ref_countries where country='Wales')
     ,'Powys','POW',now(),'nidhish' WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_country_states WHERE country_id=
(select id from static.t_ref_countries where country='Wales') and state_code ='POW'
);
INSERT INTO static.t_ref_country_states (country_id,state_name,state_code,date_added,added_by)
SELECT (select id from static.t_ref_countries where country='Wales')
     ,'South Glamorgan','SGM',now(),'nidhish' WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_country_states WHERE country_id=
(select id from static.t_ref_countries where country='Wales') and state_code ='SGM'
);
INSERT INTO static.t_ref_country_states (country_id,state_name,state_code,date_added,added_by)
SELECT (select id from static.t_ref_countries where country='Wales')
     ,'West Glamorgan','WGM',now(),'nidhish' WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_country_states WHERE country_id=
(select id from static.t_ref_countries where country='Wales') and state_code ='WGM'
);
INSERT INTO static.t_ref_country_states (country_id,state_name,state_code,date_added,added_by)
SELECT (select id from static.t_ref_countries where country='Scotland')
     ,'Aberdeenshire','ABD',now(),'nidhish' WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_country_states WHERE country_id=
(select id from static.t_ref_countries where country='Scotland') and state_code ='ABD'
);
INSERT INTO static.t_ref_country_states (country_id,state_name,state_code,date_added,added_by)
SELECT (select id from static.t_ref_countries where country='Scotland')
     ,'Angus','ANS',now(),'nidhish' WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_country_states WHERE country_id=
(select id from static.t_ref_countries where country='Scotland') and state_code ='ANS'
);
INSERT INTO static.t_ref_country_states (country_id,state_name,state_code,date_added,added_by)
SELECT (select id from static.t_ref_countries where country='Scotland')
     ,'Argyll','ARL',now(),'nidhish' WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_country_states WHERE country_id=
(select id from static.t_ref_countries where country='Scotland') and state_code ='ARL'
);
INSERT INTO static.t_ref_country_states (country_id,state_name,state_code,date_added,added_by)
SELECT (select id from static.t_ref_countries where country='Scotland')
     ,'Ayrshire','AYR',now(),'nidhish' WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_country_states WHERE country_id=
(select id from static.t_ref_countries where country='Scotland') and state_code ='AYR'
);
INSERT INTO static.t_ref_country_states (country_id,state_name,state_code,date_added,added_by)
SELECT (select id from static.t_ref_countries where country='Scotland')
     ,'Banffshire','BAN',now(),'nidhish' WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_country_states WHERE country_id=
(select id from static.t_ref_countries where country='Scotland') and state_code ='BAN'
);
INSERT INTO static.t_ref_country_states (country_id,state_name,state_code,date_added,added_by)
SELECT (select id from static.t_ref_countries where country='Scotland')
     ,'Berwickshire','BEW',now(),'nidhish' WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_country_states WHERE country_id=
(select id from static.t_ref_countries where country='Scotland') and state_code ='BEW'
);
INSERT INTO static.t_ref_country_states (country_id,state_name,state_code,date_added,added_by)
SELECT (select id from static.t_ref_countries where country='Scotland')
     ,'Bute','BUT',now(),'nidhish' WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_country_states WHERE country_id=
(select id from static.t_ref_countries where country='Scotland') and state_code ='BUT'
);
INSERT INTO static.t_ref_country_states (country_id,state_name,state_code,date_added,added_by)
SELECT (select id from static.t_ref_countries where country='Scotland')
     ,'Caithness','CAI',now(),'nidhish' WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_country_states WHERE country_id=
(select id from static.t_ref_countries where country='Scotland') and state_code ='CAI'
);
INSERT INTO static.t_ref_country_states (country_id,state_name,state_code,date_added,added_by)
SELECT (select id from static.t_ref_countries where country='Scotland')
     ,'Clackmannanshire','CLK',now(),'nidhish' WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_country_states WHERE country_id=
(select id from static.t_ref_countries where country='Scotland') and state_code ='CLK'
);
INSERT INTO static.t_ref_country_states (country_id,state_name,state_code,date_added,added_by)
SELECT (select id from static.t_ref_countries where country='Scotland')
     ,'Dumfriesshire','DGY',now(),'nidhish' WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_country_states WHERE country_id=
(select id from static.t_ref_countries where country='Scotland') and state_code ='DGY'
);
INSERT INTO static.t_ref_country_states (country_id,state_name,state_code,date_added,added_by)
SELECT (select id from static.t_ref_countries where country='Scotland')
     ,'Dunbartonshire','DNB',now(),'nidhish' WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_country_states WHERE country_id=
(select id from static.t_ref_countries where country='Scotland') and state_code ='DNB'
);
INSERT INTO static.t_ref_country_states (country_id,state_name,state_code,date_added,added_by)
SELECT (select id from static.t_ref_countries where country='Scotland')
     ,'East Lothian','ELN',now(),'nidhish' WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_country_states WHERE country_id=
(select id from static.t_ref_countries where country='Scotland') and state_code ='ELN'
);
INSERT INTO static.t_ref_country_states (country_id,state_name,state_code,date_added,added_by)
SELECT (select id from static.t_ref_countries where country='Scotland')
     ,'Fife','FIF',now(),'nidhish' WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_country_states WHERE country_id=
(select id from static.t_ref_countries where country='Scotland') and state_code ='FIF'
);
INSERT INTO static.t_ref_country_states (country_id,state_name,state_code,date_added,added_by)
SELECT (select id from static.t_ref_countries where country='Scotland')
     ,'Inverness-shire','INV',now(),'nidhish' WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_country_states WHERE country_id=
(select id from static.t_ref_countries where country='Scotland') and state_code ='INV'
);
INSERT INTO static.t_ref_country_states (country_id,state_name,state_code,date_added,added_by)
SELECT (select id from static.t_ref_countries where country='Scotland')
     ,'Kincardineshire','KCD',now(),'nidhish' WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_country_states WHERE country_id=
(select id from static.t_ref_countries where country='Scotland') and state_code ='KCD'
);
INSERT INTO static.t_ref_country_states (country_id,state_name,state_code,date_added,added_by)
SELECT (select id from static.t_ref_countries where country='Scotland')
     ,'Kinross-shire','KRS',now(),'nidhish' WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_country_states WHERE country_id=
(select id from static.t_ref_countries where country='Scotland') and state_code ='KRS'
);
INSERT INTO static.t_ref_country_states (country_id,state_name,state_code,date_added,added_by)
SELECT (select id from static.t_ref_countries where country='Scotland')
     ,'Kirkcudbrightshire','KKD',now(),'nidhish' WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_country_states WHERE country_id=
(select id from static.t_ref_countries where country='Scotland') and state_code ='KKD'
);
INSERT INTO static.t_ref_country_states (country_id,state_name,state_code,date_added,added_by)
SELECT (select id from static.t_ref_countries where country='Scotland')
     ,'Lanarkshire','LKS',now(),'nidhish' WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_country_states WHERE country_id=
(select id from static.t_ref_countries where country='Scotland') and state_code ='LKS'
);
INSERT INTO static.t_ref_country_states (country_id,state_name,state_code,date_added,added_by)
SELECT (select id from static.t_ref_countries where country='Scotland')
     ,'Midlothian','MLN',now(),'nidhish' WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_country_states WHERE country_id=
(select id from static.t_ref_countries where country='Scotland') and state_code ='MLN'
);
INSERT INTO static.t_ref_country_states (country_id,state_name,state_code,date_added,added_by)
SELECT (select id from static.t_ref_countries where country='Scotland')
     ,'Moray','MOR',now(),'nidhish' WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_country_states WHERE country_id=
(select id from static.t_ref_countries where country='Scotland') and state_code ='MOR'
);
INSERT INTO static.t_ref_country_states (country_id,state_name,state_code,date_added,added_by)
SELECT (select id from static.t_ref_countries where country='Scotland')
     ,'Nairnshire','NAI',now(),'nidhish' WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_country_states WHERE country_id=
(select id from static.t_ref_countries where country='Scotland') and state_code ='NAI'
);
INSERT INTO static.t_ref_country_states (country_id,state_name,state_code,date_added,added_by)
SELECT (select id from static.t_ref_countries where country='Scotland')
     ,'Orkney','OKI',now(),'nidhish' WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_country_states WHERE country_id=
(select id from static.t_ref_countries where country='Scotland') and state_code ='OKI'
);
INSERT INTO static.t_ref_country_states (country_id,state_name,state_code,date_added,added_by)
SELECT (select id from static.t_ref_countries where country='Scotland')
     ,'Peeblesshire','PEE',now(),'nidhish' WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_country_states WHERE country_id=
(select id from static.t_ref_countries where country='Scotland') and state_code ='PEE'
);
INSERT INTO static.t_ref_country_states (country_id,state_name,state_code,date_added,added_by)
SELECT (select id from static.t_ref_countries where country='Scotland')
     ,'Perthshire','PER',now(),'nidhish' WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_country_states WHERE country_id=
(select id from static.t_ref_countries where country='Scotland') and state_code ='PER'
);
INSERT INTO static.t_ref_country_states (country_id,state_name,state_code,date_added,added_by)
SELECT (select id from static.t_ref_countries where country='Scotland')
     ,'Renfrewshire','RFW',now(),'nidhish' WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_country_states WHERE country_id=
(select id from static.t_ref_countries where country='Scotland') and state_code ='RFW'
);
INSERT INTO static.t_ref_country_states (country_id,state_name,state_code,date_added,added_by)
SELECT (select id from static.t_ref_countries where country='Scotland')
     ,'Ross-shire','ROC',now(),'nidhish' WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_country_states WHERE country_id=
(select id from static.t_ref_countries where country='Scotland') and state_code ='ROC'
);
INSERT INTO static.t_ref_country_states (country_id,state_name,state_code,date_added,added_by)
SELECT (select id from static.t_ref_countries where country='Scotland')
     ,'Roxburghshire','ROX',now(),'nidhish' WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_country_states WHERE country_id=
(select id from static.t_ref_countries where country='Scotland') and state_code ='ROX'
);
INSERT INTO static.t_ref_country_states (country_id,state_name,state_code,date_added,added_by)
SELECT (select id from static.t_ref_countries where country='Scotland')
     ,'Selkirkshire','SEL',now(),'nidhish' WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_country_states WHERE country_id=
(select id from static.t_ref_countries where country='Scotland') and state_code ='SEL'
);
INSERT INTO static.t_ref_country_states (country_id,state_name,state_code,date_added,added_by)
SELECT (select id from static.t_ref_countries where country='Scotland')
     ,'Shetland','SHI',now(),'nidhish' WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_country_states WHERE country_id=
(select id from static.t_ref_countries where country='Scotland') and state_code ='SHI'
);
INSERT INTO static.t_ref_country_states (country_id,state_name,state_code,date_added,added_by)
SELECT (select id from static.t_ref_countries where country='Scotland')
     ,'Stirlingshire','STI',now(),'nidhish' WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_country_states WHERE country_id=
(select id from static.t_ref_countries where country='Scotland') and state_code ='STI'
);
INSERT INTO static.t_ref_country_states (country_id,state_name,state_code,date_added,added_by)
SELECT (select id from static.t_ref_countries where country='Scotland')
     ,'Sutherland','SUT',now(),'nidhish' WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_country_states WHERE country_id=
(select id from static.t_ref_countries where country='Scotland') and state_code ='SUT'
);
INSERT INTO static.t_ref_country_states (country_id,state_name,state_code,date_added,added_by)
SELECT (select id from static.t_ref_countries where country='Scotland')
     ,'West Lothian','WLN',now(),'nidhish' WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_country_states WHERE country_id=
(select id from static.t_ref_countries where country='Scotland') and state_code ='WLN'
);
INSERT INTO static.t_ref_country_states (country_id,state_name,state_code,date_added,added_by)
SELECT (select id from static.t_ref_countries where country='Scotland')
     ,'Wigtownshire','WIG',now(),'nidhish' WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_country_states WHERE country_id=
(select id from static.t_ref_countries where country='Scotland') and state_code ='WIG'
);
INSERT INTO static.t_ref_country_states (country_id,state_name,state_code,date_added,added_by)
SELECT (select id from static.t_ref_countries where country='Northern Ireland')
     ,'Antrim','ANT',now(),'nidhish' WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_country_states WHERE country_id=
(select id from static.t_ref_countries where country='Northern Ireland') and state_code ='ANT'
);
INSERT INTO static.t_ref_country_states (country_id,state_name,state_code,date_added,added_by)
SELECT (select id from static.t_ref_countries where country='Northern Ireland')
     ,'Armagh','ARM',now(),'nidhish' WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_country_states WHERE country_id=
(select id from static.t_ref_countries where country='Northern Ireland') and state_code ='ARM'
);
INSERT INTO static.t_ref_country_states (country_id,state_name,state_code,date_added,added_by)
SELECT (select id from static.t_ref_countries where country='Northern Ireland')
     ,'Down','DOW',now(),'nidhish' WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_country_states WHERE country_id=
(select id from static.t_ref_countries where country='Northern Ireland') and state_code ='DOW'
);
INSERT INTO static.t_ref_country_states (country_id,state_name,state_code,date_added,added_by)
SELECT (select id from static.t_ref_countries where country='Northern Ireland')
     ,'Fermanagh','FER',now(),'nidhish' WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_country_states WHERE country_id=
(select id from static.t_ref_countries where country='Northern Ireland') and state_code ='FER'
);
INSERT INTO static.t_ref_country_states (country_id,state_name,state_code,date_added,added_by)
SELECT (select id from static.t_ref_countries where country='Northern Ireland')
     ,'Londonderry','LDY',now(),'nidhish' WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_country_states WHERE country_id=
(select id from static.t_ref_countries where country='Northern Ireland') and state_code ='LDY'
);
INSERT INTO static.t_ref_country_states (country_id,state_name,state_code,date_added,added_by)
SELECT (select id from static.t_ref_countries where country='Northern Ireland')
     ,'Tyrone','TYR',now(),'nidhish' WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_country_states WHERE country_id=
(select id from static.t_ref_countries where country='Northern Ireland') and state_code ='TYR'
);

create table if not exists static.t_ref_country_child
(
    id serial not null primary key
    ,parent_country_id		 	integer
    ,child_country_id			integer
    ,date_added					timestamp
    ,added_by					varchar(100)
    ,date_modified				timestamp
    ,modified_by				varchar(100)
    ,CONSTRAINT fk_t_ref_country_groups_parent_country_id FOREIGN KEY (parent_country_id) REFERENCES static.t_ref_countries(id)
    ,CONSTRAINT fk_t_ref_country_groups_child_country_id FOREIGN KEY (child_country_id) REFERENCES static.t_ref_countries(id)
    );
insert into static.t_ref_country_child (parent_country_id,child_country_id,date_added,added_by)
select (select id from static.t_ref_countries where country='United Kingdom')
     ,(select id from static.t_ref_countries where country='England')
     ,now()
     ,'nidhish'
    where not exists (select 1 from static.t_ref_country_child WHERE parent_country_id=
				 (select id from static.t_ref_countries where country='United Kingdom')
				  and child_country_id =
				  (select id from static.t_ref_countries where country='England')
				 );

insert into static.t_ref_country_child (parent_country_id,child_country_id,date_added,added_by)
select (select id from static.t_ref_countries where country='United Kingdom')
     ,(select id from static.t_ref_countries where country='Scotland')
     ,now()
     ,'nidhish'
    where not exists (select 1 from static.t_ref_country_child WHERE parent_country_id=
				 (select id from static.t_ref_countries where country='United Kingdom')
				  and child_country_id =
				  (select id from static.t_ref_countries where country='Scotland')
				 );
insert into static.t_ref_country_child (parent_country_id,child_country_id,date_added,added_by)
select (select id from static.t_ref_countries where country='United Kingdom')
     ,(select id from static.t_ref_countries where country='Northern Ireland')
     ,now()
     ,'nidhish'
    where not exists (select 1 from static.t_ref_country_child WHERE parent_country_id=
				 (select id from static.t_ref_countries where country='United Kingdom')
				  and child_country_id =
				  (select id from static.t_ref_countries where country='Northern Ireland')
				 );
insert into static.t_ref_country_child (parent_country_id,child_country_id,date_added,added_by)
select (select id from static.t_ref_countries where country='United Kingdom')
     ,(select id from static.t_ref_countries where country='Wales')
     ,now()
     ,'nidhish'
    where not exists (select 1 from static.t_ref_country_child WHERE parent_country_id=
				 (select id from static.t_ref_countries where country='United Kingdom')
				  and child_country_id =
				  (select id from static.t_ref_countries where country='Wales')
				 );
INSERT INTO static.t_ref_country_states (country_id,state_name,state_code,date_added,added_by)
SELECT (select id from static.t_ref_countries where country='Australia')
     ,'New South Wales','NSW',now(),'nidhish' WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_country_states
WHERE country_id=(select id from static.t_ref_countries where country='Australia')
and state_code ='NSW'
);
INSERT INTO static.t_ref_country_states (country_id,state_name,state_code,date_added,added_by)
SELECT (select id from static.t_ref_countries where country='Australia')
     ,'Queensland','QLD',now(),'nidhish' WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_country_states
WHERE country_id=(select id from static.t_ref_countries where country='Australia')
and state_code ='QLD'
);
INSERT INTO static.t_ref_country_states (country_id,state_name,state_code,date_added,added_by)
SELECT (select id from static.t_ref_countries where country='Australia')
     ,'South Australia','SA',now(),'nidhish' WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_country_states
WHERE country_id=(select id from static.t_ref_countries where country='Australia')
and state_code ='SA'
);
INSERT INTO static.t_ref_country_states (country_id,state_name,state_code,date_added,added_by)
SELECT (select id from static.t_ref_countries where country='Australia')
     ,'Tasmania','TAS',now(),'nidhish' WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_country_states
WHERE country_id=(select id from static.t_ref_countries where country='Australia')
and state_code ='TAS'
);
INSERT INTO static.t_ref_country_states (country_id,state_name,state_code,date_added,added_by)
SELECT (select id from static.t_ref_countries where country='Australia')
     ,'Victoria','VIC',now(),'nidhish' WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_country_states
WHERE country_id=(select id from static.t_ref_countries where country='Australia')
and state_code ='VIC'
);
INSERT INTO static.t_ref_country_states (country_id,state_name,state_code,date_added,added_by)
SELECT (select id from static.t_ref_countries where country='Australia')
     ,'Western Australia','WA',now(),'nidhish' WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_country_states
WHERE country_id=(select id from static.t_ref_countries where country='Australia')
and state_code ='WA'
);
INSERT INTO static.t_ref_country_states (country_id,state_name,state_code,date_added,added_by)
SELECT (select id from static.t_ref_countries where country='Australia')
     ,'Australian Capital Territory','ACT',now(),'nidhish' WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_country_states
WHERE country_id=(select id from static.t_ref_countries where country='Australia')
and state_code ='ACT'
);
INSERT INTO static.t_ref_country_states (country_id,state_name,state_code,date_added,added_by)
SELECT (select id from static.t_ref_countries where country='Australia')
     ,'Northern Territory','NT',now(),'nidhish' WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_country_states
WHERE country_id=(select id from static.t_ref_countries where country='Australia')
and state_code ='NT'
);
INSERT INTO static.t_ref_country_states (country_id,state_name,state_code,date_added,added_by)
SELECT (select id from static.t_ref_countries where country='India')
     ,'Andhra Pradesh','AP',now(),'nidhish'WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_country_states
WHERE country_id=(select id from static.t_ref_countries where country='India')
and state_code ='AP'
);
INSERT INTO static.t_ref_country_states (country_id,state_name,state_code,date_added,added_by)
SELECT (select id from static.t_ref_countries where country='India')
     ,'Arunachal Pradesh','AR',now(),'nidhish'WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_country_states
WHERE country_id=(select id from static.t_ref_countries where country='India')
and state_code ='AR'
);
INSERT INTO static.t_ref_country_states (country_id,state_name,state_code,date_added,added_by)
SELECT (select id from static.t_ref_countries where country='India')
     ,'Assam','AS',now(),'nidhish'WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_country_states
WHERE country_id=(select id from static.t_ref_countries where country='India')
and state_code ='AS'
);
INSERT INTO static.t_ref_country_states (country_id,state_name,state_code,date_added,added_by)
SELECT (select id from static.t_ref_countries where country='India')
     ,'Bihar','BR',now(),'nidhish'WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_country_states
WHERE country_id=(select id from static.t_ref_countries where country='India')
and state_code ='BR'
);
INSERT INTO static.t_ref_country_states (country_id,state_name,state_code,date_added,added_by)
SELECT (select id from static.t_ref_countries where country='India')
     ,'Chhattisgarh','CT',now(),'nidhish'WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_country_states
WHERE country_id=(select id from static.t_ref_countries where country='India')
and state_code ='CT'
);
INSERT INTO static.t_ref_country_states (country_id,state_name,state_code,date_added,added_by)
SELECT (select id from static.t_ref_countries where country='India')
     ,'Goa','GA',now(),'nidhish'WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_country_states
WHERE country_id=(select id from static.t_ref_countries where country='India')
and state_code ='GA'
);
INSERT INTO static.t_ref_country_states (country_id,state_name,state_code,date_added,added_by)
SELECT (select id from static.t_ref_countries where country='India')
     ,'Gujarat','GJ',now(),'nidhish'WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_country_states
WHERE country_id=(select id from static.t_ref_countries where country='India')
and state_code ='GJ'
);
INSERT INTO static.t_ref_country_states (country_id,state_name,state_code,date_added,added_by)
SELECT (select id from static.t_ref_countries where country='India')
     ,'Haryana','HR',now(),'nidhish'WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_country_states
WHERE country_id=(select id from static.t_ref_countries where country='India')
and state_code ='HR'
);
INSERT INTO static.t_ref_country_states (country_id,state_name,state_code,date_added,added_by)
SELECT (select id from static.t_ref_countries where country='India')
     ,'Himachal Pradesh','HP',now(),'nidhish'WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_country_states
WHERE country_id=(select id from static.t_ref_countries where country='India')
and state_code ='HP'
);
INSERT INTO static.t_ref_country_states (country_id,state_name,state_code,date_added,added_by)
SELECT (select id from static.t_ref_countries where country='India')
     ,'Jharkhand','JH',now(),'nidhish'WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_country_states
WHERE country_id=(select id from static.t_ref_countries where country='India')
and state_code ='JH'
);
INSERT INTO static.t_ref_country_states (country_id,state_name,state_code,date_added,added_by)
SELECT (select id from static.t_ref_countries where country='India')
     ,'Karnataka','KA',now(),'nidhish'WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_country_states
WHERE country_id=(select id from static.t_ref_countries where country='India')
and state_code ='KA'
);
INSERT INTO static.t_ref_country_states (country_id,state_name,state_code,date_added,added_by)
SELECT (select id from static.t_ref_countries where country='India')
     ,'Kerala','KL',now(),'nidhish'WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_country_states
WHERE country_id=(select id from static.t_ref_countries where country='India')
and state_code ='KL'
);
INSERT INTO static.t_ref_country_states (country_id,state_name,state_code,date_added,added_by)
SELECT (select id from static.t_ref_countries where country='India')
     ,'Madhya Pradesh','MP',now(),'nidhish'WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_country_states
WHERE country_id=(select id from static.t_ref_countries where country='India')
and state_code ='MP'
);
INSERT INTO static.t_ref_country_states (country_id,state_name,state_code,date_added,added_by)
SELECT (select id from static.t_ref_countries where country='India')
     ,'Maharashtra','MH',now(),'nidhish'WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_country_states
WHERE country_id=(select id from static.t_ref_countries where country='India')
and state_code ='MH'
);
INSERT INTO static.t_ref_country_states (country_id,state_name,state_code,date_added,added_by)
SELECT (select id from static.t_ref_countries where country='India')
     ,'Manipur','MN',now(),'nidhish'WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_country_states
WHERE country_id=(select id from static.t_ref_countries where country='India')
and state_code ='MN'
);
INSERT INTO static.t_ref_country_states (country_id,state_name,state_code,date_added,added_by)
SELECT (select id from static.t_ref_countries where country='India')
     ,'Meghalaya','ML',now(),'nidhish'WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_country_states
WHERE country_id=(select id from static.t_ref_countries where country='India')
and state_code ='ML'
);
INSERT INTO static.t_ref_country_states (country_id,state_name,state_code,date_added,added_by)
SELECT (select id from static.t_ref_countries where country='India')
     ,'Mizoram','MZ',now(),'nidhish'WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_country_states
WHERE country_id=(select id from static.t_ref_countries where country='India')
and state_code ='MZ'
);
INSERT INTO static.t_ref_country_states (country_id,state_name,state_code,date_added,added_by)
SELECT (select id from static.t_ref_countries where country='India')
     ,'Nagaland','NL',now(),'nidhish'WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_country_states
WHERE country_id=(select id from static.t_ref_countries where country='India')
and state_code ='NL'
);
INSERT INTO static.t_ref_country_states (country_id,state_name,state_code,date_added,added_by)
SELECT (select id from static.t_ref_countries where country='India')
     ,'Odisha','OR',now(),'nidhish'WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_country_states
WHERE country_id=(select id from static.t_ref_countries where country='India')
and state_code ='OR'
);
INSERT INTO static.t_ref_country_states (country_id,state_name,state_code,date_added,added_by)
SELECT (select id from static.t_ref_countries where country='India')
     ,'Punjab','PB',now(),'nidhish'WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_country_states
WHERE country_id=(select id from static.t_ref_countries where country='India')
and state_code ='PB'
);
INSERT INTO static.t_ref_country_states (country_id,state_name,state_code,date_added,added_by)
SELECT (select id from static.t_ref_countries where country='India')
     ,'Rajasthan','RJ',now(),'nidhish'WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_country_states
WHERE country_id=(select id from static.t_ref_countries where country='India')
and state_code ='RJ'
);
INSERT INTO static.t_ref_country_states (country_id,state_name,state_code,date_added,added_by)
SELECT (select id from static.t_ref_countries where country='India')
     ,'Sikkim','SK',now(),'nidhish'WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_country_states
WHERE country_id=(select id from static.t_ref_countries where country='India')
and state_code ='SK'
);
INSERT INTO static.t_ref_country_states (country_id,state_name,state_code,date_added,added_by)
SELECT (select id from static.t_ref_countries where country='India')
     ,'Tamil Nadu','TN',now(),'nidhish'WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_country_states
WHERE country_id=(select id from static.t_ref_countries where country='India')
and state_code ='TN'
);
INSERT INTO static.t_ref_country_states (country_id,state_name,state_code,date_added,added_by)
SELECT (select id from static.t_ref_countries where country='India')
     ,'Telangana','TG',now(),'nidhish'WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_country_states
WHERE country_id=(select id from static.t_ref_countries where country='India')
and state_code ='TG'
);
INSERT INTO static.t_ref_country_states (country_id,state_name,state_code,date_added,added_by)
SELECT (select id from static.t_ref_countries where country='India')
     ,'Tripura','TR',now(),'nidhish'WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_country_states
WHERE country_id=(select id from static.t_ref_countries where country='India')
and state_code ='TR'
);
INSERT INTO static.t_ref_country_states (country_id,state_name,state_code,date_added,added_by)
SELECT (select id from static.t_ref_countries where country='India')
     ,'Uttarakhand','UT',now(),'nidhish'WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_country_states
WHERE country_id=(select id from static.t_ref_countries where country='India')
and state_code ='UT'
);
INSERT INTO static.t_ref_country_states (country_id,state_name,state_code,date_added,added_by)
SELECT (select id from static.t_ref_countries where country='India')
     ,'Uttar Pradesh','UP',now(),'nidhish'WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_country_states
WHERE country_id=(select id from static.t_ref_countries where country='India')
and state_code ='UP'
);
INSERT INTO static.t_ref_country_states (country_id,state_name,state_code,date_added,added_by)
SELECT (select id from static.t_ref_countries where country='India')
     ,'West Bengal','WB',now(),'nidhish'WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_country_states
WHERE country_id=(select id from static.t_ref_countries where country='India')
and state_code ='WB'
);
INSERT INTO static.t_ref_country_states (country_id,state_name,state_code,date_added,added_by)
SELECT (select id from static.t_ref_countries where country='India')
     ,'Andaman and Nicobar Islands','AN',now(),'nidhish'WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_country_states
WHERE country_id=(select id from static.t_ref_countries where country='India')
and state_code ='AN'
);
INSERT INTO static.t_ref_country_states (country_id,state_name,state_code,date_added,added_by)
SELECT (select id from static.t_ref_countries where country='India')
     ,'Chandigarh','CH',now(),'nidhish'WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_country_states
WHERE country_id=(select id from static.t_ref_countries where country='India')
and state_code ='CH'
);
INSERT INTO static.t_ref_country_states (country_id,state_name,state_code,date_added,added_by)
SELECT (select id from static.t_ref_countries where country='India')
     ,'Dadra and Nagar Haveli and Daman and Diu','DH',now(),'nidhish'WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_country_states
WHERE country_id=(select id from static.t_ref_countries where country='India')
and state_code ='DH'
);
INSERT INTO static.t_ref_country_states (country_id,state_name,state_code,date_added,added_by)
SELECT (select id from static.t_ref_countries where country='India')
     ,'Delhi','DL',now(),'nidhish'WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_country_states
WHERE country_id=(select id from static.t_ref_countries where country='India')
and state_code ='DL'
);
INSERT INTO static.t_ref_country_states (country_id,state_name,state_code,date_added,added_by)
SELECT (select id from static.t_ref_countries where country='India')
     ,'Jammu and Kashmīr','JK',now(),'nidhish'WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_country_states
WHERE country_id=(select id from static.t_ref_countries where country='India')
and state_code ='JK'
);
INSERT INTO static.t_ref_country_states (country_id,state_name,state_code,date_added,added_by)
SELECT (select id from static.t_ref_countries where country='India')
     ,'Ladakh','LA',now(),'nidhish'WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_country_states
WHERE country_id=(select id from static.t_ref_countries where country='India')
and state_code ='LA'
);
INSERT INTO static.t_ref_country_states (country_id,state_name,state_code,date_added,added_by)
SELECT (select id from static.t_ref_countries where country='India')
     ,'Lakshadweep','LD',now(),'nidhish'WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_country_states
WHERE country_id=(select id from static.t_ref_countries where country='India')
and state_code ='LD'
);
INSERT INTO static.t_ref_country_states (country_id,state_name,state_code,date_added,added_by)
SELECT (select id from static.t_ref_countries where country='India')
     ,'Puducherry','PY',now(),'nidhish'WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_country_states
WHERE country_id=(select id from static.t_ref_countries where country='India')
and state_code ='PY'
);

alter table public.t_companies ADD COLUMN IF NOT EXISTS country_id integer;
alter table public.t_companies ADD COLUMN IF NOT EXISTS state_id integer;
alter table public.t_company_facilities ADD COLUMN IF NOT EXISTS facility_country_id integer;
alter table public.t_company_facilities ADD COLUMN IF NOT EXISTS facility_state_id integer;

alter table public.t_companies DROP CONSTRAINT IF EXISTS fk_t_companies_country_id;
alter table public.t_companies DROP CONSTRAINT IF EXISTS fk_t_companies_state_id;
alter table public.t_company_facilities DROP CONSTRAINT IF EXISTS fk_t_company_facilities_country_id;
alter table public.t_company_facilities DROP CONSTRAINT IF EXISTS fk_t_company_facilities_state_id;

alter table public.t_companies add CONSTRAINT fk_t_companies_country_id FOREIGN KEY (country_id) REFERENCES static.t_ref_countries (id);
alter table public.t_companies add CONSTRAINT fk_t_companies_state_id FOREIGN KEY (state_id) REFERENCES static.t_ref_country_states (id);
alter table public.t_company_facilities add CONSTRAINT fk_t_company_facilities_country_id FOREIGN KEY (facility_country_id) REFERENCES static.t_ref_countries (id);
alter table public.t_company_facilities add CONSTRAINT fk_t_company_facilities_state_id FOREIGN KEY (facility_state_id) REFERENCES static.t_ref_country_states (id);



