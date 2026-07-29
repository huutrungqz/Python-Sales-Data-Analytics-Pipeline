DROP TABLE IF EXISTS silver.product_master;
create table silver.custom_master as

select
	product_id,
	product_name,
	category,
	sub_category,
	unit,
	unit_price::int,
	cost_price::int,
	weight_gram::int,
	status,
	launch_date
from raw.product_master