use sakila;

create table tes100 as select actor_id, first_name from actor where actor_id between 1 and 10;

insert into tes100 values(14,'abc'),(13,'def'),(11,'aman'),(12,'charu');

-- alter statement : through which we can change the structure of table.
alter table tes100 add primary key(actor_id);
alter table tes100 drop primary key;

select * from tes100;
desc tes100; -- no primary key

-- Explain => 
explain select * from tes100 where actor_id=5;
explain select * from tes100 where first_name='NICK';

-- INDEXES =>
-- Indexes is like a data structure which is used to access your data in a faster way.
-- They are used to optimize your sql query.
-- An indexes in Mysql is a database object.

-- Types of Indexes =>
-- (1) Clustered Index :- defines the pyhsical order in which data is stored in a database
-- (2) Non-Clustered Index :- 
-- primary key is basically a index.
-- there is one clustered index in a table.

-- for  non clustered :
create index indx1 on tes100(actor_id);
drop index indx1 on tes100;
show index from tes100;

explain select * from tes100 where actor_id=5;

-- cardinality -- is uniqueness
explain select * from tes100 where actor_id=5;
insert into tes100 values(12,'abc');
insert into tes100 values(15,'abc');

show index from tes100;

explain select * from tes100 where actor_id=14;

-- Multi-column index :-
-- index on 2 column
create index indx_composite on tes100(actor_id, first_name);
show index from tes100;

explain select * from tes100 where actor_id=3;

explain select * from tes100 where actor_id>3 and first_name='abc';

-- indexes
