-- Distinct : we can use it as normal keyword or function.
-- distinct(continent) : to find unique values not duplicates.
use world;
select distinct continent from country;
select distinct continent, region from country;


-- aggregate function (multi-line functions) => will give some result.
-- to apply some calculation over a set of rows.
-- count(col) => only data present will be counted but not the missing value.

select indepyear from country;
select count(indepyear) from country;
select count(*) from country;           

select count(population), sum(population) , avg(population) from country;
 
 -- Min()
 select count(population), min(population) from country;
 
 -- Max()
 select count(population), max(population) from country;
 
 select count(continent), count(distinct continent) from country;
 
 
 select count(indepyear), count(*) from country where continent = 'Asia';

-- get the toatl contries total region along with the avg lifeexpectancy and the total population for the
-- country who have got the independence after 1947 and before 1998.

select count(name) ,count(region), avg(lifeexpectancy), sum(population) from country 
where indepyear > 1947 and indepyear < 1998;

-- get the total number of contry the unique regions along with the total population and highest 
-- lifeexpectancy rate with the total capital for the country startiong with letter 'A' and 'D'.

select count(name), count(distinct region), sum(population), max(lifeexpectancy), sum(capital)
from country where name like 'A%' or name like 'D%' ;

-- Group By Statement => It is used to collect similar value in a group.
-- we cannot apply it directly, we has to use aggregate funtion. 
select continent, count(name) from country group by continent;

-- find out the total countries and the total population for each indepyear.
select indepyear, count(name), sum(population) from country group by indepyear;

select continent, count(name) from country where indepyear>1950 group by continent;

-- where clause filter only the data is present in your table.
-- apply before group by.

-- find out those continent where total no. of country is greater than 30.

-- Having Clause:
-- when we have to filter the data on the column which is calculated.
-- when we have to 
-- put after group by 
select continent, count(name) from country group by continent having count(name)>30;

-- find out in total population in each column.
select continent, sum(population) from country group by continent;

select continent, sum(population) from country group by continent having sum(population)>100;

-- find out each year how many country were independent.
select indepyear, count(name) from country where indepyear >1930 group by indepyear
having count(name)>2;

-- find out government form and the total no. of country for each government form  where the total no. country > 20
-- where the country should have capital >30.
-- grt the no. of countries regions and the total population where lifeexpectancy >38 and population in each continent >3 lakh.

select * from country;
select GovernmentForm, count(name) from country group by GovernmentForm having count(name) >20;
select GovernmentForm, count(name) from country where capital>30 group by GovernmentForm;

select count(name) , count(region), sum(population) from country where lifeexpectancy >38
group by continent having sum(population)>300000;

