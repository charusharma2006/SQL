-- DCL => Data Control Language.
-- authentication and authorization are the permission which user can accessbility.

-- user => create => permission

-- DDl statement
create user regex identified by 'regex';

select * from mysql.user;

create database charudb;
create table charudb.actor1 as select actor_id, first_name from sakila.actor
where actor_id between 1 and 5;

create table charudb.actor2 as select actor_id, first_name from sakila.actor
where actor_id between 3 and 7;

show grants for regex;

-- grant, permission on database to username.
grant select on charudb.actor2 to regex;

-- we will give all the permision.
grant select on charudb.* to regex;

grant all privileges on charudb.actor1 to regex;
show grants for regex;

-- give the privilege to one or two column
-- select or delete 
-- try to revoke those privilleges.
-- what is role.
-- create a grp, add user to grp and give the permision to grp.