------- Victims nationality---------

select distinct([Victim Type]),count([Victim Type])
from Crime_Data_from_2020_to_Present$
group by [Victim Type]

----- change time format-------

select [TIME OCC],
TIMEFROMPARTS(cast([TIME OCC] as varchar)/ 100, cast([TIME OCC] as varchar) % 100,0,0,0)
from Crime_Data_from_2020_to_Present$

Alter Table Crime_Data_from_2020_to_Present$
Add FormatedTime varchar

Update Crime_Data_from_2020_to_Present$
set FormatedTime = TIMEFROMPARTS(cast([TIME OCC] as varchar)/ 100, cast([TIME OCC] as varchar) % 100,0,0,0)

select Top 10 * From Crime_Data_from_2020_to_Present$



----Age restrict-----

select *
from Crime_Data_from_2020_to_Present$
where [Victim Age]=0 and [Victim Sex] is null and [Crime Code Desc] like 'THEFT%'


------Areawise cases-------

select [AREA NAME],count(*) as TotalCases,Round(Avg([Victim Age]),0) as averageAge from Crime_Data_from_2020_to_Present$
group by [AREA NAME]