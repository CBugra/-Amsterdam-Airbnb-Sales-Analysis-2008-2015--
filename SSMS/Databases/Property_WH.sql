use Property_WH

go
create table Dim_Place (
	Place_Key int not null identity,
	id int,
	city nvarchar(255),
	state_ nvarchar(255),
	neighbourhood_cleansed nvarchar(255),
	host_since_anniversary datetime,
	zipcode float,
	country nvarchar(255),
	latitude float,
	longtitude float,
	price float,
	primary key(Place_Key)
);

create table Dim_Calendar(
	CalendarKey int not null identity,
    FullDate datetime,
	DayofWeek_ char(15),
	DayType char(20),
	DayofMonth_ int,
	Month_	char(10),
	Quarter_ char(2),
	Year_ int,
	primary key(CalendarKey)
);

go
create table Dim_Accommodation(
	AC_Key int not null identity,
	AC_Type_ID int,
	accommodates float,
	minimum_nights float,
	guests_included float,
	extra_people float,
	primary key(AC_Key)
);


go
create table Dim_Property_Feature (
	Property_Feature_Key int not null identity,
	Property_ID int,
	property_type nvarchar(255),
	room_type nvarchar(255),
	bathrooms float,
	bedrooms float,
	beds float,
	bed_type nvarchar(255),
	primary key(Property_Feature_Key)
);

go
create table Fact_Property (
	CalendarKey INT,
	Property_Feature_Key int,
	AC_Key int,
	Place_Key int,
	price float,
	neighbourhood_cleansed nvarchar(255),
	id int,
	PRIMARY KEY(Place_Key, id),
	FOREIGN KEY (Property_Feature_Key) REFERENCES Dim_Property_Feature (Property_Feature_Key),
	FOREIGN KEY (AC_Key) REFERENCES Dim_Accommodation (AC_Key),
	FOREIGN KEY (CalendarKey) REFERENCES Dim_Calendar (CalendarKey),
	FOREIGN KEY (Place_Key) REFERENCES Dim_Place(Place_Key)
);
