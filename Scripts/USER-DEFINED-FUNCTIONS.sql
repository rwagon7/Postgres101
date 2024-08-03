-- syntax
-- CREATE [OR REPLACE] FUNCTION function_name(param_list)
-- RETURNS return_type
-- LANGUAGE plpgsql
-- AS
-- $$
-- DECLARE
-- -- variable declaration
-- BEGIN
--  -- logic
-- END;
-- $$;

-- example1
-- CREATE FUNCTION get_film_count(len_from INT, len_to INT)
-- RETURNS INT
-- LANGUAGE plpgsql
-- AS
-- $$
-- DECLARE
--    film_count INTEGER;
-- BEGIN
--    SELECT COUNT(*) 
--    INTO film_count
--    FROM film
--    WHERE length BETWEEN len_from AND len_to;
   
--    RETURN film_count;
-- END;
-- $$;

-- header section:
-- In the Header section:
-- Function Name: ‘get_film_count' follows the ‘CREATE FUNCTION' keywords.
-- Parameters: The function accepts two integer parameters: ‘len_from' and ‘len_to'.
-- Return Type: The function returns an integer, specified by ‘RETURNS INT'.
-- Language: The function uses ‘plpgsql' as its procedural language.

-- body Section:
-- Dollar-Quoted String: The function body is enclosed in ‘$$'.
-- Variable Declaration: A variable ‘film_count' is declared to store the count of films.
-- Logic:
-- 1. The ‘SELECT INTO' statement counts films whose length is between ‘len_from' and ‘len_to', storing the result in ‘film_count'.
-- 2. The ‘RETURN' statement returns the ‘film_count' value.

-- setting it up as showcasing for different types of employees

-- CREATE TABLE employees (   employee_id serial PRIMARY KEY,   full_name VARCHAR NOT NULL,   manager_id INT);
-- INSERT INTO employees (
--    employee_id,
--    full_name,
--    manager_id
-- )
-- VALUES
--    (1, 'M.S Dhoni', NULL),
--    (2, 'Sachin Tendulkar', 1),
--    (3, 'R. Sharma', 1),
--    (4, 'S. Raina', 1),
--    (5, 'B. Kumar', 1),
--    (6, 'Y. Singh', 2),
--    (7, 'Virender Sehwag ', 2),
--    (8, 'Ajinkya Rahane', 2),
--    (9, 'Shikhar Dhawan', 2),
--    (10, 'Mohammed Shami', 3),
--    (11, 'Shreyas Iyer', 3),
--    (12, 'Mayank Agarwal', 3),
--    (13, 'K. L. Rahul', 3),
--    (14, 'Hardik Pandya', 4),
--    (15, 'Dinesh Karthik', 4),
--    (16, 'Jasprit Bumrah', 7),
--    (17, 'Kuldeep Yadav', 7),
--    (18, 'Yuzvendra Chahal', 8),
--    (19, 'Rishabh Pant', 8),
--    (20, 'Sanju Samson', 8);

-- creating function
create or replace function get_stats(
  in eid int,
  out name varchar,
  inout mid int)
language plpgsql
as $$
begin
  select full_name,manager_id
  into name,mid
  from employees
  where manager_id=mid
  and
  employee_id=eid;
end; $$;

-- function overloading
-- original fucntion
CREATE OR REPLACE FUNCTION get_rental_duration(p_customer_id INTEGER)
    RETURNS INTEGER AS $$
    
DECLARE 
    rental_duration INTEGER; 
BEGIN
    -- get the rate based on film_id
    SELECT INTO rental_duration SUM( EXTRACT( DAY FROM return_date - rental_date)) 
    FROM rental 
    WHERE customer_id=p_customer_id;

    RETURN rental_duration;
END; $$
LANGUAGE plpgsql;
-- overriding function
CREATE OR REPLACE FUNCTION get_rental_duration(p_customer_id INTEGER, p_from_date DATE)
    RETURNS INTEGER AS $$
DECLARE 
    rental_duration integer;
BEGIN
    -- get the rental duration based on customer_id and rental date
    SELECT INTO rental_duration
                SUM( EXTRACT( DAY FROM return_date + '12:00:00' - rental_date)) 
    FROM rental 
    WHERE customer_id= p_customer_id AND 
          rental_date >= p_from_date;
     
    RETURN rental_duration;
END; $$
LANGUAGE plpgsql;

-- postgres drop function
-- DROP FUNCTION [IF EXISTS] function_name(argument_list)[CASCADE | RESTRICT];

-- 1. function without parameters
-- drop function if exits function1, function2, ...


-- Max function
select max(pay) from payments;

-- Min Function
select min(pay) from payments;

-- Sum function

-- notes on sum function

-- It ignores all NULL values.
-- If used with DISTINCT operator as SUM(DISTINCT column), it skips duplicate values.
-- Using SUM() function with SELECT clause returns NULL instead of Zero.
select sum(pay) from payments;
-- example 1
SELECT
    id,
    SUM (pay) AS total
FROM
    payment
GROUP BY
    id;

-- example 2
select id, sum(pay) as total from payments group by id order by total  desc limit 2;

-- count function
-- syntax

-- Syntax: COUNT(*)
-- Returns: All rows including NULL and Duplicates
-- Syntax: COUNT(column)
-- Returns:  All rows except NULL.
-- Syntax: COUNT(DISTINCT column)
-- Returns: All rows without NULL and Duplicates

select count(*) from payments;

select count(distinct pay) from payments;

-- EXTRACT function
-- In PostgreSQL, the EXTRACT() function is a powerful tool used to retrieve specific components of a date or time value.

-- syntax
-- EXTRACT(field FROM source)

SELECT EXTRACT(YEAR FROM TIMESTAMP '2020-12-31 13:30:15');
SELECT EXTRACT(MONTH FROM TIMESTAMP '2020-12-31 13:30:15');


-- REPLACE function
-- In PostgreSQL, the REPLACE function is an essential string manipulation tool that allows users to search for and replace all occurrences 
-- of a specific substring within a given string. This function is particularly useful for data cleaning, formatting, and updating textual data.

select replace('https://www.geeksforgeeks.org', 'https', 'xx');

-- creation for next example
-- create table customers(first_name varchar(20), last_name varchar(20));