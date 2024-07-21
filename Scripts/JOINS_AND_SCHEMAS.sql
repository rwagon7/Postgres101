-- JOINS AND SCHEMAES
-- THE TABLE ON LEFT SIDE IS UPON RIGHT JOIN

-- create a database
CREATE database zoo;

-- create table zoo_1
drop table if exists zoo_1;
create table zoo_1 (
	id serial primary key,
	animal varchar(100) not null

);

-- create table zoo_2
drop table if exists zoo_2;
create table zoo_2 (
	id serial,
	animal varchar(100) not null
);
alter table zoo_2 drop column id;
-- insert data into zoo_1
insert into zoo_1(animal)
values
	('Tiger'),
	('Loin'),
	('wolf'),
	('fox');
-- UPDATE LOIN TO LION
update ZOO_1 set ANIMAL = 'Lion' where id = 2;
-- insert data into zoo_2
insert into zoo_2(animal)
values
	('Tiger'),
	('Lion'),
	('Rhino'),
	('Panther');

-- INNER JOIN
select
	ZOO_1.ID ID_A,
	ZOO_1.ANIMAL ANIMAL_A,
	ZOO_2.ID ID_B,
	ZOO_2.ANIMAL ANIMAL_B
from
	ZOO_1
inner join ZOO_2 on ZOO_1.ANIMAL = ZOO_2.ANIMAL;
	
-- LEFT JOIN
select
	ZOO_1.ID ID_A,
	ZOO_1.ANIMAL ANIMAL_A,
	ZOO_2.ID ID_B,
	ZOO_2.ANIMAL ANIMAL_B
from
	ZOO_1
LEFT join ZOO_2 on ZOO_1.ANIMAL = ZOO_2.ANIMAL;

-- RIGHT JOIN
select
	ZOO_1.ID,
	ZOO_1.ANIMAL,
	ZOO_2.ID,
	ZOO_2.ANIMAL
from
	ZOO_1
RIGHT join ZOO_2 on ZOO_1.ANIMAL = ZOO_2.ANIMAL;
	
-- FULL OUTTER JOIN
select
	zoo_1.id,
	zoo_1.animal,
	zoo_2.id,
	zoo_2.animal
from
	zoo_1
full join zoo_2 on zoo_1.animal = zoo_2.animal;


