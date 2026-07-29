DROP TABLE IF EXISTS silver.distributor_orders;
create table silver.distributor_orders as

select
	order_id,
	order_date::date,
	distributor_id,
	product_id,
	qty_ordered::int,
	qty_delivered::int,
	fill_rate_pct::numeric,
	unit_price_list::int,
	distributor_price::int,
	gross_amount::numeric,
	delivered_amount::numeric,
	expected_delivery_date::date,
	actual_delivery_date::date,
	ontime_delivery,
	delivery_status,
	payment_terms
from raw.distributor_orders

