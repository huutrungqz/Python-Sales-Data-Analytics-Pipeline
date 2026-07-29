DROP TABLE IF EXISTS silver.customer_master;
create table silver.customer_master as

select
	customer_id,
	customer_name,
	customer_type,
	channel,
	province,
	region,
	address,
	phone,
	tax_code,
	join_date::date,
	credit_limit::int,
	status
from raw.customer_master


