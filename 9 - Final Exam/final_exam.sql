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
select lname, fname 
from grades 
group by lname, fname 
order by lname;

-- Q6
select concat(fname, " ", lname) as name, avg(grade) as avg 
from grades 
group by name 
order by avg desc;

-- Q7
select lname, fname, unit_num, assgn_type, assgn_num, submit_date-due_date as days_late 
from grades 
where submit_date-due_date > 0 
group by lname, fname 
order by unit_num;

-- Q8
select concat(fname, " ", lname) as name, (
   select due_date 
   from grades 
   order by due_date desc
   limit 1
  ) as due_date, submit_date-due_date as days_late 
from grades 
where submit_date-due_date > 0
group by name;