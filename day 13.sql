-- Multi-Row Subquery :
-- in
-- not in
use sakila;
select * from payment where amount in (select amount from payment where payment_id=3 or payment_id=2);

select * from payment where amount not in (select amount from payment where payment_id=3 or payment_id=2);

-- =Any, >any, <any, >=any, <=any
select * from payment where amount =any (select amount from payment where payment_id=3 or payment_id=2);
select * from payment where amount >any (select amount from payment where payment_id=3 or payment_id=2);

select * from payment where amount >=any (select amount from payment where payment_id=3 or payment_id=2);

-- >All greater than larger value.
-- <all, >all, <=all, >=all.
select * from payment where amount >all
                       (select amount from payment where payment_id=3 or payment_id=2);

-- get all the payment information where the month of payment should be same as the month of 
-- payment_id 2 or 3.
-- get all the payment information whose amount is larger than among all the amounts of payment
-- id 2 to 8.

select * from payment where month(payment_date) in (select month(payment_date) where payment_id=2 or payment_id=3);
                                                    
 select * from payment where amount >all (select amount from payment  
                                          where payment_id=2 or payment_id=8);
                                                              