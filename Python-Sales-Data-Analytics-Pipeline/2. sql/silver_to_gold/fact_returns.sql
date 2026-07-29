drop table if exists gold.fact_returns;
create table gold.fact_returns as

select * 
from silver.return_transactions
order by return_id

