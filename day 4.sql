-- Functions :
-- numeric and data function.

use world;
select lifeexpectancy , round(lifeexoectancy) from country ;

select 30.68, round(30.62,1);
select 30.68, round(30.641,2);

-- 456.12
-- 6 => one place , 5 10 placeb,4 ==> 100 place
-- 6 ==> nearest 10, ==> 0 yh fir 10.
-- 76
-- 0 yh 100
-- 176 200 yh 0
-- round => round of 10 nearest 10th place , nearest 10000

select 6.0012, round( 463.0172, 2);
select 456.68, round(3653.68, -3);

-- Truncate : extract the value.
select 456.68, round(3653.68, 1), truncate(3653.60,1);

-- mod :
-- ceil : upper value
-- floor : same value
-- pow :
select mod(10,3), ceil(4.00000001), floor(4.999999), pow(2,4);

-- date functions :
-- now : In-built function provide current system date and time. 
select now(), current_timestamp(), current_date(), current_time();

-- add date function => by default date add, (month, year, time).
-- now :
select now(), adddate(now(),2);
select now(), adddate(now(), -2);

select now(), adddate(now(), interval 2 month);

select now(), adddate(now(), interval 2 year);

select now(), year(now() );

-- extract : ( year / month / hour / minute / week)
select now(), extract( year from now() );
select now(), extract( month from now() );
select now(), extract( hour from now() );
select now(), extract( week from now() );

-- date_format ==> extract but with a string(= (message).
select now(), extract(year from now()), date_format(now(), 'year is %Y');
select now(), extract(year from now()), date_format(now(), 'year is %y');
select now(), extract(year from now()), date_format(now(), 'month is %M');
select now(), extract(year from now()), date_format(now(), 'month is %m');
select now(), extract(year from now()), date_format(now(), 'hour is %h');
