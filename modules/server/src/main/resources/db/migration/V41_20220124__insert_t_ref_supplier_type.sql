INSERT INTO static.t_ref_supplier_type(supplier_type_id, supplier_type, date_added, added_by)
SELECT 1, 'Raw Materials Supplier', now(), 'vadim.koshman@mainsoft.org'
    WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_supplier_type WHERE supplier_type='Raw Materials Supplier');

INSERT INTO static.t_ref_supplier_type(supplier_type_id, supplier_type, date_added, added_by)
SELECT 2, 'Processed Materials/Good supplier', now(), 'vadim.koshman@mainsoft.org'
    WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_supplier_type WHERE supplier_type='Processed Materials/Good supplier');

INSERT INTO static.t_ref_supplier_type(supplier_type_id, supplier_type, date_added, added_by)
SELECT 3, 'Manufacturer', now(), 'vadim.koshman@mainsoft.org'
    WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_supplier_type WHERE supplier_type='Manufacturer');

INSERT INTO static.t_ref_supplier_type(supplier_type_id, supplier_type, date_added, added_by)
SELECT 4, 'Waste Services', now(), 'vadim.koshman@mainsoft.org'
    WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_supplier_type WHERE supplier_type='Waste Services');

INSERT INTO static.t_ref_supplier_type(supplier_type_id, supplier_type, date_added, added_by)
SELECT 5, 'Shipping and Freight', now(), 'vadim.koshman@mainsoft.org'
    WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_supplier_type WHERE supplier_type='Shipping and Freight');

INSERT INTO static.t_ref_supplier_type(supplier_type_id, supplier_type, date_added, added_by)
SELECT 6, 'Advisory Services', now(), 'vadim.koshman@mainsoft.org'
    WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_supplier_type WHERE supplier_type='Advisory Services');