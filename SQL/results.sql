create  table results as

with athlete_data_cte as (
	select 
		row_number() over(order by id) as athlete_id,
		games,
        id,
        min(name) as name
	from staging
	group by id, games
),
noc_data_cte as (
	select row_number() over(order by noc) as noc_id, noc
	from staging
	group by noc
),
games_data_cte as (
	select
		row_number() over(order by games) games_id,
		games
	from staging
	group by games
),
event_data_cte as (
	select 
		row_number() over(order by event) event_id,
		event
	from staging
	group by event
)

select
	row_number() over(order by athlete_id) as id,
	athlete_id,
	noc_id, 
	games_id, 
	event_id, 
	medal
from staging s
left join athlete_data_cte adc 
	on s.id = adc.id and s.games = adc.games
left join noc_data_cte ndc
	on s.noc = ndc.noc
left join games_data_cte gdc
	on s.games = gdc.games
left join event_data_cte edc
	on s.event = edc.event
