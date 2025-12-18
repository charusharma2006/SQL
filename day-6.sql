use sakila;
show tables;

select * from payment;
select count(*) from payment where amount=2.99;

select amount, count(*) from payment group by amount;

select customer_id, sum(amount) from payment group by customer_id;
select customer_id, sum(amount) from payment where amount>3 group by customer_id;

-- to need to find out total transaction of each customer in month of may.
select payment_date, count(amount), month(payment_date) from payment where month(payment_date)=5 group by customer_id; 

-- find out the max amount of transaction , avg transaction amount and the total transaction amount done through each staff.
select staff_id, max(amount), avg(amount), sum(amount) from payment group by staff_id;

-- find out max, avg ,total transaction 
-- which only for even no.of customer
select staff_id, max(amount), avg(amount), sum(amount) from payment where (customer_id%2=0) group by staff_id;

-- get the amount and the total transaction done for each amount only for the payment done through staff_id 1 and the total no. of transacton should be > then 30.
select amount, count(amount) from payment where staff_id=1 group by amount having count(amount) >30;

-- find out the no. of customer served along with avg amount and the total amount spent in each month for staff id 1 or 2.
select count(customer_id), avg(amount), sum(amount), month(payment_date) from payment where staff_id = 1 or staff_id=2 group by month(payment_date);

-- for each year and each month.
select count(customer_id), avg(amount), sum(amount), month(payment_date), year(payment_date) from payment where staff_id=1 or staff_id=2 
group by month(payment_date), year(payment_date); 


