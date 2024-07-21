-- TABLE MANAGING QUERIES

-- creatng table concept in general

-- CREATE TABLE TABLE_NAME (col_name TYPE col_constraint, table_constarint table_constraint) INHERITS existing_table_name;

--  table name is a natural key

-- column define column name, data type, and constraint, columns are seperated using , 
-- table level constraints can be NOT NULL, primary key, foriegn key
-- Inheritance specifies an existing table from which the new table inherits column, it's an postgres extension to SQL,
-- Making table creation more flexible

-- SELECT column_list INTO [ TEMPORARY | TEMP | UNLOGGED ] [ TABLE ] NEW_TABLE_NAME FROM TABLE_NAME WHERE condition

-- CREATING TABLE FOR INTO QUERY
CREATE TABLE FILM (FILM_ID SERIAL PRIMARY KEY, TITLE VARCHAR(256), RENTAL_RATE INT, RENTAL_DURATION INT, RATING VARCHAR(2));

-- INSERTING DATA INTO FILM
insert into FILM(TITLE, RENTAL_RATE, RENTAL_DURATION, RATING) VALUES('HARRY POTTER', 9, 3, 'Q'); 
insert into FILM(TITLE, RENTAL_RATE, RENTAL_DURATION, RATING) VALUES('DEAD POLL', 7, 5, 'R');
insert into FILM(TITLE, RENTAL_RATE, RENTAL_DURATION, RATING) VALUES('GAME OF THRONES', 6, 5, 'R');
insert into FILM(TITLE, RENTAL_RATE, RENTAL_DURATION, RATING) VALUES('AVENGERS', 10, 5, 'A');


-- EXAMPLE 1
select
	FILM_ID,
	TITLE,
	RENTAL_RATE
into table FILM_R
from
	film
where 
	RATING = 'R'
and RENTAL_DURATION = 5
order by 
	TITLE;
	
select * from FILM_R;

-- alter table FIMLM_R RENAME to FILM_R; 

-- EXAMPLE 2
select 
	FILM_ID,
	TITLE,
	LENGTH(TITLE)
into temp table SHORT_FILM
from
	film
where
	LENGTH(TITLE) < 19
order by 
	TITLE;

select * from SHORT_FILM;


-- CREATE A SEQUENCE
-- CREATE SEQUENCE [ IF NOT EXISTS ] sequence_name [ AS { SMALLINT | INT BIGINT } ]
-- [ INCREMENT [ BY ] increment ]
-- [ MINVALUE minvalue | NO MINVALUE ]
-- [ MAXVALUE maxvalue | NO MAXVALUE ]
-- [ START [ WITH ] start ]
-- [ CACHE cache ]
-- [ [NO] CYCLE ]
-- [ OWNED BY { table_name.column_name | NONE }]
	
-- EXAMPLE 1
create sequence mysequence
increment 5
start 10;

select nextval('mysequence');


-- EXAMPLE 2
create sequence three
increment -1
minvalue 1
maxvalue 3
start 3
cycle;


select nextval('THREE'); 

-- EXAMPLE 3
-- CREATING TABLE NAME
create table order_details(
	order_id serial,
	item_id int not null,
	product_id int,
	product_name text not null,
	primary key(order_id, item_id)
);

--Adding a column
alter table order_details add column price dec(10,2) not null;

create sequence order_item_id
start 10
increment 10
minvalue 10
owned by order_details.item_id;

insert into
	order_details(order_id, item_id, product_name, price)
values
	(100, nextval('order_item_id'), 'DVD player', 100),
	(100, nextval('order_item_id'), 'Andrioid TV', 550),
	(100, nextval('order_item_id'), 'Speaker', 250);


select * from order_details;




