-- MODIFYING DATA IN TABLES
-- CREATING DATA TO WORK
CREATE DATABASE company;

CREATE TABLE employee (
    employee_id INT PRIMARY KEY,
    first_name VARCHAR (255) NOT NULL,
    last_name VARCHAR (255) NOT NULL,
    manager_id INT,
    FOREIGN KEY (manager_id) 
    REFERENCES employee (employee_id) 
    ON DELETE CASCADE
);

--INSERT MULTIPLE VALUES
INSERT INTO employee (
    employee_id,
    first_name,
    last_name,
    manager_id
)
VALUES
    (1, 'Sandeep', 'Jain', NULL),
    (2, 'Abhishek ', 'Kelenia', 1),
    (3, 'Harsh', 'Aggarwal', 1),
    (4, 'Raju', 'Kumar', 2),
    (5, 'Nikhil', 'Aggarwal', 2),
    (6, 'Anshul', 'Aggarwal', 2),
    (7, 'Virat', 'Kohli', 3),
    (8, 'Rohit', 'Sharma', 3);
    
   
-- INSERT INTO EMPLOYEE
INSERT INTO employee (
    employee_id,
    first_name,
    last_name,
    manager_id
)
VALUES
    (9, 'Mohit', 'Verma', 3);
   
-- MODIFYING DATA USING UPDATE QUERY
update employee 
set  LAST_NAME = 'SINGH'
where FIRST_NAME = 'Raju';


-- DELETING QUERY USING DELETE QUERY
DELETE FROM employee
WHERE first_name = 'Raju';

delete from EMPLOYEE
where LAST_NAME = 'Kelenia';
   

-- UPSERT DATA USING QUERY
-- The UPSERT statement is a DBMS feature that allows a DML statement’s author to either insert a row or 
-- if the row already exists, UPDATE that existing row instead.
-- INSERT INTO table_name(column_list) VALUES(value_list) ON CONFLICT target action;


-- CREATING DATA FOR UPREST
CREATE TABLE employees (
 employee_id serial PRIMARY KEY,
 full_name VARCHAR NOT NULL,
 manager_id INT
);


INSERT INTO employees (
 employee_id,
 full_name,
 manager_id
)
VALUES
 (1, 'M.S Dhoni', NULL),
 (2, 'Sachin Tendulkar', 1),
 (3, 'R. Sharma', 1),
 (4, 'S. Raina', 1),
 (5, 'B. Kumar', 1),
 (6, 'Y. Singh', 2),
 (7, 'Virender Sehwag ', 2),
 (8, 'Ajinkya Rahane', 2),
 (9, 'Shikhar Dhawan', 2),
 (10, 'Mohammed Shami', 3),
 (11, 'Shreyas Iyer', 3),
 (12, 'Mayank Agarwal', 3),
 (13, 'K. L. Rahul', 3),
 (14, 'Hardik Pandya', 4),
 (15, 'Dinesh Karthik', 4),
 (16, 'Jasprit Bumrah', 7),
 (17, 'Kuldeep Yadav', 7),
 (18, 'Yuzvendra Chahal', 8),
 (19, 'Rishabh Pant', 8),
 (20, 'Sanju Samson', 8);


-- UPSERT
insert into employees(employee_id,full_name)
values(6,'Yuvraj Singh')
on conflict(employee_id)
do
update set full_name=EXCLUDED.full_name; 

insert into employees(employee_id,full_name,manager_id)
values(21,'W. Sundar',6)
on conflict (employee_id)
do nothing; 

select * from employee;
select * from EMPLOYEES;   
   
   