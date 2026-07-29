DROP TABLE IF EXISTS silver.sales_target_plan;
create table silver.sales_target_plan as

with v2_target as (
	select
		*
	from raw.sales_target_plan
	where plan_version = 'v2'
),

merge_version as (
	select
		a.plan_version,
		a.version_date,
		a.effective_from,
		a.effective_to,
		a.employee_id,
		a.year,
		a.month,
		a.target_revenue,
		a.target_quantity,
		a.target_new_customers,
		b.plan_version as v2_version
	from raw.sales_target_plan as a
	left join v2_target as b
		on a.employee_id = b.employee_id
		and a.month = b.month
)


select
	plan_version,
	version_date,
	effective_from,
	effective_to,
	employee_id,
	year,
	month,
	target_revenue,
	target_quantity,
	target_new_customers,
	case 
		when (plan_version = 'v1' and v2_version = 'v2') then 0
		else 1 
	end as is_latest_flag
from merge_version



	