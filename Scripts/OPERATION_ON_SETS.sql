-- creating databases, tables for set operations 
-- CREATE DATABASE sales2020;
-- CREATE TABLE sales2020q1(id SERIAL, name VARCHAR(50) NOT NULL,  amount VARCHAR(50), PRIMARY KEY (id));
-- CREATE TABLE sales2020q2(id SERIAL, name VARCHAR(50) NOT NULL,  amount VARCHAR(50), PRIMARY KEY (id));

-- INSERT data into the table
-- INSERT INTO sales2020q1(name, amount) VALUES ('Raju Kumar', '121232'), ('Nikhil Aggarwal', '254789'), ('Abhishek Kelenia', '365487');
-- INSERT INTO sales2020q2(name, amount) VALUES ('Raju Kumar', '457264'), ('Nikhil Aggarwal', '365241'), ('Abhishek Kelenia', '759864');

-- Union All
-- the below query gives a list of all sets and gives the output

SELECT * FROM sales2020q1
UNION ALL 
SELECT * FROM sales2020q2 
ORDER BY
name ASC, amount DESC;

-- create tables for intersect operator
-- below are the queries
-- create DATABASE raw_agents;
-- CREATE TABLE op_chi(agent_id INT PRIMARY KEY, active_date DATE NOT NULL, FOREIGN KEY (agent_id) REFERENCES agent (agent_id));
-- CREATE TABLE op_pak(agent_id INT PRIMARY KEY, active_date DATE NOT NULL, FOREIGN KEY (agent_id) REFERENCES agent (agent_id));

SELECT
    agent_id
FROM
    op_CHI
INTERSECT
SELECT
        agent_id
FROM
    op_PAk;

-- except operation
-- create database films
-- create tables film and inventory

-- create table films (id int, name varhcar(80), release_year int, genere varchar(80));

-- INSERT INTO films (id, name, release_year, genre) VALUES
-- (1, 'Inception', 2010, 'Sci-Fi/Thriller'),
-- (2, 'The Shawshank Redemption', 1994, 'Drama'),
-- (3, 'The Godfather', 1972, 'Crime/Drama'),
-- (4, 'Pulp Fiction', 1994, 'Crime/Drama'),
-- (5, 'Forrest Gump', 1994, 'Drama/Romance'),
-- (6, 'The Dark Knight', 2008, 'Action/Crime'),
-- (7, 'Fight Club', 1999, 'Drama'),
-- (8, 'Interstellar', 2014, 'Sci-Fi/Drama'),
-- (9, 'The Matrix', 1999, 'Sci-Fi/Action'),
-- (10, 'Gladiator', 2000, 'Action/Drama'),
-- (11, 'Schindlers List', 1993, 'Biography/Drama'),
-- (12, 'The Lord of the Rings: The Fellowship of the Ring', 2001, 'Fantasy/Adventure'),
-- (13, 'Star Wars: Episode IV - A New Hope', 1977, 'Sci-Fi/Adventure'),
-- (14, 'Her', 2013, 'Sci-Fi/Romance'),
-- (15, 'Ex Machina', 2014, 'Sci-Fi/Thriller'),
-- (16, 'Blade Runner 2049', 2017, 'Sci-Fi/Action'),
-- (17, 'A.I. Artificial Intelligence', 2001, 'Sci-Fi/Drama');


-- CREATE TABLE inventory (id SERIAL PRIMARY KEY, title VARCHAR(100), release_year INT,  genre VARCHAR(50));

-- INSERT INTO inventory (title, release_year, genre) VALUES
-- ('Inception', 2010, 'Sci-Fi/Thriller'),
-- ('Interstellar', 2014, 'Sci-Fi/Drama'),
-- ('Her', 2013, 'Sci-Fi/Romance'),
-- ('Ex Machina', 2014, 'Sci-Fi/Thriller'),
-- ('Blade Runner 2049', 2017, 'Sci-Fi/Action');

-- except operation

(
    SELECT
    id,
    name
FROM
    films
EXCEPT
    SELECT
        DISTINCT inventory.id,
        title
    FROM
        inventory
    INNER JOIN films ON films.id = inventory.id)
    order by id;

-- GROUPING SETS
-- syntax

-- SELECT
--     column1,
--     column2,
--     aggregate_function(column3)
-- FROM
--     table_name
-- GROUP BY
--     GROUPING SETS (
--         (column1, column2),
--         (column1),
--         (column2),
--         ()
-- );

SELECT
    course_name,
    segment,
    SUM (quantity)
FROM
    geeksforgeeks_courses
GROUP BY
    course_name,
    segment;

SELECT
    course_name,
    SUM (quantity)
FROM
    geeksforgeeks_courses
GROUP BY
    course_name;

SELECT
    segment,
    SUM (quantity)
FROM
    geeksforgeeks_courses
GROUP BY
    segment;

SELECT
    GROUPING(course_name) grouping_course,
    GROUPING(segment) grouping_segment,
    course_name,
    segment,
    SUM (quantity)
FROM
    geeksforgeeks_courses
GROUP BY
    GROUPING SETS (
        (course_name, segment),
        (course_name),
        (segment),
        ()
    )
ORDER BY
    course_name,
    segment;

-- cube operator
-- eases while using multiple group by statements
-- SELECT
--     column1,
--     column2,
--     column3,
--     aggregate (column4)
-- FROM
--     table_name
-- GROUP BY
--     CUBE (column1, column2, column3);

SELECT
    course_name,
    segment,
    SUM (quantity)
FROM
    geeksforgeeks_courses
GROUP BY
    CUBE (course_name, segment)
ORDER BY
    course_name,
    segment;

SELECT
    course_name,
    segment,
    SUM (quantity)
FROM
    geeksforgeeks_courses
GROUP BY
    course_name,
    CUBE (segment)
ORDER BY
    course_name,
    segment;

-- rollup operator 
-- eases up using multiple group by statements

SELECT
    segment,
    course_name,
    SUM (quantity)
FROM
    geeksforgeeks_courses
GROUP BY
    segment,
    ROLLUP (course_name)
ORDER BY
    segment,
    course_name;