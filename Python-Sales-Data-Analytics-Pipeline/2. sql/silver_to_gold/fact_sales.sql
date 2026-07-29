drop table if exists gold.fact_sales;
create table gold.fact_sales as

select * 
from silver.sales_transactions