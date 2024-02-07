create table event as

select 
	row_number() over(order by event) event_id,
	event,
    min(sport) sport
from staging
group by event