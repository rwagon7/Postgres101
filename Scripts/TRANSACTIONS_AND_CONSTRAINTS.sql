drop database TRANSaCTIONS;

create database TRANSACTIONS;

-- BEGIN STARTS A TRANSCATION
-- COMMIT ENDS THE TRANSCATION
-- ROLLBACK ROLL BACKS THE TRANSACTION


commit;
begin;
-- create table BANKSTATEMENTS (coustmer_id serial, full_name varchar(80), balance numeric(3,2));
-- alter table bankstatements alter column balance type numeric(5,2);

insert into BANKSTATEMENTS(
full_name,
balance
)
	values(
	'priya chetri', 500.09
		);

commit;

rollback;

select * from bankstatements ;
truncate bankstatements ;

-- intermediate table
-- DROP TABLE IF EXISTS
-- EXAMPLE 1 (On delete create 1 Action)
create table CUSTOMERS(
	customer_ID INT generated always as identity,
	CUSTOMER_NAME VARCHAR (255) not null,
	primary key(CUSTOMER_ID)
);

select * from customers;

create table CONTACTS(
	CONTACT_ID INT generated always as identity,
	CUSTOMER_ID INT,
	CONTACT_NAME VARCHAR(255) not null,
	PHONE VARCHAR(15),
	EMAIL VARCHAR(100),
	primary key(CONTACT_ID),
	CONSTraiNT FK_CUSTOMER
		foreign key(CUSTOMER_ID)
		REFERENCES CUSTOMERS(CUSTOMER_ID)
);

-- testing example 1
insert into customers(customer_name)
values
('geeks for geeks'),
('Dolphin LLC')	;

insert into contacts(
	customer_id,
	contact_name,
	phone,
	email
)
values 
(1, 'raja',  '123456789', null),
(1, 'raja',  '789123456', null),
(2, 'Nikhl', '945678129', null);

select * from contacts;
select * from customers;

-- delete from customers where customer_id = 1;
-- above query throws error by default, even though the contacts have not set on action

-- EXAMPLE 2 
create table CUSTOMERS2(
	customer_ID INT generated always as identity,
	CUSTOMER_NAME VARCHAR (255) not null,
	primary key(CUSTOMER_ID)
);

create table CONTACTS2(
	CONTACT_ID INT generated always as identity,
	CUSTOMER_ID INT,
	CONTACT_NAME VARCHAR(255) not null,
	PHONE VARCHAR(15),
	EMAIL VARCHAR(100),
	primary key(CONTACT_ID),
	CONSTraiNT FK_CUSTOMER
		foreign key(CUSTOMER_ID)
		REFERENCES CUSTOMERS(CUSTOMER_ID)
		on delete cascade
);

-- testing example 2
insert into customers2(customer_name)
values
('geeks for geeks'),
('Dolphin LLC')	;

insert into contacts2(
	customer_id,
	contact_name,
	phone,
	email
)
values 
(1, 'raja',  '123456789', null),
(1, 'raja',  '789123456', null),
(2, 'Nikhl', '945678129', null);


select * from CUSTOMERS2;
select * from contacts2;

--EXAMPLE 3
reate table CUSTOMERS3(
	customer_ID INT generated always as identity,
	CUSTOMER_NAME VARCHAR (255) not null,
	primary key(CUSTOMER_ID)
);

create table CONTACTS3(
	CONTACT_ID INT generated always as identity,
	CUSTOMER_ID INT,
	CONTACT_NAME VARCHAR(255) not null,
	PHONE VARCHAR(15),
	EMAIL VARCHAR(100),
	primary key(CONTACT_ID),
	CONSTraiNT FK_CUSTOMER
		foreign key(CUSTOMER_ID)
		REFERENCES CUSTOMERS(CUSTOMER_ID)
		on UPDATE cascade
);
