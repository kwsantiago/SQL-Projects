create database defpass;

use defpass;

create table creds
(
	entry_date date,
	vendor varchar(25),
	username varchar(26),
	password varchar(31),
	comments varchar(49)
);

load data local
infile 'D:/Downloads/default-passwords.csv'
into table creds
fields terminated by ','
ignore 1 lines
(@raw_date_from_file, vendor, username, password, comments)
set entry_date = if(length(@raw_date_from_file) = 9,
					str_to_date(@raw_date_from_file, '%d/%m/%y'),
					str_to_date(@raw_date_from_file, '%d/%m/%Y'));

select * from creds where username = '}';

select username, password from creds
where vendor = 'backtrack';

select * from creds
where username = '<BLANK>' or username = '<N/A>';

select * from creds
where password = 'password';

select * from creds
where year(entry_date) = 2015;