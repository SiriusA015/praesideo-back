alter table public.t_companies
    add column if not exists status_id integer
    constraint fk_t_company_status
    references static.t_ref_company_status;

UPDATE public.t_companies tc
SET status_id = 1
    FROM impact.t_data_versions tdv
WHERE tdv.company_id = tc.company_id and tdv.submitted = 0;

UPDATE public.t_companies tc
SET status_id = 2
    FROM impact.t_data_versions tdv
WHERE tdv.company_id = tc.company_id and tdv.submitted = 5;

UPDATE public.t_companies tc
SET status_id = 3
    FROM impact.t_data_versions tdv
WHERE tdv.company_id = tc.company_id and tdv.submitted = 10;

UPDATE public.t_companies tc
SET status_id = 3
    FROM impact.t_data_versions tdv
WHERE tdv.company_id = tc.company_id and tdv.submitted = 15;
