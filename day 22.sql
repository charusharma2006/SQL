-- recursive cte 
use sakila;

select actor_id, first_name from sakila.actor where actor_id between 1 and 4
union all
select actor_id, first_name from sakila.actor where actor_id between 3 and 5;

with recursive cte as (
select 10 as num                    -- assinging values to this num column (starting point)
union all
select num+1 from cte                -- cte call krna
where num<15                        -- terminating condition (stop point)
)
select * from cte;



use temp;
CREATE DATABASE IF NOT EXISTS temp;
SHOW DATABASES LIKE 'temp';
DROP DATABASE temp;
CREATE DATABASE temp;

CREATE TABLE employees2 (
    employeeid INT PRIMARY KEY,
    name VARCHAR(50),
    managerid INT
);


INSERT INTO employees2 (employeeid, name, managerid) VALUES
(1, 'Alice', NULL),      -- CEO
(2, 'Bob', 1),           -- Reports to Alice
(3, 'Charlie', 2),       -- Reports to Bob
(4, 'Diana', 2),         -- Reports to Bob
(5, 'Eve', 3);           -- Reports to Charlie


select * from employees2;
WITH xyz AS (
SELECT employeeid, name FROM employees2 WHERE managerid IS NULL)
SELECT e.employeeid, e.name,CONCAT(e.name, '->', xyz.name) AS hierarchy_path
FROM employees2 e JOIN xyz
ON e.managerid = xyz.employeeid;
    
    
WITH RECURSIVE cte AS (
SELECT employeeid, name, name AS hierarchy_path FROM employees2 WHERE managerid IS NULL
UNION ALL
SELECT e.employeeid, e.name,
CONCAT(cte.hierarchy_path, '->', e.name)
FROM employees2 e JOIN cte 
ON e.managerid = cte.employeeid)
        select * from cte;

-- 