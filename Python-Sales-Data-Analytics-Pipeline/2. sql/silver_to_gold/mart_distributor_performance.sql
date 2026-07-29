drop table if exists gold.mart_distributor_performance;
create table gold.mart_distributor_performance as

select
	distributor_id,
	sum(qty_ordered) as total_qty_ordered,
	sum(qty_delivered) as total_qty_delivered,
	round(100.0*sum(qty_delivered) / sum(qty_ordered),2) as total_fill_rate_pct,
	sum(gross_amount) as total_gross_amount,
	sum(delivered_amount) as total_delivered_amount,
	round(100.0*sum(case when ontime_delivery = 'Yes' then 1 else 0 end)
			/count(ontime_delivery),2) as ontime_pct
											
from silver.distributor_orders
group by 1
order by total_fill_rate_pct desc