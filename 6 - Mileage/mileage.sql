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
update fillups
set price_per_gal = 3.419, total_cost = 33.78
where id = 74;

-- 8
select min(price_per_gal) as lowest, 
avg(price_per_gal) as average, 
max(price_per_gal) as highest 
from fillups;

-- 9
select vehicle_id, total_cost from fillups;

-- 10
select vehicle_id, round(avg(mpg)) as avg_mpg from fillups
where mpg <> 0
group by vehicle_id;

-- 11
select 
case
	when vehicle_id = 2 then 'Prius'
	when vehicle_id <> 2 then 'Other'
end as 'vehicle_id', 
round(avg(mpg)) as avg_mpg from fillups
where mpg <> 0
group by vehicle_id;

-- 12
select hour(date_time) as hour,
count(hour(date_time)) as num_times
from fillups 
group by hour 
order by hour;