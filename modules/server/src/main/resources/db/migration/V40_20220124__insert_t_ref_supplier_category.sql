INSERT INTO static.t_ref_supplier_category(supplier_category_id, supplier_category, date_added, added_by)
SELECT 1, 'Upstream', now(), 'vadim.koshman@mainsoft.org'
    WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_supplier_category WHERE supplier_category='Upstream');

INSERT INTO static.t_ref_supplier_category(supplier_category_id, supplier_category, date_added, added_by)
SELECT 2, 'Downstream', now(), 'vadim.koshman@mainsoft.org'
    WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_supplier_category WHERE supplier_category='Downstream');

INSERT INTO static.t_ref_supplier_category(supplier_category_id, supplier_category, date_added, added_by)
SELECT 3, 'Upstream and Downstream', now(), 'vadim.koshman@mainsoft.org'
    WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_supplier_category WHERE supplier_category='Upstream and Downstream');