-- case
/*
if(condition, true, false)
if(condition, true, ifcondition, true, if)

case
    when condition| expression then output
    when condition, then output
end
*/

use world;
select * from country;

select name, population,
case
    when population=0 then 'No population'
    when population between 8000 and 70000 then 'Med population'
    else 'condition is false'
end as 'status' from world.country;   -- 'status' change the column name.

select count(*),
case
    when population=0 then 'No population'
    when population between 8000 and 70000 then 'Med population'
    else 'condition is false'
end as 'status' from world.country group by status;   

-- Qustion :
select continent,
sum(case
    when population between 8000 and 70000 then 1 else 0
end) 
   from world.country group by continent;
   


