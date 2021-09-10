INSERT INTO static.t_ref_supplier_invitation_status(supplier_invitation_status_id, supplier_invitation_status, date_added, added_by)
SELECT 1, 'PENDING', now(), 'vadim.koshman@mainsoft.org'
    WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_supplier_invitation_status WHERE supplier_invitation_status='PENDING');

INSERT INTO static.t_ref_supplier_invitation_status(supplier_invitation_status_id, supplier_invitation_status, date_added, added_by)
SELECT 2, 'INVITE_ME', now(), 'vadim.koshman@mainsoft.org'
    WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_supplier_invitation_status WHERE supplier_invitation_status='INVITE_ME');

INSERT INTO static.t_ref_supplier_invitation_status(supplier_invitation_status_id, supplier_invitation_status, date_added, added_by)
SELECT 3, 'INVITED', now(), 'vadim.koshman@mainsoft.org'
    WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_supplier_invitation_status WHERE supplier_invitation_status='INVITED');

