```
with base as (
select
	*,
	ROW_NUMBER() OVER(PARTITION BY cst_id ORDER BY cst_create_date desc) as rn
from bronze.crm_cust_info
where cst_id = 29466
)
select * from base
where rn = 1 and cst_id is not null
```