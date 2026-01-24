-- subquery : A query within another query is called as subquery.
-- also called as nested query and inner query.

use sakila;
select amount from payment where payment_id=5;

select * from payment where amount=9.99;

-- () <= nested query
select * from payment where amount=(select amount from payment where payment_id=5);

-- get the payment_id and amount where the amount is not equal to the amount of payment_id 23.
select amount from payment where payment_id=23;
select * from payment where amount !=3.99;
select payment_id, amount from payment where amount !=(select amount from payment where payment_id=23);

-- get the payment_id, customer_id, amount, payment_date where the month of payment should be 
-- same as of payment_id 6.

select payment_id, customer_id, amount, payment_date from payment where month(payment_date)=
(select month(payment_date) from payment where payment_id=6);

-- get all the columns from the payment table where the staff serving the customers should
-- be same as of payment_id 7.
select * from payment where staff_id=(select staff_id from payment where payment_id=7);

-- get all the payment information where the amount is same as of highest amount from 
-- the payment table.
select * from payment where amount=(select max(amount) from payment);

-- get the amount and the total number of payment done per each amount only for those payment
-- whose amount is less than the amount of rentil_id 1725.
select amount from payment where rental_id=1725;
select * from payment where amount=4.99;

select amount, count(amount) from payment where amount<(select amount where rental_id=1725) group by amount;

-- get the month and total amount spent only for those customers whose month of payment 
-- is greater than customer_id 1 and payment_id 3.

select month(payment_date) from payment where payment_id=3;

-- single row subquery| nested query => return 1 row only :
select month(payment_date), sum(amount) from payment where month(payment_date)>
(select month(payment_date) from payment where customer_id=1 and payment_id=3)
group by month(payment_date);