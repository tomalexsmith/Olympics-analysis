create table noc as

select 
	row_number() over(order by noc) as noc_id,
    min(noc) noc,
    min(noc_region) noc_region,
    min(noc_notes) noc_notes
from staging
group by noc