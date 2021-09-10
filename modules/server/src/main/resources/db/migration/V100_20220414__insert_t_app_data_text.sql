insert into tech.t_app_data_text (id,textkey,textvalue,culture,date_added,added_by)
select
    (select max(id)+1 from tech.t_app_data_text)
     ,'impactDataSubmissionMessage_account_owner'
     ,'Thank you for the submission of impact data. We will review and process your submission. In the mean time, please pay the invoice to access the climate analytics. Go to Account settings / Billing & payments.'
     ,'en-us'
     ,now()
     ,'nidhish'
    where not exists (select 1 from tech.t_app_data_text where textkey='impactDataSubmissionMessage_account_owner');


insert into tech.t_app_data_text (id,textkey,textvalue,culture,date_added,added_by)
select
    (select max(id)+1 from tech.t_app_data_text)
     ,'impactDataSubmissionMessage_member'
     ,'Thank you for the submission of impact data. We will review and process your submission. In the mean time, please approach your account owner to pay the outstanding invoice in order to access the climate analytics.'
     ,'en-us'
     ,now()
     ,'nidhish'
    where not exists (select 1 from tech.t_app_data_text where textkey='impactDataSubmissionMessage_member');
