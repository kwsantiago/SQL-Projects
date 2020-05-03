-- Q2
create database final_grades;

use final_grades;

create table grades  
(
	lname varchar(8), 
	fname varchar(7),
	due_date date,
	submit_date date,
	unit_num tinyint,
	assgn_type char,
	assgn_num tinyint,
	grade int	
);

load data local
infile 'D:/Downloads/gradebook_reformatted.csv'
into table grades 
fields terminated by ','
ignore 1 lines
(lname, fname, due_date, submit_date, unit_num, assgn_type, assgn_num, grade);

-- Q3
select * from grades where grade < 70;

-- Q4
alter table grades 
add column id int not null auto_increment first, 
add primary key (id);

-- Q5
select lname, fname from grades group by lname, fname order by lname;