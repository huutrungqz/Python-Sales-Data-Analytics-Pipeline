drop table if exists gold.dim_products;
create table gold.dim_products as

select 
	*
from silver.product_master