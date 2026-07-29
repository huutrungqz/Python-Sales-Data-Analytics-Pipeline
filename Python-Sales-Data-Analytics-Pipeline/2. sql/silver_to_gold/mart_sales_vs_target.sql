drop table if exists gold.mart_sales_vs_target;
create table gold.mart_sales_vs_target as

with actual_sales as (
	select
		employee_id,
		extract(year from order_date) as year,
		extract(month from order_date) as month,
		sum(net_amount) as actual_revenue,
		sum(quantity) as actual_quantity,
		count(distinct customer_id) as actual_customers
	from gold.fact_sales
	group by 1,2,3
),

target_sales as (
	select
		employee_id,
		year,
		month,
		target_revenue,
		target_quantity,
		target_new_customers
	from silver.sales_target_plan
	where is_latest_flag = 1
)

select
	a.employee_id,
	a.year,
	a.month,
	b.target_revenue,
	a.actual_revenue,
	round(100.0*a.actual_revenue/b.target_revenue,2) as kpi_revenue_pct,
	b.target_quantity,
	a.actual_quantity,
	round(100.0*a.actual_quantity/b.target_quantity,2) as kpi_quantity_pct,
	b.target_new_customers,
	a.actual_customers,
	round(100.0*a.actual_customers/b.target_new_customers,2) as kpi_customers_pct
from actual_sales as a
left join target_sales as b
on a.employee_id = b.employee_id
and a.year = b.year
and a.month = b.month




		