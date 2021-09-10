create table if not exists static.t_ref_company_status(
            status_id serial not null
            constraint company_status_pkey
            primary key,
            status varchar(50)
);

INSERT INTO static.t_ref_company_status (status)
SELECT t.status
FROM (SELECT 'NOT_SUBMITTED' as status UNION ALL
      SELECT 'SUBMITTED_REVIEW' as status UNION ALL
      SELECT 'NOT_ACCEPTED' as status UNION ALL
      SELECT 'ACCEPTED' as status
     ) t
WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_company_status);