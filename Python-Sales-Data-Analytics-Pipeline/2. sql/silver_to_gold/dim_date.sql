drop table if exists gold.dim_date;
create table gold.dim_date as

select
	to_char(day,'YYYY-MM-DD')::date as date,
	extract(week from day) as week,
	extract(month from day) as month,
	extract(quarter from day) as quarter,
	extract(year from day) as year,
	case
		when extract(month from day) >=9 then extract(year from day)
		else extract(year from day)-1
	end as fy
from generate_series('2022-01-01'::date, '2026-12-31'::date, interval '1 day') as day