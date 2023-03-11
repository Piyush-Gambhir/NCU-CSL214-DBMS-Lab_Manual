-- Problem Statement

-- 1)	Write a query to display first name, last name, package number and internet speed for all customers.
-- 2)	Write a query to display first name, last name, package number and internet speed for all customers whose package number equals 22 or 27. Order the query in ascending order by last name.
-- 3)	Display the package number, internet speed, monthly payment and sector name for all packages (Packages and Sectors tables).
-- 4)	Display the customer name, package number, internet speed, monthly payment and sector name for all customers (Customers, Packages and Sectors tables).
-- 5)	Display the customer name, package number, internet speed, monthly payment and sector name for all customers in the business sector (Customers, Packages and Sectors tables).
-- 6)	Display the last name, first name, join date, package number, internet speed and sector name for all customers in the private sector who joined the company in the year 2006.
-- 7)	Display the package number, internet speed, monthly payment and Customer_id for all packages (Packages and Customers table).
-- 8)	Display the first name, last name, internet speed and monthly payment for all customers. Use INNER JOIN to solve this exercise.
-- 9)	 Display the last name, first name and package number for all customers who have the same package number as customer named ‘Amado Taylor’ (Customers table).
-- 10)	 Display the package number and internet speed for all packages whose internet speed is equal to the internet speed of package number 10 (Packages table).

-- DROP DATABASE IF EXISTS EXPERIMENT_5;
DROP DATABASE IF EXISTS EXPERIMENT_5;

-- CREATING DATABASE
CREATE DATABASE EXPERIMENT_5;

-- USING DATABASE
USE EXPERIMENT_5;

-- CREATING TABLES
CREATE TABLE Pack_grades(
    Grade_id INT NOT NULL,
    Grade_name VARCHAR(20) NOT NULL,
    Min_price INT NOT NULL,
    Max_price INT NOT NULL,
    PRIMARY KEY(Grade_id)
);

CREATE TABLE Customers(
    Customer_id INT NOT NULL,
    First_name VARCHAR(20) NOT NULL,
    Last_name VARCHAR(20) NOT NULL,
    Birth_date DATE NOT NULL,
    Join_date DATE NOT NULL,
    City VARCHAR(20) NOT NULL,
    Pack_id INT,
    State VARCHAR(20) NOT NULL,
    PRIMARY KEY(Customer_id)
);

CREATE TABLE Packages(
    Pack_id INT NOT NULL,
    Speed INT NOT NULL,
    Start_date DATE NOT NULL,
    Monthly_payment INT NOT NULL,
    Sector_id INT,
    PRIMARY KEY(Pack_id)
);

CREATE TABLE Sectors(
    Sector_id INT NOT NULL,
    Sector_name VARCHAR(20) NOT NULL,
    PRIMARY KEY(Sector_id)
);

ALTER TABLE Customers ADD 
FOREIGN KEY(Pack_id) REFERENCES Packages(Pack_id);

ALTER TABLE Packages ADD
FOREIGN KEY(Sector_id) REFERENCES Sectors(Sector_id);

-- INSERTING VALUES INTO TABLES

INSERT INTO Pack_grades(Grade_id, Grade_name, Min_price, Max_price) VALUES(1, 'A', 0, 100);
INSERT INTO Pack_grades(Grade_id, Grade_name, Min_price, Max_price) VALUES(2, 'B', 101, 200);
INSERT INTO Pack_grades(Grade_id, Grade_name, Min_price, Max_price) VALUES(3, 'C', 201, 300);
INSERT INTO Pack_grades(Grade_id, Grade_name, Min_price, Max_price) VALUES(4, 'D', 301, 400);

INSERT INTO Customers(Customer_id, First_name, Last_name, Birth_date, Join_date, City, Pack_id, State) VALUES(1, 'Amado', 'Taylor', '1990-01-01', '2006-01-01', 'New York', NULL, 'NY');
INSERT INTO Customers(Customer_id, First_name, Last_name, Birth_date, Join_date, City, Pack_id, State) VALUES(2, 'Luis', 'Gonzalez', '1990-01-01', '2006-01-01', 'New York', NULL, 'NY');
INSERT INTO Customers(Customer_id, First_name, Last_name, Birth_date, Join_date, City, Pack_id, State) VALUES(3, 'Maria', 'Gonzalez', '1990-01-01', '2006-01-01', 'New York', NULL, 'NY');
INSERT INTO Customers(Customer_id, First_name, Last_name, Birth_date, Join_date, City, Pack_id, State) VALUES(4, 'Jose', 'Gonzalez', '1990-01-01', '2006-01-01', 'New York', NULL, 'NY');

INSERT INTO Packages(Pack_id, Speed, Start_date, Monthly_payment, Sector_id) VALUES(22, 10, '2006-01-01', 100, NULL);
INSERT INTO Packages(Pack_id, Speed, Start_date, Monthly_payment, Sector_id) VALUES(27, 20, '2006-01-01', 200, NULL);
INSERT INTO Packages(Pack_id, Speed, Start_date, Monthly_payment, Sector_id) VALUES(28, 30, '2006-01-01', 300, NULL);
INSERT INTO Packages(Pack_id, Speed, Start_date, Monthly_payment, Sector_id) VALUES(29, 40, '2006-01-01', 400, NULL);

INSERT INTO Sectors(Sector_id, Sector_name) VALUES(1, 'Private');
INSERT INTO Sectors(Sector_id, Sector_name) VALUES(2, 'Business');

UPDATE Customers SET Pack_id = 27 WHERE Customer_id = 1;
UPDATE Customers SET Pack_id = 22 WHERE Customer_id = 2;
UPDATE Customers SET Pack_id = 29 WHERE Customer_id = 3;
UPDATE Customers SET Pack_id = 28 WHERE Customer_id = 4;

UPDATE Packages SET Sector_id = 1 WHERE Pack_id = 22;
UPDATE Packages SET Sector_id = 1 WHERE Pack_id = 27;
UPDATE Packages SET Sector_id = 2 WHERE Pack_id = 29;
UPDATE Packages SET Sector_id = 2 WHERE Pack_id = 28;

-- PROBLEM STATEMENT SOLUTIONS

-- 1)	Write a query to display first name, last name, package number and internet speed for all customers.
SELECT Customers.First_name, Customers.Last_name, Packages.Pack_id, Packages.Speed FROM Customers
INNER JOIN Packages ON Customers.Pack_id = Packages.Pack_id;

-- 2)	Write a query to display first name, last name, package number and internet speed for all customers whose package number equals 22 or 27. Order the query in ascending order by last name.
SELECT Customers.First_name, Customers.Last_name, Packages.Pack_id, Packages.Speed FROM Customers
INNER JOIN Packages ON Customers.Pack_id = Packages.Pack_id
WHERE Packages.Pack_id = 22 OR Packages.Pack_id = 27
ORDER BY Customers.Last_name ASC;

-- 3)	Display the package number, internet speed, monthly payment and sector name for all packages (Packages and Sectors tables).
SELECT Packages.Pack_id, Packages.Speed, Packages.Monthly_payment, Sectors.Sector_name FROM Packages
INNER JOIN Sectors ON Packages.Sector_id = Sectors.Sector_id;

-- 4)	Display the customer name, package number, internet speed, monthly payment and sector name for all customers (Customers, Packages and Sectors tables).
SELECT Customers.First_name, Customers.Last_name, Packages.Pack_id, Packages.Speed, Packages.Monthly_payment, Sectors.Sector_name FROM Customers
INNER JOIN Packages ON Customers.Pack_id = Packages.Pack_id
INNER JOIN Sectors ON Packages.Sector_id = Sectors.Sector_id;

-- 5)	Display the customer name, package number, internet speed, monthly payment and sector name for all customers in the business sector (Customers, Packages and Sectors tables).
SELECT Customers.First_name, Customers.Last_name, Packages.Pack_id, Packages.Speed, Packages.Monthly_payment, Sectors.Sector_name FROM Customers
INNER JOIN Packages ON Customers.Pack_id = Packages.Pack_id
INNER JOIN Sectors ON Packages.Sector_id = Sectors.Sector_id
WHERE Sectors.Sector_name = 'Business';

-- 6)	Display the last name, first name, join date, package number, internet speed and sector name for all customers in the private sector who joined the company in the year 2006.
SELECT Customers.Last_name, Customers.First_name, Customers.Join_date, Packages.Pack_id, Packages.Speed, Sectors.Sector_name FROM Customers
INNER JOIN Packages ON Customers.Pack_id = Packages.Pack_id
INNER JOIN Sectors ON Packages.Sector_id = Sectors.Sector_id
WHERE Sectors.Sector_name = 'Private' AND Customers.Join_date LIKE '2006%';

-- 7)	Display the package number, internet speed, monthly payment and Customer_id for all packages (Packages and Customers table).
SELECT Packages.Pack_id, Packages.Speed, Packages.Monthly_payment, Customers.Customer_id FROM Packages
INNER JOIN Customers ON Packages.Pack_id = Customers.Pack_id;

-- 8)	Display the first name, last name, internet speed and monthly payment for all customers. Use INNER JOIN to solve this exercise.
SELECT Customers.First_name, Customers.Last_name, Packages.Speed, Packages.Monthly_payment FROM Customers
INNER JOIN Packages ON Customers.Pack_id = Packages.Pack_id;

-- 9)	 Display the last name, first name and package number for all customers who have the same package number as customer named ‘Amado Taylor’ (Customers table).
SELECT Customers.Last_name, Customers.First_name, Customers.Pack_id FROM Customers
WHERE Customers.Pack_id = (SELECT Customers.Pack_id FROM Customers WHERE Customers.First_name = 'Amado' AND Customers.Last_name = 'Taylor');

-- 10)	 Display the package number and internet speed for all packages whose internet speed is equal to the internet speed of package number 10 (Packages table).
SELECT Packages.Pack_id, Packages.Speed FROM Packages
WHERE Packages.Speed = (SELECT Packages.Speed FROM Packages WHERE Packages.Pack_id = 10);