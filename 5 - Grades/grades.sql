create database week11;

use week11;

create table grades 
(
	sname varchar(10), 
	assgn varchar(15), 
	grade int
);

load data local infile 'grades.csv'
into table grades
fields terminated by ',' escaped by '\\'
lines terminated by '\r\n'
ignore 1 lines;

-- 1
update grades 
set assgn = concat("HW", right(assgn,1));

-- 2
update grades
set sname = concat(upper(left(sname,1)), lower(substring(sname,2,length(sname)-1)));

-- 3
alter table grades 
add column id int not null auto_increment first, 
add primary key (id);

-- 4a
alter table grades 
add column sid int not null after id;

-- 4b
update grades
set sid = 
case
	when left(sname, 2) = 'Je' then 1
	when left(sname, 2) = 'Ju' then 2
	when left(sname, 2) = 'Pe' then 3
	when left(sname, 2) = 'Sa' then 4
end;

-- 5
update grades
set grade = 0 
where grade is null;

-- 6
select assgn, avg(grade) as avg, min(grade) as lowest, max(grade) as highest from grades group by assgn desc;

-- 7
select sname,
case
	when avg(grade) >= 90 then 'A'
	when avg(grade) >= 80 and avg(grade) <= 89 then 'B'
	when avg(grade) >= 70 and avg(grade) <= 79 then 'C'
	when avg(grade) >= 60 and avg(grade) <= 69 then 'D'
	when avg(grade) <= 59 then 'F'
end as 'letter_grade'
from grades group by sname order by avg(grade) desc;



