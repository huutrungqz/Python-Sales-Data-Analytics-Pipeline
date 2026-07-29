DROP TABLE IF EXISTS silver.territory_mapping;
create table silver.territory_mapping as

select
	territory_id,
	employee_id,
	customer_id,
	region,
	team,
	effective_date::date,
	expiry_date::date,
	version
from raw.territory_mapping