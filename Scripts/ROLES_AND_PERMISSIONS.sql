-- create a databse roles
-- create a role query

-- only creates a role with null login 
create role raju;
-- create a role in passwordṭ
create role raju login password 'mypassword1';
-- altering password for a role
alter role role_name login password 'mypassword1';

-- create superuser roles
CREATE ROLE Ani SUPERUSER LOGIN PASSWORD 'mypassword1';

-- create a role that can create a db
CREATE ROLE dba CREATEDB LOGIN PASSWORD 'Abcd1234';

-- create a role that can expires after sometimes in future
CREATE ROLE dev_api WITH LOGIN PASSWORD 'securePass1' VALID UNTIL '2030-01-01';

-- create a role with limit on transactions
CREATE ROLE api LOGIN PASSWORD 'securePass1' CONNECTION LIMIT 1000;

-- alter roles and queries
ALTER ROLE ravi VALID UNTIL '2024-12-31';
ALTER ROLE ravi CREATEDB;

-- Important Conisderations It is important to note that to remove a superuser role, one needs to be a superuser.
-- To remove non-superuser roles, you will need the privilege to create a role using the CREATE ROLE statement.

-- If we accidentally try to remove a role that has been referenced in any database,
-- PostgreSQL raises an error. In this case, one has to take two steps:

-- step1
-- to swap owner ship -- drop owned by --drop the unwanted role
REASSIGN OWNED BY api TO dba; DROP OWNED BY api; DROP ROLE abi;

-- step2

-- GRANT STATEMENT
--the GRANT statement is a powerful tool used to assign privileges to a role, allowing it to alter database objects like tables, views, functions, and more.
-- GRANT privilege_list | ALL ON  table_name TO  role_name;
-- SELECT, INSERT, UPDATE, DELETE, TRUNCATE

-- creating test data
-- CREATE ROLE anshul LOGIN PASSWORD 'geeks12345';
-- creating players table name
-- select * from players;

GRANT [ALL | SELECT | UPDATE | DELETE | INSERT] ON [TABLE_NAME] FROM [ROLES];z  
REVOKE [ALL | SELECT | UPDATE | DELETE | INSERT] ON [TABLE_NAME] FROM [ROLES];

-- revoking assigned roles in hierarchy
-- useful testcases 
-- CREATE ROLE abhishek LOGIN PASSWORD 'geeks12345';

REVOKE [ALL | SELECT | UPDATE | DELETE | INSERT] ON [TABLE_NAME] FROM [ROLES];

-- GRANTING GROUPS AS WELL

-- creating groups that inherit same set of data alias role-membership
-- step1
create role marketing noinherit;
-- step2 
create role planning noinherit;
-- step3 Grant all privileges on contacts table to marketing:
grant all on contacts to marketing;
-- step4
grant all on forecasts to planning;
-- step5
grant marketing to anil;
-- step6
grant marketing to planning;
-- step7 for testing purpouse
select * from forecasts;

