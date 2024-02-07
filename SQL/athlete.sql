create table athlete as

select row_number() over(order by id) as athelete_id,
	min(name) as name,
    min(sex) as sex,
    min(age) as age,
    min(height) as height,
    min(weight) as weight,
    min(team) as team
from staging
group by id, games