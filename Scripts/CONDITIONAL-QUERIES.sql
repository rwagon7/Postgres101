-- ADDIGN CONDITIONS TO OUR QUERIES, CONDITIONAL SQL
-- syntax:
-- CASE 
-- WHEN condition_1  THEN result_1   WHEN condition_2  THEN result_2 [WHEN ...] [ELSE result_n] END

-- creating table film
create database conditional_types;
create table film_conditional_types(title varchar(80), rental_rate numeric(4,2));

-- ineserting data
insert into film_conditional_types(title, rental_rate)
values
('harry potter',0.99),
('interstellar',0.99),
('we donot talk anymore',0.99),
('my name is...',0.99),
('goat',0.49),
('till i collapse',0.29),
('bharat mata ki jai...',0.29),
('namah shivaya..',0.99);
('atchutam kesavam',0.49);



SELECT
    SUM (
        CASE
        WHEN rental_rate = 0.99 THEN
            1
        ELSE
            0
        END
    ) AS "Mass",
    SUM (
        CASE
        WHEN rental_rate = 0.29 THEN
            1
        ELSE
            0
        END
    ) AS "Economic",
    SUM (
        CASE
        WHEN rental_rate = 0.49 THEN
            1
        ELSE
            0
        END
    ) AS "Luxury"
FROM
    film_conditional_types;
    
   
 -- the COALESCE function returns the first non-null argument. It is generally used with the SELECT statement to handle null values effectively.
 -- coALENSCE SETTING
-- syntax:  COALENSCE (Arg1, Arg2, Arg3 ...);

-- preaping required data
--creating data
  CREATE TABLE items (
    ID serial PRIMARY KEY,
    product VARCHAR (100) NOT NULL,
    price NUMERIC NOT NULL,
    discount NUMERIC
);

CREATE TABLE posts (
  id serial primary key,
    title VARCHAR (255) NOT NULL,
    excerpt VARCHAR (150),
    body TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP
);

INSERT INTO items (product, price, discount)
VALUES
    ('A', 1000, 10),
    ('B', 1500, 20),
    ('C', 800, 5),
    ('D', 500, NULL);
   
INSERT INTO posts (title, excerpt, body)
VALUES
      ('test post 1','test post excerpt 1','test post body 1'),
      ('test post 2','','test post body 2'),
      ('test post 3', null ,'test post body 3');

-- with coalsence
SELECT
    product,
    (price - COALESCE(discount, 0)) AS net_price
FROM
    items;
-- without coalsence
SELECT
    product,
    (price - discount) AS net_price
FROM
    items;

-- veiwing data
SELECT
    ID,
    title,
    excerpt
FROM
    posts;
    
 -- excerpt column will reoace null
   select
	id,
	title,
	coalesce (excerpt,
	left(body,
	40))
from
	posts;

-- to handle '', we use nullif
SELECT
    id,
    title,
    COALESCE (
        NULLIF (excerpt, ''),
        LEFT (body, 40)
    )
FROM
    posts;
    
   
-- cast one data type to another
SELECT CAST ('100' AS INTEGER);