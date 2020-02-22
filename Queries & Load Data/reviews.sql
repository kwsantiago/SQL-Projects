create database ReviewDB;

use ReviewDB;

create table reviews
(
	course char(10),
	communication int,
	availability int,
	discussions int,
	grading_helped int,
	grading_time int,
	consultation int,
	activities int,
	policies int,
	strengths varchar(100),
	improve varchar(100)
);

-- skip first header row 
load data local infile 'reviews.csv' into table reviews fields terminated by ',' IGNORE 1 LINES;

-- All records where the instructor communication was disagree.
select * from reviews where communication = 3;

-- All records where the graded assignments and feedback was disagree or strong disagree.
select * from reviews where grading_time = 3 or grading_time = 4;

-- All records from the cop3847 class where online discussions are strongly agree or agree.
select * from reviews where course like '%cop3847%' and (discussions = 1 or discussions = 2);

-- Just the class column (field) for all records with a null in the "course activities required me to analyze" field.
select course from reviews where activities is null;

-- The class column for records where the strengths include the word good.
select course from reviews where strengths like '%good%';
