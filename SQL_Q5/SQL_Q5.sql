use SQL_Q5

go
create table Feature(
	Feature_ID int primary key,
	property_type nvarchar(255),
	room_type nvarchar(255),
	bedrooms float,
	bathrooms float,
	minimum_nights float
);

go
create table Place_Location(
		id int primary key,
		city nvarchar(255),
		state_ nvarchar(255),
		neighbourhood_cleansed nvarchar(255),
		latitude float,
		longitude float,
		Feature_ID int,
		foreign key(Feature_ID) references Feature(Feature_ID)

);


go
create table Price(
	Price_ID int primary key,
	price float,
	id int,
	Feature_ID int,
	foreign key(id) references Place_Location(id),
	foreign key(Feature_ID) references Feature(Feature_ID)
);

go
create table Customer(
	host_id_ int primary key,
	host_name_ nvarchar(255),
	Price_ID int,
	foreign key(Price_ID) references Price(Price_ID)
);

SELECT pl.id, pl.city, pl.state_, pl.neighbourhood_cleansed, pl.latitude, pl.longitude, pr.price
FROM Place_Location pl
JOIN Price pr ON pl.id = pr.id
ORDER BY pr.price DESC;

SELECT pl.id, f.property_type, f.room_type, f.bedrooms, f.bathrooms, f.minimum_nights, pr.price
FROM Place_Location pl
JOIN Feature f ON pl.Feature_ID = f.Feature_ID
JOIN Price pr ON pl.id = pr.id
ORDER BY pr.price DESC;

SELECT DISTINCT property_type, COUNT(*) AS property_count
FROM Feature
GROUP BY property_type
ORDER BY property_count DESC;

SELECT TOP 5 neighbourhood_cleansed, COUNT(*) AS property_count
	FROM Place_Location
	GROUP BY neighbourhood_cleansed
	ORDER BY property_count DESC;

SELECT TOP 5 pl.neighbourhood_cleansed AS neighbourhood, 
       SUM(pr.price) AS total_amount
FROM Place_Location pl
JOIN Price pr ON pl.id = pr.id
JOIN Feature f ON pr.Feature_ID = f.Feature_ID
GROUP BY pl.neighbourhood_cleansed
ORDER BY COUNT(*) DESC;

SELECT SUM(Total_Amount) AS All_Neighbourhood_Total_Amount
FROM (
    SELECT SUM(price) AS Total_Amount
    FROM Place_Location pl
    JOIN Price pr ON pl.id = pr.id
    GROUP BY pl.neighbourhood_cleansed
) AS neighbourhood_totals;

SELECT c.host_name_ AS host_name, SUM(pr.price) AS total_spent
FROM Customer c
JOIN Price pr ON c.Price_ID = pr.Price_ID
JOIN Place_Location pl ON pr.id = pl.id
GROUP BY c.host_name_
ORDER BY total_spent DESC;





