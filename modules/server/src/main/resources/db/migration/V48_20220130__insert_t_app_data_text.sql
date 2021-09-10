INSERT INTO tech.t_app_data_text (textkey, textvalue, culture)
SELECT 'TraceInviteSupplierEmailTitle',
       'Join Praesideo Climate solution on behalf of {company_inviter_name}',
       'en-us' WHERE NOT EXISTS (
SELECT 1 FROM tech.t_app_data_text WHERE textkey='TraceInviteSupplierEmailTitle' and culture='en-us'
);

INSERT INTO tech.t_app_data_text (textkey, textvalue, culture)
SELECT 'TraceInviteSupplierEmailMessage',
       'Dear Supplier,
       Praesideo solution enables businesses to manage and transition supply chain to align with 1.5°C future.
       {company_invitee_name} is a key supplier within {company_inviter_name} supply chain.
       Please signup on Praesideo platform using this link : {sign_up_custom_link}
       All together, we have the power to decarbonize our activities.',
       'en-us' WHERE NOT EXISTS (
SELECT 1 FROM tech.t_app_data_text WHERE textkey='TraceInviteSupplierEmailMessage' and culture='en-us'
);
