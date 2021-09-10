
drop view if exists static.v_ref_country_child;
CREATE OR REPLACE VIEW static.v_ref_country_child
 AS
SELECT t2.country AS parent_country,
       t3.country AS child_country,
       t1.id,
       t1.parent_country_id,
       t1.child_country_id,
       t1.added_by,
       t1.date_added,
       t1.modified_by,
       t1.date_modified
FROM static.t_ref_country_child t1
         JOIN static.t_ref_countries t2 ON t2.id = t1.parent_country_id
         JOIN static.t_ref_countries t3 ON t3.id = t1.child_country_id;

drop view if exists static.v_ref_country_states;
CREATE OR REPLACE VIEW static.v_ref_country_states
 AS
SELECT
    t2.country AS country,
    t1.state_name,
    t1.state_code,
    t1.id,
    t1.added_by,
    t1.date_added,
    t1.modified_by,
    t1.date_modified
FROM
    static.t_ref_country_states t1
        INNER JOIN static.t_ref_countries t2 ON t2.id = t1.country_id;