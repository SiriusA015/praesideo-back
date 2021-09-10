insert into tech.t_app_data_text (id,textkey,textvalue,culture,date_added,added_by)
select
    (select max(id)+1 from tech.t_app_data_text)
     ,'impactmeasurementonly_noemission_data'
     ,'Please complete emissions activity / review tab and click on Confirm.'
     ,'en-us'
     ,now()
     ,'nidhish'
    where not exists (select 1 from tech.t_app_data_text where textkey='impactmeasurementonly_noemission_data');

update tech.t_app_data_text set textvalue='You have an outstanding invoice, please pay the invoice to access the emissions tab. Go to settings / Billing & payments.'
where textkey='blockEmissionsTabMessage_account_owner';

update tech.t_app_data_text set textvalue='You have an outstanding invoice, please pay the invoice to access the performance tab. Go to settings / Billing & payments.'
where textkey='blockImpactPerformanceMessage_account_owner';

update tech.t_app_data_text set textvalue='You have an outstanding invoice, please pay the invoice to access the performance tab. Go to settings / Billing & payments.'
where textkey='blockTracePerformanceMessage_account_owner';

update tech.t_app_data_text set textvalue='Thank you for the submission of impact data. We will review and process your submission. In the mean time, please pay the invoice to access the climate analytics. Go to settings / Billing & payments.'
where textkey='impactDataSubmissionMessage_account_owner';

