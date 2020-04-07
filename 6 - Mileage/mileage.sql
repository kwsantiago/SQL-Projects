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
	when round(avg(mpg)) = 39 then 'Prius'
	when round(avg(mpg)) <> 39 then 'Other'
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

-- 13
select 
case 
	when dayofweek(date_time) = 1 then 'Sun'
	when dayofweek(date_time) = 2 then 'Mon'
	when dayofweek(date_time) = 3 then 'Tue'
	when dayofweek(date_time) = 4 then 'Wed'
	when dayofweek(date_time) = 5 then 'Thu'
	when dayofweek(date_time) = 6 then 'Fri'
	when dayofweek(date_time) = 7 then 'Sat'
end as 'day',
count(dayofweek(date_time)) as num_fillups
from fillups
group by day
order by num_fillups desc;

-- 14
select 
case 
	when month(date_time) = 1 then 'Jan'
	when month(date_time) = 2 then 'Feb'
	when month(date_time) = 3 then 'Mar'
	when month(date_time) = 4 then 'Apr'
	when month(date_time) = 5 then 'May'
	when month(date_time) = 6 then 'Jun'
	when month(date_time) = 7 then 'Jul'
	when month(date_time) = 8 then 'Aug'
	when month(date_time) = 9 then 'Sep'
	when month(date_time) = 10 then 'Oct'
	when month(date_time) = 11 then 'Nov'
	when month(date_time) = 12 then 'Dec'
end as 'month',
left(date_time, 4) as year,
vehicle_id,
count(month(date_time)) as nbr_fillups,
round(volume * count(month(date_time))) as total_gallons
from fillups
group by year, month(date_time)
order by total_gallons desc;