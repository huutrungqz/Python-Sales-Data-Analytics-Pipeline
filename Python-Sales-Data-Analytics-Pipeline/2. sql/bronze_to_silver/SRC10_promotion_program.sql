DROP TABLE IF EXISTS silver.promotion_program;
create table silver.promotion_program as

select
	promotion_id,
	promotion_name,
	promotion_type,
	target_channel,
	target_region,
	start_date::date,
	end_date::date,
	applicable_products,
	discount_pct::numeric,
	min_order_quantity::int,
	budget_vnd::numeric,
	actual_cost_vnd::numeric,
	status,
	created_by
from raw.promotion_program