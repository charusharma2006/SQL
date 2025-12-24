use sakila;
show tables;

-- Order By : it is used for arranging data in ascending and descending order.
select * from payment order by customer_id, amount;
select * from payment order by customer_id desc, amount;
select * from payment order by customer_id asc, amount;

