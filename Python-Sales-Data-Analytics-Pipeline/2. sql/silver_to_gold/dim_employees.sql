drop table if exists gold.dim_employees;
create table gold.dim_employees as

select 
	*,
	coalesce((lead(effective_date) over (partition by employee_id order by effective_date) - interval '1 day')::date,
				date '9999-12-31') as effective_to,
	case
		when row_number() over (partition by employee_id order by effective_date desc) = 1 then TRUE
		else False
	end as is_current

from silver.employee_master
