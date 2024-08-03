-- subqueries and cte's
-- The subquery must return exactly one column.
-- The ANY operator must be preceded by one of the following comparison operator =, <=, >, <, > and <>
-- The ANY operator returns true if any
-- any operator
SELECT a
FROM data
WHERE data.a >= ANY(
        SELECT MAX(data.a)
        FROM playlist
    );
-- all operator
-- The PostgreSQL ALL operator is used for comparing a value with a list of values returned by a subquery.
-- example 1
SELECT id,
    name,
    release_year
FROM films
WHERE release_year > ALL (
        SELECT ROUND(AVG (release_year), 2)
        FROM films
        GROUP BY release_year
    )
ORDER BY release_year;
-- example 2
(
    select *
    from films
    where release_year = (
            select round(avg (release_year), 2)
            from films
            group by release_year
            limit 1
        )
)
order by name;
-- exists operator
-- The EXISTS operator in PostgreSQL is a powerful tool for testing the existence of rows in a subquery. 
-- INSERT INTO customer (first_name, last_name) VALUES ('John', 'Doe');
-- INSERT INTO customer (first_name, last_name) VALUES ('Jane', 'Smith');
-- INSERT INTO customer (first_name, last_name) VALUES ('Michael', 'Johnson');
-- INSERT INTO customer (first_name, last_name) VALUES ('Emily', 'Davis');
-- INSERT INTO customer (first_name, last_name) VALUES ('Daniel', 'Brown');
-- INSERT INTO customer (first_name, last_name) VALUES ('Emma', 'Wilson');
-- INSERT INTO customer (first_name, last_name) VALUES ('Olivia', 'Miller');
-- INSERT INTO customer (first_name, last_name) VALUES ('Liam', 'Taylor');
-- INSERT INTO customer (first_name, last_name) VALUES ('Noah', 'Anderson');
-- INSERT INTO customer (first_name, last_name) VALUES ('Sophia', 'Thomas');
SELECT name
FROM films f
WHERE NOT EXISTS (
        SELECT 1
        FROM inventory i
        WHERE f.id = i.id
    )
ORDER BY name;
-- CTE (common table operations)
-- create a function for repeating operations
-- syntax
-- WITH cte_name (column_list) AS (
--    CTE_query_definition
-- )
-- statement;
--- 
WITH cte_film AS (
    SELECT id,
        name,
        (
            CASE
                WHEN release_year < 1990 THEN 'Old'
                WHEN release_year < 2010
                and release_year > 2000 THEN 'Medium'
                ELSE 'Present'
            END
        ) release_year
    FROM films
)
SELECT id,
    name,
    release_year
FROM cte_film
ORDER BY name;
-- example 2
WITH cte_film AS (
    SELECT id,
        name,
        RANK() length_rank
    FROM films
)
SELECT *
FROM cte_film
order by name;
-- deleting duplicate records

select count(fruits) 
     (
            case
                when fruit = 'o' then 'orange'
                else 'apple'
            end
        ) as fruit,
        COUNT(fruit)
    FROM basket
    GROUP BY fruit
    HAVING COUNT(fruit) > 1
) as fruits
group BY fruits;