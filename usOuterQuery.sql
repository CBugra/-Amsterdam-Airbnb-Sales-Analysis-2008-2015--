create proc uspOuterQuery
as
select p.neighbourhood_cleansed, sum(fp.Price) as Sales
from Fact_Property fp
inner join Dim_Place p
on fp.Place_Key = p.Place_Key
group by p.neighbourhood_cleansed

exec uspOuterQuery