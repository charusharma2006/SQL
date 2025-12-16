show databases;

-- to create a database(to organize data)
create database tata;

-- to utilize the database for which data will be stored
use tata;

-- to see tables
show tables;


create table 1nexon( price int, color char(20));

show tables;

use world;

-- print
select * from country;

-- to see the two column:
select name, region, population from country;

-- any order you can print column:
select name, population, region from country;

select name, population, region, population-500 from country;

show tables;
select * from country;
select * from country where continent='Asia';

select * from country where Indepyear=1991;
select name,continent from country where indepyear=1991;

-- in (specific)
select * from country where continent in ('Africa','Asia');
select * from country where indepyear in (1960,1991);

-- Between (range of values)
select * from country where indepyear between 1960 and 1991;

-- not between:
select * from country where indepyear not between 1960 and 1991;

-- not in:
select * from country where indepyear not in (1960,1991);

-- get the country name and the continent where the region is not south europe.
-- get the country name continent , population along with 10% increment in the popution 
-- get the country where the life expectency where 75.1 , 77.8 , 63.7
-- get the country name population , region  where the population should not be from 5000 to 300000

select name, continent from country where region != 'South Europe';
select name, population, population*1.1 from country;
select * from country where lifeexpectancy in (75.1,77.8,63.7);
select name, population, region where population not between 5000 and 300000;