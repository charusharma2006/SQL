-- CTE => common table expression
-- It is a temporary name of the result of your SQL query.
-- they are not stored on a permanent basis.
-- it will help to break complex queries into smaller and readable format.

select * from sakila.actor;

with charu_cte as (select * from sakila.actor where actor_id between 5 and 90)

select * from charu_cte;

select * from charu_cte;         -- it will give error because cte is validate until a ';'.

with cte as 
(select *, month(payment_date) from sakila.payment)

(select *, month(payment_date) , count(*) from cte group by month(payment_date);

-- you need to find out all payment info where the amt is the second highest amt
with cte as
(select *,dens_rank() over(order by amount desc) as rankings from sakila.payment)