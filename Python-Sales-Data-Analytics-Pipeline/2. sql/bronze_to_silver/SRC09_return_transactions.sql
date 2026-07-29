DROP TABLE IF EXISTS silver.return_transactions;
create table silver.return_transactions as

select
	return_id,
	original_order_id,
	return_date::date,
	customer_id,
	employee_id,
	product_id,
	region,
	province,
	return_quantity::int,
	unit_price::int,
	return_amount::numeric,
	return_reason,
	status
from raw.return_transactions