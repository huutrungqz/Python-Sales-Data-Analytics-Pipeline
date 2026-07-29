drop table if exists gold.dim_distributors;
create table gold.dim_distributors as

select 
	*,
	coalesce((lead(join_date) over (partition by distributor_id order by join_date) - interval '1 day')::date,
				date '9999-12-31') as effective_to,
	case
		when row_number() over (partition by distributor_id order by join_date desc) = 1 and status = 'Active' then True
		else Null
	end as is_current
		

from silver.distributor_master
