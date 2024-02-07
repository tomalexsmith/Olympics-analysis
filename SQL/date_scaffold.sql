create table years as (

	with recursive date_scaffold as (
		select
			min(year) year,
			max(year) max
		from staging
		UNION ALL
		select year + 1, max
		from date_scaffold
		where year < max
	) 

	select year from date_scaffold
)