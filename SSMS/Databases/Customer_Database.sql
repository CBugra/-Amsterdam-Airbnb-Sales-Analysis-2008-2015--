use Customer

go
create table Review_Scores_Cust (
	review_id int primary key,
	number_of_reviews float,
	review_scores_rating float,
	review_scores_accuracy float,
	review_scores_cleanliness float,
	review_scores_value float
);

go
create table Host_Cust(
	host_id_ int primary key,
	host_name_ nvarchar(255),
	Calendar_ID int,
	review_id int,
	foreign key(review_id) references Review_Scores_Cust(review_id)
);
