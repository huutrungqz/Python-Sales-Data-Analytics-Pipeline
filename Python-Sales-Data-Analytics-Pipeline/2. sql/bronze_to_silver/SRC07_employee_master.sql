DROP TABLE IF EXISTS silver.employee_master;
create table silver.employee_master as


select
	employee_id,
	full_name,
	gender,
	date_of_birth::date,
	join_date::date,
	position,
	region,
	team,
	email,
	phone,
	status,
	version,
	effective_date::date
from raw.employee_master

