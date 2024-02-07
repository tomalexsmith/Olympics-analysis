create table games as

select
	row_number() over(order by games) games_id,
	games, 
    min(year) year, 
    min(season) season,
    min(city) city
from staging
group by games