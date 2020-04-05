-- 2
create database mileage;

use mileage;

-- 3 
create table fillups 
(
	id int not null primary key auto_increment, 
	date_time datetime, 
	volume dec(7, 3), 
	vehicle_id int, 
	odometer int, 
	mpg dec(7, 2), 
	total_cost dec(7, 2), 
	price_per_gal dec(7, 3), 
	is_partial int, 
	`restart` int
);

-- 4
-- This command displays the correct time 
select from_unixtime(1392164473694 / 1000);

-- 5
load data local
infile 'D:/Downloads/mileage.csv'
into table fillups
fields terminated by ','
ignore 1 lines
(id, @date_time, volume, vehicle_id, odometer, mpg, total_cost, price_per_gal, is_partial, `restart`)
set date_time=from_unixtime(@date_time / 1000);

-- 6
select * from fillups;

alter table fillups
drop column `restart`;

-- 7
-- I rounded the total cost to 33.78 because all the other total costs rounded up one when the calculation was made by doing (price_per_gal * volume)
update fillups
set price_per_gal = 3.419, total_cost = 33.78
where id = 74;

-- 8
select min(price_per_gal) as lowest, avg(price_per_gal) as average, max(price_per_gal) as highest from fillups;

-- 9
select vehicle_id, total_cost from fillups;




