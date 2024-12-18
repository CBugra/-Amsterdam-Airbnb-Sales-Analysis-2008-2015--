use Property

go
create table Property_Beds_No(
	Beds_No_ID int primary key, 
	beds float,
	bed_type nvarchar(255)
);

go
create table Property_Room(
	Room_ID int primary key,
	bathrooms float,
	bedrooms float,
	Beds_No_ID int,
	foreign key(Beds_No_ID) references Property_Beds_No(Beds_No_ID) 
);

go
create table Type_Feature(
	Property_ID int primary key,
	property_type nvarchar(255),
	room_type nvarchar(255),
	Room_ID int,
	foreign key(Room_ID) references Property_Room(Room_ID)
);

go
create table Property_Guests(
	Guests_ID int primary key,
	guests_included float,
	extra_people float,
	Property_ID int,
	foreign key(Property_ID) references Type_Feature(Property_ID)
);

go
create table Property_AC_Type(
	AC_Type_ID int primary key,
	accommodates float,
	minimum_nights float,
	extra_people float,
	guests_included float,
	Guests_ID int,
	foreign key(Guests_ID) references Property_Guests(Guests_ID)
);


go
create table Property_Calendar(
	Calendar_ID int primary key,
	host_since_year float,
	host_since_anniversary datetime,
	AC_Type_ID int,
	foreign key(AC_Type_ID) references Property_AC_Type(AC_Type_ID)
);

go
create table Property_Place (
	id int primary key,
	city nvarchar(255),
	state_ nvarchar(255),
	neighbourhood_cleansed nvarchar(255),
	zipcode float,
	price float,
	Calendar_ID int,
	foreign key(Calendar_ID) references Property_Calendar(Calendar_ID)
);

