-- basic function
-- string function
-- case conversion
use world;
select name , upper(name) , lower(name) from country;
select name, code, concat(name,code) from country;
select name, code, concat(name,'-',code) from country;
select name, code, concat(name,'-',code,' ''charu') from country;

-- concat ws: we use to concat with the seperator ,first we give seperator
select concat_ws('$',name,code) from country;
select concat_ws('$',name,code,'charu') from country;

select name, code, concat(name,' ',code) from country where concat(name,' ',code) = 'Afghanistan AFG';

select * from country;
-- where in the region the continent name should be present.
select name, continent, region from country where region like concat( '%',continent);

-- country name,continent,population where the first chr continent should be same as of  country .
select name, continent, population from country where continent like concat('%',name);

-- string functions:
-- left : it is a string func.
select name, continent, left(name,1) from country where left(continent,1)=left(name,1);

-- substr : sub string

select name , substr(name , 2) , substr(name , 2 , 4) from country ;

select name , substr(name , 2) , substr(name , -1) from country ;
select name , substr(name , 2) , substr(name , -4 , 2) from country ;

-- print those country name where country first character is same as continent 1st character

select name , continent , substr(name , 1 , 1) , substr(name , 1 , 1) 
from country where substr(name ,1 , 1) = substr(continent , 1 , 1) ;

-- get the country name and population where the starting three chr of the country is alg.
select name , population from country where substr( name ,1,3) = 'alg' ;

-- instr :
select name , instr(name , 'e') from country ;
select name , char_length(name) from country ;


-- trim : job is to revove right most and left most wide space.
select char_length ('      charu       ');
select char_length (trim('       charu         ') );

-- rtrim : remove right side wide space
select char_length( rtrim('      charu       ') );

-- ltrim : remove left side wide space

select trim(both 'z' from '      chazz ruzzzz') ;

select name , trim(both 'A' from name) from country ;
select name , trim(both 'a' from trim(both 'A' from name) ) from country;


-- lpad and rpad
-- when we want to define a coulmn with fixed size.
select name , population , rpad(population , 9) from country;

select name , population , rpad(population , 9,0) from country ;


-- replace :use to replace the character from a string.
select name , replace(name ,'a' , '') from country;
