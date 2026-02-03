-- TCL => transaction control language.
-- set of logical statement.( changes that are not permanent).
-- which is used to handle a logic statement.
-- why we use TCL?
-- to maintain the data consistency and data integrity.

use regex1;
create table actor_cp2 as select actor_id, first_name from sakila.actor
where actor_id between 1 and 5;

select * from actor_cp2;
insert into actor_cp2 values(6,'charu');

-- autocommit => enable.
-- Transaction =>
-- Transaction =>
-- in case if you run any dml operation or you write down start transaction (starttransaction keyword).

-- when my transaction are automatically close?
-- like commit and rollback then also my transaction will close.
-- or in case if i run any DDL operation like (create,alter,drop etc) then also my transcation will close or can use any DCL operation.

-- (1) commit => when we have to save changes permanently we use commit.
-- changes are goint to permanent when only we use commit.
-- (2) rollback => when we have to revert the transaction or comeback we use rollback. start from the initial point.

start transaction; -- ( any work will going to start will be going to in pending phase)
insert into actor_cp2 values(11,'amazon');
commit;
select * from actor_cp2;

 start transaction;
insert into actor_cp2 values(11,'amazon');
select * from actor_cp2;

start transaction;
insert into actor_cp2 values(13,'flipkart');
select * from actor_cp2;
create table xyz(id int);

start transaction;
insert into actor_cp2 values(14,'abc');

insert into actor_cp2 values(15,'lmn');
delete from actor_cp2 where actor_id in (7,9);
select * from actor_cp2;

-- savepoint is like a checkpoint.
start transaction;
insert into actor_cp2 values(14,'abc');

insert into actor_cp2 values(15,'lmn');
savepoint db_actor_cp2_checkpoint1;
delete from actor_cp2 where actor_id in (7,9);
rollback;
select * from actor_cp2;

-- Savepoint => revert to a specific point.
start transaction;
insert into actor_cp2 values(17,'abc');
insert into actor_cp2 values(18,'lmn');
savepoint db_actor_cp2_checkpoint1;
delete from actor_cp2 where actor_id in (3);
rollback to db_actor_cp2_checkpoint1;
select * from actor_cp2;


