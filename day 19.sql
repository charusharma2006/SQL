-- Windows Function : It is used to perform the calculation on the set of rows, with reference to cuurent row.
-- There are majorly 3 parts in Windows :
-- 1. Over => to apply the function over a window, to apply aggregate function & logic to a set of rows.

use world;
select * from country;
select code,name, continent, population,(select sum(population) from country) from country;
select sum(population) from country;

-- in front of each continent we need the population of that continent only.
select code, name, continent, population,
sum(population) over(), avg(population) over() from country;

-- 2. Partition By : It is same as group by which is used to apply the logic into group.
-- partition by means to divide
select continent, sum(population) from country group by continent;

select code, name, continent, population,
sum(population) over(partition by continent) from country;

select code, name, continent, population,
sum(population) over(partition by name) from country;

select code, name, continent, population,
sum(population) over(),
sum(population) over(partition by continent) from country;

select code, name, continent, region, population,
sum(population) over(partition by continent),
sum(population) over(partition by continent, region) from country;

-- what is the running sum or cummulative sum ?
-- use order by :
select code, name, continent, population,
sum(population) over(order by population) from country;

select code, name , continent, population, 
sum(population) over(partition by continent) from country;

select * from employees;
select *, sum(salary) over(),
sum(salary) over(partition by department) from employees;

-- over() => asecnding order mai arrange krke lana.
-- running sum / cummalative sum of salary :
select *, sum(salary) over(order by salary) from employees;
select *, sum(salary) over(order by emp_id) from employees;
select *, sum(salary) over(order by full_name) from employees;

select *, sum(salary) over(order by city) from employees;
select *, sum(salary) over(order by month(hire_date) )from employees;

-- i need to get the running sum of salary in each department.
select *,
sum(salary) over(partition by department order by salary) from employees;

-- row_number() => to define a unique values for each row.
select *, row_number() over() from employees;

-- in each department :
select *, row_number() over(partition by department) from employees;
select *, row_number() over(partition by department order by hire_date) from employees;

-- rank => rank function will give you the ranking for the values if there are same values then ranking will be shared
--  and the next consicutive ranking will be skip.
select *,
rank() over(order by salary) from employees;

select *,
rank() over(order by city) from employees;

-- in windows function what is the difference between in rank , dens rank and row_number.
-- dens rank => ranking doesn't skip.
-- order by is compulsary in rank() and dens rank()

-- you have to give the highest ranking in each department.
select *,
dense_rank() over(partition by department order by salary) from employees;

select *,
row_number() over(order by salary) from employees;

select *,
rank() over(order by salary) from employees;

select *,
dense_rank() over(order by salary) from employees;

-- Row number within each department by salary desc.
select *,
row_number() over(partition by department order by salary desc) from employees;

select *,
rank() over(partition by department order by salary desc) from employees;

-- Lead => next value.
select *,lead(salary,1) over() from employees;
select *, lead(salary,2) over() from employees;

-- Lag => previous value.
select *,lag(salary,1) over() from employees;

select *,lag(salary,1) over(order by salary) from employees;
select *,lag(salary,1) over(partition by department) from employees;

select *,lag(salary,1) over(partition by department order by hire_date),
salary - lag(salary,1) over(partition by department order by hire_date) from employees;

select *,lag(salary) over(),
lead(salary) over() from employees;

-- Running total of sales amounts by date (overall).
select *, sum(amount) over(order by sale_date) from sales;

-- Running total of sales per employee by date.
select *, sum(amount) over(partition by emp_id order by sale_date) from sales;

-- Total sales per row (same total repeated using window SUM)
select *, sum(amount) over() from sales;

-- Average salary per department shown on every employee row.
select *, avg(salary) over(partition by department) from employees;

-- order of execution of sql statement.
-- Top 2 salaries in each department (use ROW_NUMBER)
select * from
(select *,row_number() over(partition by department order by salary) as row_value from employees)
tempdata where row_value<=2;

-- Salary difference vs department average.
select *, avg(salary) over(partition by department),
salary -  avg(salary) over(partition by department) from employees;

-- Percent_rank =>
-- Percent rank of employees by salary (overall).
select *, sum(salary) over(),
rank() over(order by salary),
percent_rank() over(order by salary) from employees;

-- Salary distribution into 4 buckets (NTILE).
SELECT emp_id, salary,
NTILE(4) OVER (ORDER BY salary) AS salary_bucket FROM employees;

--
