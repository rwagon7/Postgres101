select * from pg_database; 

-- ALTER DATABASE db_design_101 rename to practice_postgres_db;

-- alter database practice_postgres_db owner 'aniruddha-malladi';

-- connect postgres;

-- select * from pg_stat_activity where datname = 'test_db';

-- WHERE CLAUSE

-- CREATING TABLE TO WORK UPON
create table CLASSES (ID SERIAL primary key not null, class VARCHAR(80), GRADE INT);
commit;

create table CUSTOMER(ID SERIAL primary key not null, first_name varchar(80), last_name varchar(80), middle_name varchar(80), created_date date);
commit;

create table rentals(id serial primary key not null, model varchar(80), release_date date);
commit;

-- alter column name of table from created_date to dob
alter table customer rename column created_date to dob;
commit;

-- alter column name of table from release_date to purchase date
alter table rentals rename column release_date to purchase_date;
commit;

-- INSERT RECORDS INTO TABLE
insert into classes(class, grade) values('mathematics 101', 10);
insert into classes(class, grade) values('science 101', 10);
insert into classes(class, grade) values('sanskrit 101', 10);
insert into classes(class, grade) values('telugu 201', 10);
insert into classes(class, grade) values('mathematics 201', 5);
insert into classes(class, grade) values('science 501', 5);

insert into customer(first_name, last_name, middle_name, dob) values('aniruddha','malladi','sharma','1999-06-26');
insert into customer(first_name, last_name, middle_name, dob) values('kelly','jon','marcus','2000-07-30');
insert into customer(first_name, last_name, middle_name, dob) values('prabhas','kalki','karna','1999-06-26');
insert into customer(first_name, last_name, middle_name, dob) values('drake','marvel','autumn','2001-06-03');
insert into customer(first_name, last_name, middle_name, dob) values('elizibeth','gardens','siri','1999-06-26');
insert into customer(first_name, last_name, middle_name, dob) values('jacks','bull','wayne','1999-06-26');

insert into rentals(model, purchase_date) values('audi', '1999-06-26');
insert into rentals(model, purchase_date) values('bmw', '2000-09-15');
insert into rentals(model, purchase_date) values('nexa', '2002-05-4');
insert into rentals(model, purchase_date) values('ambasador', '2000-05-4');


-- SELECT COMMAND TO LAUNCH A VIEW
select * from CUSTOMER;

select * from rentals;

-- DELETE COMMAND TO REMOVE A ROW
delete from customer where id = 2;
commit;

-- UPDATE COMMAND TO RDIT A VALUE
update CUSTOMER set last_name = 'bullseye' where id = 3; 

-- WHERE CLAUSE EXAMPLES ON TABLE

-- FIRST 

select 
	LAST_NAME,
	FIRST_NAME
from
	customer
where 
	FIRST_NAME = 'aniruddha';
	
-- SECOND

select
	FIRST_NAME,
	LAST_NAME
from
	customer
where
	FIRST_NAME = 'aniruddha'
and	last_name = 'bull';

-- THIRD

select
	FIRST_NAME,
	LAST_NAME
from
	customer
where
	FIRST_NAME = 'aniruddha'
or	last_name = 'bull';
	
-- FOURTH

select
	first_name,
	last_name
from 
	customer
where first_name in ('aniruddha','prabhas','drake');

-- FIFTH

select
	first_name,
	last_name
from
	customer
where
	last_name like '%b%';

-- SIXTH

select
	first_name,
	last_name,
	length(last_name) last_name_length
from
	customer
where
	first_name like '%a%'
	and 
	length(last_name) between 3 and 5
order by
	last_name_length;
	
-- SEVENTH

select
	first_name,
	last_name
from
	customer
where
	last_name like '%b%'
and
	last_name <> 'bull';
	

-- FETCH CLAUSE

-- FIRST

select
  * 
from
	CUSTOMER
order by
	first_NAME
fetch first 3 row only;

-- SECOND

select 
	*
from customer
order by
	id
offset 2
fetch first 4 row only;


-- USING A SUBQUERY WITH IN OPERATOR

select
	FIRST_NAME,
	LAST_NAME,
	dob
from
	customer
where
	dob in (
		select
			purchase_date
		from
			rentals
	);

-- HAVING CLAUSE

select
	first_name,
	sum(id)
from
	customer
group by
	id
having
	(id) % 2 = 0;

-- GROUP BY CLAUSE

select
	count(*)
from
	customer
group by
	dob;


