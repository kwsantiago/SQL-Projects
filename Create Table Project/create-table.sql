create database a2;

use a2;

create table kyle
(
	name varchar(20) not null,
	id_number int,
	id_type varchar(20) not null,
	date_issued date
);

desc kyle;

--insert statement that specifies all field/column names
insert into kyle
(name, id_number, id_type, date_issued)
values
('John Ruggard','1', 'IT Professional', '1990-09-01');

--insert statement that omits all field/column names
insert into kyle
values
('Bryce Anders','2', 'CEO', '1991-12-23');

--insert statement that changes the order of fields/columns
insert into kyle
(date_issued, id_type, id_number, name)
values
('1994-11-07', 'CEO Assistant', '3', 'Max Stein');

--insert statement that leaves fields/columns out (must include 1+ fields/columns, but not all)
insert into kyle
(id_type, name)
values
('Cleaner', 'Claudia Geller');

--insert statement that adds multiple records at once
insert into kyle
(name, id_number, id_type, date_issued)
values
('Charlie Wombler','4', 'IT Help Desk', '1994-05-13'),
('Stacey Herbes','5', 'Developer', '1995-04-10'),
('Chad Dawson','6', 'Developer Intern', '1997-03-02');

select * from kyle;

drop table kyle;