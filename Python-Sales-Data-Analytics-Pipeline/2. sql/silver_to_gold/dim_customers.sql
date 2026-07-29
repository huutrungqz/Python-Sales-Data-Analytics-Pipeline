drop table if exists gold.dim_customers;
create table gold.dim_customers as


select 
	*,
	case
		when join_date >= current_date - interval '5 year' and status = 'Active' then 1
		when join_date >= current_date - interval '3 year' and status = 'Active' then 2
		else 3
	end as loyalty_tier
from silver.customer_master
