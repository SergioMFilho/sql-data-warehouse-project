```
SELECT * FROM gold.fact_sales f
left join gold.dim_customers c ON c.customer_key = f.customer_key
where c.customer_key is null
```

