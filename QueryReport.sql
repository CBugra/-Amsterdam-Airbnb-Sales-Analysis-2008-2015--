USE Property_WH
go

create proc QueryReport
@neighbour nvarchar(255)

as

SELECT SUM(fp.Price) AS Sales, p.neighbourhood_cleansed, pf.property_type, c.Month_, c.Year_

FROM Fact_Property fp 
inner join Dim_Place p
on fp.Place_Key = p.Place_Key
inner join Dim_Property_Feature pf
on fp.Property_Feature_Key = pf.Property_Feature_Key
inner join Dim_Calendar c
on fp.CalendarKey = c.CalendarKey

where p.neighbourhood_cleansed = @neighbour
group by p.neighbourhood_cleansed, pf.property_type, c.Month_, c.Year_

exec QueryReport 'Centrum-Oost'