use world;
select * from city;
-- city (id-pri key), country code, is the foreign key

-- Describe : 
describe city;

select * from country;
select count(code), count(distinct code) from country;
-- code (pri key)

-- JOIN : use to connect two table.
select cy.id, cy.name, cy.countrycode, cnt.code, cnt.name, cnt.continent from city as cy
join
country as cnt
where cy.countrycode=cnt.code;

select cnt.code, cnt.name, cnt.continent from country as cnt;

-- find the city name, population, the country name along with the government form for each city.
select ct.name, ct.population, crt.name, crt.governmentform from city as ct
join
country as crt
where ct.countrycode=crt.code;

select * from countrylanguage;
-- find the country name, population, and the language spoken with the percentage with each language.
select crty.name, crty.population, clang.language, clang.percentage from country as crty
join
countrylanguage as clang 
where clang.countrycode=crty.code;

use sakila;
select * from actor;
select * from film_actor;

select a.first_name, a.actor_id from actor as a
join
film_actor as fa
where a.actor_id = fa.actor_id;

select * from film;
desc film_actor;
desc film;

select fa.film_id, fa.actor_id, f.film_id, f.title from film_actor as fa
join film as f
where fa.film_id = f.film_id;

select * from film;
select * from film_actor;
select * from actor;
-- actor name and which movie the actor work .

desc actor; -- pri(actor_id)
desc film; -- pri(film_id)
desc film_actor;

--   

CREATE DATABASE REGEX;
USE REGEX;

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(50),
    city VARCHAR(50)
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    amount DECIMAL(10,2)
);



INSERT INTO customers (customer_id, customer_name, city) VALUES
(1, 'Alice', 'New York'),
(2, 'Bob', 'Los Angeles'),
(3, 'Charlie', 'Chicago'),
(4, 'David', 'Houston'),
(5, 'Eva', 'Phoenix'),
(6, 'Frank', 'Philadelphia'),
(7, 'Grace', 'San Antonio'),
(8, 'Henry', 'San Diego'),
(9, 'Ivy', 'Dallas'),
(10, 'Jack', 'San Jose');

INSERT INTO orders (order_id, customer_id, order_date, amount) VALUES
(101, 1, '2024-01-05', 250.00),
(102, 2, '2024-01-06', 150.00),
(103, 3, '2024-01-07', 300.00),
(104, 1, '2024-01-10', 120.00),
(105, 5, '2024-01-12', 450.00),
(106, 6, '2024-01-15', 200.00),
(107, 2, '2024-01-18', 175.00),
(108, 8, '2024-01-20', 500.00),
(109, 11, '2024-01-22', 90.00),
(110, 12, '2024-01-25', 60.00);

select * from customers;
select * from orders;

select c.customer_id, c.customer_name, o.order_id, o.customer_id, o.amount from customers as c
join orders as o
where c.customer_id=o.customer_id; 

-- Inner Join :
select c.customer_id, c.customer_name, o.order_id, o.customer_id, o.amount from customers as c
inner join orders as o
on c.customer_id=o.customer_id; 

-- Outer Join : other than common elements.
-- Left Outer Join :
select c.customer_id, c.customer_name, o.order_id, o.customer_id, o.amount from customers as c
left join orders as o
on c.customer_id=o.customer_id; 

-- Right Outer Join :
select c.customer_id, c.customer_name, o.order_id, o.customer_id, o.amount from customers as c
right join orders as o

on c.customer_id=o.customer_id;

-- Natural Outer Join : We do not apply the condition.
-- If there is a common column then it work as inner join .
-- and if there is no common column then it work as cross join.
-- It is of no use.
select c.customer_id, c.customer_name, o.order_id, o.customer_id, o.amoun 
from customers as c natural join orders as o;


select c.cid, c.customer_name, o.order_id, o.customer_id, o.amount 
from customers as c natural join orders as o;

-- Cross-Join / Cartesian Join : every row of one table is connected with every rows of another table.

select customer_name, sum(amount)
from orders as o join customers as c
on o.customer_id=c.customer_id
group by c.customer_id;

use sakila;
-- actor_id, actor_name and total no. of movies the actor has worked.
select * from actor;
select * from film_actor;

select a.actor_id, a.first_name, count(fa.film_id) from actor as a
join film_actor as fa
where a.actor_id=fa.actor_id
group by a.actor_id, a.first_name;
