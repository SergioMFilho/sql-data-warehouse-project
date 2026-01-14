SELECT prd_key, COUNT(*) FROM (
SELECT
    pn.prd_id       AS product_id,
    pn.cat_id,
    pn.prd_key      AS prd_key,
    pn.prd_nm       AS product_name,
    pn.prd_cost       AS prd_cost,
--    pc.cat          AS category,
--    pc.subcat       AS subcategory,
--    pc.maintenance  AS maintenance,
    pn.prd_line     AS product_line,
    pn.prd_start_dt AS start_date,
    pc.cat AS category,
    pc.subcat AS subcat,
    pc.maintenance
FROM silver.crm_prd_info pn
LEFT JOIN silver.erp_px_cat_g1v2 pc ON pn.cat_id = pc.id
WHERE prd_end_dt IS NULL
)t GROUP BY prd_key
HAVING COUNT(*) > 1