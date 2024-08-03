-- ALTERING TABLE QUERY
-- creating a tbale for altering
create table table_name (
	col1 int,
	some_col_date date
);

-- CREATING A TABLE FOR ALTERING
create table LINKS();

select * from LINKS;

-- ALETR TABLE LINKS
alter table LINKS add column ACTIVE BOOLEAN;

-- DROP a COLUMN
alter table LINKS drop column ACTIVE;

-- RENAME A COLUMN
alter table links add column active boolean;
alter table links rename column active to link_title;

-- ADD A COLUMN
alter table LINKS add column TARGET VARCHAR(10);
alter table LINKS add column url VARCHAR(256);

alter table LINKS
alter column TARGET
set DEFAULT '_BLANK';

-- ALETRING TYPE OF COLUMN WITHOUT DELETING
alter table bankstatements alter column balance type numeric(5,2);

insert into links(link_title, url) values(true,'https://www.google.com');

-- RENAME A TABLE
alter table links rename to href;

--testing purpouse
select * from href;

-- CREATING A DROP TABLE
-- testing purpouse creating an empty table
create table to_be_dropped_table();

select * from to_be_dropped_table;

-- drop table
drop table to_be_dropped_table;
-- a much better a query, doesnot throw an error...
drop table if exists to_be_dropped_table;

-- to remove table with large data sets we use truncate instead of delete, no drop as it will remove the tablespace instead only data
-- creating a dummy table
drop table if exists to_be_truncated;
create table to_be_truncated(col1 int, col2 boolean);
-- example to be truncated
select * from to_be_truncated;
-- inserting dummy rows
insert into to_be_truncated(col1, col2) values (2, false);
-- truncating the table
truncate table to_be_truncated;


-- COPY A TABLE
CREATE TABLE students(
   id SERIAL PRIMARY KEY,
   first_name VARCHAR,
   last_name VARCHAR,
   email VARCHAR UNIQUE
);

INSERT INTO students(first_name, last_name, email)
VALUES('Virender', 'Sehwag', 'virender.sehwag@gfg.com'),
    ('Hardik', 'Pandiya', 'hardik.Pandiya@gfg.com');
   
CREATE TABLE copy_students AS TABLE students;

create table COPY_STUDENTS_NODATA as table STUDENTS with no data;
   
SELECT * FROM students;
select * from COPY_STUDENTS;
select * from copy_students_nodata;
select * from COPY_PARTIAL_STUDENTS;

create table COPY_PARTIAL_STUDENTS as select * from STUDENTS where ID  = 1;

-- COMPARISION USING EXCEPT AND UNION
-- DATASET 1
CREATE TABLE foo (
    ID INT PRIMARY KEY,
    NAME VARCHAR (50)
);
INSERT INTO foo (ID, NAME)
VALUES
    (1, 'a'),
    (2, 'b');
-- DATASET 2
CREATE TABLE bar (
    ID INT PRIMARY KEY,
    NAME VARCHAR (50)
);
INSERT INTO bar (ID, NAME)
VALUES
    (1, 'a'),
    (2, 'b');
-- updating some value
update
	bar
set
	name = 'c'
where
	id = 2;



select * from bar;
select * from foo; 
   
-- except operator, all will be display only the ones that shows one but not the other

select
	ID,
	NAME,
	'not in foo' as note
from
	bar
except
    select
	ID,
	NAME,
	'not in foo' as note
from
	foo;

-- OUTER JOIN
-- TAKES THE OUTPUT OF LEFT JOIN AND RIGHT JOIN

SELECT
    id,
    name
FROM
    foo
FULL OUTER JOIN bar USING (id, name)
WHERE
    foo.id IS NULL
OR bar.id IS NULL;

-- SHOW THE TABLES
SELECT *
FROM pg_catalog.pg_tables

-- ALTER TABLE your_table
-- ALTER COLUMN existing_column SET DEFAULT nextval('your_sequence');

-- ALTER TABLE customer ALTER COLUMN id SET DEFAULT serial;
