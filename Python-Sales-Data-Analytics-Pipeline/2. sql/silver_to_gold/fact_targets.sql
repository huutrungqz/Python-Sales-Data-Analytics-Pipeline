drop table if exists gold.fact_targets;
create table gold.fact_targets as

select * 
from silver.sales_target_plan
order by employee_id, month, plan_version