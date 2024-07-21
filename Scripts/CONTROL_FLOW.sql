-- SCRIPT SHOWING CONTROL-FLOW

-- CHECKING WHICH IS GREATEST OF TWO NUMBERS
-- NOTE: NEED TO SELECT GULL DDL
-- -- MUCH NEEDDED CHANGES
SELECT * from film_conditional_types;
alter table film_conditional_types  add column ID SERIAL;
-- AUTOMATICALLY ADDS THE ID


-- EXAMPLE 1
DO $$
DECLARE
  a integer := 10;
  b integer := 20;
BEGIN 
  IF a > b THEN
    RAISE NOTICE 'a is greater than b';
  END IF;

  IF a < b THEN
    RAISE NOTICE 'a is less than b';
  END IF;

  IF a = b THEN
    RAISE NOTICE 'a is equal to b';
  END IF;
END $$;
-- END OF DDL

-- EXAMPLE 2
DO $$
DECLARE
   a integer := 10;
   b integer := 10;
BEGIN 
  IF a > b THEN 
     RAISE NOTICE 'a is greater than b';
  ELSIF a < b THEN
     RAISE NOTICE 'a is less than b';
  ELSE
     RAISE NOTICE 'a is equal to b';
  END IF;
END $$;
-- END OF DDL

-- CASE STATEMENT ARE OF 2 TYPES
-- 1. SIMPLE CASE STATEMENT
-- 2. SEARCHED CASE STATEMENT

--EXAMPLE 1
CREATE OR REPLACE FUNCTION get_price_segment(p_film_id integer)
   RETURNS VARCHAR(50) AS $$
DECLARE 
    rate   NUMERIC;
    price_segment VARCHAR(50);
BEGIN
      -- get the rate based on film_id
    SELECT INTO rate rental_rate 
    FROM film_conditional_types 
    WHERE id = p_film_id;

     CASE rate
    WHEN 0.99 THEN
            price_segment = 'Mass';
    WHEN 0.29 THEN
            price_segment = 'Mainstream';
    WHEN 0.49 THEN
            price_segment = 'High End';
    ELSE
        price_segment = 'Unspecified';
    END CASE;
    
   RETURN price_segment;
END; $$
LANGUAGE plpgsql;
-- END OF DDL

-- EXAMPLE 3
CREATE OR REPLACE FUNCTION get_customer_service (p_customer_id INTEGER) 
    RETURNS VARCHAR (25) AS $$ 
DECLARE
 total_payment NUMERIC ; 
        service_level VARCHAR (25) ;
BEGIN
 -- get the rate based on film_id
     SELECT
 INTO total_payment SUM (amount)
     FROM
 payment
     WHERE
 customer_id = p_customer_id ; 
  
   CASE
      WHEN total_payment >= 0.99 THEN
         service_level = 'Platinum' ;
      WHEN total_payment >= 0.49 THEN
     service_level = 'Gold' ;
      ELSE
         service_level = 'Silver' ;
   END CASE ;

   RETURN service_level ;
END ; $$ LANGUAGE plpgsql;
-- END OF DDL

create table payment(
	customer_id serial,
	total_payment numeric(3,2),
);

alter table payment add column title varchar(80);
alter table PAYMENT rename column TOTAL_PAYMENT to AMOUNT;

insert into PAYMENT(title, total_payment)
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

select * from PAYMENT;

SELECT  5 AS customer, get_customer_service (5);

