-- create database
CREATE DATABASE akwino_mediadb;

-- select the database just created
USE akwino_mediadb;

-- create tables
CREATE TABLE EmployeeA (
    employee_id INT PRIMARY KEY,
    first_name VARCHAR(64),
    last_name VARCHAR(64),
    salary INT
);

CREATE TABLE EmployeeB (
    employee_id INT PRIMARY KEY,
    first_name VARCHAR(64),
    last_name VARCHAR(64),
    salary INT    
);

-- add sample data
INSERT INTO EmployeeA (employee_id, first_name, last_name, salary) 
VALUES 
(1, 'Adam', 'Kimutai', 10000),
(2, 'Peter', 'Rock', 12000),
(3, 'Phillip', 'Jonah', 14000),
(4, 'Andrew', 'Koech', 15000),
(5, 'James', 'Zebdee', 18000);

INSERT INTO EmployeeB (employee_id, first_name, last_name, salary) 
VALUES 
(1, 'Dominic', 'Kirwa', 10500),
(2, 'Peter', 'Rock', 12000),
(3, 'Chirchir', 'Keter', 16000),
(4, 'Ann', 'Joachim', 9000),
(5, 'James', 'Zebdee', 18000);

-- Use the UNION operator to retrieve a list of unique employees from both tables.
SELECT * FROM employeeA UNION SELECT ALL * FROM employeeB;
-- +-------------+------------+-----------+--------+
-- | employee_id | first_name | last_name | salary |
-- +-------------+------------+-----------+--------+
-- |           1 | Adam       | Kimutai   |  10000 |
-- |           2 | Peter      | Rock      |  12000 |
-- |           3 | Phillip    | Jonah     |  14000 |
-- |           4 | Andrew     | Koech     |  15000 |
-- |           5 | James      | Zebdee    |  18000 |
-- |           1 | Dominic    | Kirwa     |  10500 |
-- |           3 | Chirchir   | Keter     |  16000 |
-- |           4 | Ann        | Joachim   |   9000 |
-- +-------------+------------+-----------+--------+
-- 8 rows in set (0.0012 sec)


-- Use the INTERSECT operator to find employees who are common in both tables.
SELECt * FROM employeeA INTERSECT SELECT * FROM employeeB ORDER BY last_name;
-- +-------------+------------+-----------+--------+
-- | employee_id | first_name | last_name | salary |
-- +-------------+------------+-----------+--------+
-- |           2 | Peter      | Rock      |  12000 |
-- |           5 | James      | Zebdee    |  18000 |
-- +-------------+------------+-----------+
-- 2 rows in set (0.0010 sec)


-- Use the EXCEPT operator to identify employees present in 
-- EmployeesA but not in EmployeesB.
SELECT * FROM employeeA EXCEPT SELECT * FROM employeeB ORDER BY last_name;
-- +-------------+------------+-----------+--------+
-- | employee_id | first_name | last_name | salary |
-- +-------------+------------+-----------+--------+
-- |           3 | Phillip    | Jonah     |  14000 |
-- |           1 | Adam       | Kimutai   |  10000 |
-- |           4 | Andrew     | Koech     |  15000 |
-- +-------------+------------+-----------+--------+
-- 3 rows in set (0.0018 sec)