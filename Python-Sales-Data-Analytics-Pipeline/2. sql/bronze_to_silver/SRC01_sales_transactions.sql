DROP TABLE IF EXISTS silver.sales_transactions;
create table silver.sales_transactions as
select
	order_id,
	order_date::date,
	customer_id,
	region,
	province,
	channel,
	employee_id,
	product_id,
	quantity::int,
	unit_price::numeric,
	discount_pct::numeric,
	discount_amount::numeric,
	gross_amount::int,
	net_amount::numeric,
	delivery_status,
	payment_method,
	payment_status
from raw.sales_transactions



