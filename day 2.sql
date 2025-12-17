-- like operator:(match a pattern)
-- name => letter start , letter include , letter end.
-- % : speacial character / wildcard character.
-- % : zero or more character.
-- 'A'
-- _ (underscore) : only one character.

select * from country where name like 'A%';

select * from country where name like 'An%';
select * from country where name like '%a';
select * from country where name like '%r%';
select * from country where name like '%ru%';

-- not like
select * from country where name not like '%ru%';

select * from country where name like 'Ira_';
select * from country where name like '____';
select * from country where name like '_u__';

select *  from country where name like '_u%';
select *  from country where name like '_u_%';
select * from country where name like '_ua%';
select * from country where name like '_u%a%';

-- get the country name and continent where the continent start with letter n.
-- get the name and continent where the second last letter is p.
-- get the countries and continent where the continent have minimun four character.
-- get the name and  continenet where the secound letter is a and the secound last letter a region. 
-- third character is c and last three character are sia.
-- get the name and region where the continent is north america or south america

select name, continent from country where continent like 'N%';
select name, continent from country where name like '%p_';
select name, continent from country where continent like '____';
select name, continent from country where name like '_a%a_';
select name, continent from country where name like '___c%sia';
select name, region, continent from country where continent in ('North America' , 'South America');


