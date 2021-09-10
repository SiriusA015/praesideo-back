
DROP VIEW tech.v_python_getsupplierspend;

CREATE OR REPLACE VIEW tech.v_python_getsupplierspend
 AS
SELECT
    t2.supplier_id,
    'CHF' AS currency,
    t3.conversion_rate*t1.supplier_amount as supplier_amount,
    t2.customer_id
FROM
    trace.t_supplier_allocation t1
        JOIN trace.t_supply_chain t2 ON t2.supply_chain_id = t1.supply_chain_id
        JOIN static.t_ref_base_currency t3 ON t3.base_currency_id = t1.supplier_currency_id
WHERE 1 = 1
  AND t2.date_removed is null;