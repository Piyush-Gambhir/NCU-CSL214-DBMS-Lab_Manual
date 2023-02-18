-- Problem Statement
-- From the COMPANY database as mentioned and described in the previous database :
-- 1)   Retrieve the birth date and address of the employee(s) whose name is ‘John B. Smith’.
-- 2)	Retrieve the name and address of all employees who work for the ‘Research’ department.
-- 3)	For every project located in ‘Stafford’, list the project number, the controlling department number, and the department manager’s last name, address, and birth date.
-- 4)	Select all combinations of EMPLOYEE Ssn and DEPARTMENT Dname in the database.
-- 5)	Retrieve all the attribute values of any EMPLOYEE who works in DEPARTMENT number 5.
-- 6)	Retrieve all distinct salary values.
-- 7)	Make a list of all project numbers for projects that involve an employee whose last name is ‘Smith’, either as a worker or as a manager of the department that controls the project.
-- 8)	Retrieve all employees whose address is in Houston, Texas.
-- 9)	Find all employees who were born during the 1950s
-- 10)	Show the resulting salaries if every employee working on the ‘ProductX’ project is given a 10 percent raise.
-- 11)	Retrieve a list of employees and the projects they are working on, ordered by department and, within each department, ordered alphabetically by last name, then first name.

-- DROP DATABASE IF EXISTS EXPERIMENT_4;

DROP DATABASE IF EXISTS EXPERIMENT_4;

-- CREATING DATABASE

CREATE DATABASE EXPERIMENT_4;
USE EXPERIMENT_4;

-- CREATING TABLES

CREATE TABLE DEPARTMENT(
    Dname VARCHAR(15) NOT NULL,
    Dnumber INT NOT NULL,
    Mgr_ssn CHAR(9) NOT NULL,
    Mgr_start_date DATE,
    PRIMARY KEY(Dnumber),
    UNIQUE(Dname)
);
CREATE TABLE EMPLOYEE(
    Fname VARCHAR(15) NOT NULL,
    Minit CHAR,
    Lname VARCHAR(15) NOT NULL,
    Ssn CHAR(9) NOT NULL,
    Bdate DATE,
    Address VARCHAR(30),
    Sex CHAR,
    Salary DECIMAL(10, 2),
    Super_ssn CHAR(9),
    Dno INT NOT NULL,
    PRIMARY KEY (Ssn),
    FOREIGN KEY (Super_ssn) REFERENCES EMPLOYEE(Ssn),
    FOREIGN KEY (Dno) REFERENCES DEPARTMENT(Dnumber)
);
ALTER TABLE DEPARTMENT
ADD FOREIGN KEY(Mgr_ssn) REFERENCES EMPLOYEE(Ssn);
CREATE TABLE DEPARTMENT_LOCATIONS(
    DNumber INT NOT NULL,
    DLocation VARCHAR(15) NOT NULL,
    PRIMARY KEY(DNumber, DLocation),
    FOREIGN KEY(DNumber) REFERENCES DEPARTMENT(Dnumber)
);
CREATE TABLE PROJECT(
    Pname VARCHAR(15) NOT NULL,
    Pnumber INT NOT NULL,
    Plocation VARCHAR(15),
    Dnum INT NOT NULL,
    PRIMARY KEY(Pnumber),
    UNIQUE(Pname),
    FOREIGN KEY(Dnum) REFERENCES DEPARTMENT(Dnumber)
);
CREATE TABLE WORKS_ON(
    Essn CHAR(9) NOT NULL,
    Pno INT NOT NULL,
    Hours DECIMAL(3, 1),
    PRIMARY KEY(Essn, Pno),
    FOREIGN KEY(Essn) REFERENCES EMPLOYEE(Ssn),
    FOREIGN KEY(Pno) REFERENCES PROJECT(Pnumber)
);
CREATE TABLE DEPENDENT(
    Essn CHAR(9) NOT NULL,
    Dependent_name VARCHAR(15) NOT NULL,
    Sex CHAR,
    Bdate DATE,
    Relationship VARCHAR(15),
    PRIMARY KEY(Essn, Dependent_name),
    FOREIGN KEY(Essn) REFERENCES EMPLOYEE(Ssn)
);

-- CREATING SOME RECORDS

INSERT INTO DEPARTMENT VALUES('Research', 5, '123456789', '1988-05-22');
INSERT INTO DEPARTMENT VALUES('Administration', 10, '333445555', '1995-01-01');
INSERT INTO DEPARTMENT VALUES('Headquarters', 20, '888665555', '1998-07-06');
INSERT INTO DEPARTMENT VALUES('Sales', 30, '987654321', '1998-08-08');
INSERT INTO DEPARTMENT VALUES('Operations', 40, '453453453', '2000-04-01');
INSERT INTO PROJECT VALUES('ProductX', 1, 'Houston', 5);

INSERT INTO EMPLOYEE VALUES('John', 'B', 'Smith', '123456789', '1965-01-09', '731 Fondren, Houston, TX', 'M', 30000.00, '333445555', 5);
INSERT INTO EMPLOYEE VALUES('Franklin', 'T', 'Wong', '333445555', '1955-12-08', '638 Voss, Houston, TX', 'M', 40000.00, '888665555', 5);
INSERT INTO EMPLOYEE VALUES('Alicia', 'J', 'Zelaya', '999887777', '1968-07-19', '3321 Castle, Spring, TX', 'F', 25000.00, '987654321', 4);
INSERT INTO EMPLOYEE VALUES('Jennifer', 'S', 'Wallace', '987654321', '1941-06-20', '291 Berry, Bellaire, TX', 'F', 43000.00, '888665555', 4);
INSERT INTO EMPLOYEE VALUES('Ramesh', 'K', 'Narayan', '666884444', '1962-09-15', '975 Fire Oak, Humble, TX', 'M', 38000.00, '333445555', 5);
INSERT INTO EMPLOYEE VALUES('Joyce', 'A', 'English', '453453453', '1972-07-31', '5631 Rice, Houston, TX', 'F', 25000.00, '333445555', 5);
INSERT INTO EMPLOYEE VALUES('Ahmad', 'V', 'Jabbar', '987987987', '1969-03-29', '980 Dallas, Houston, TX', 'M', 25000.00, '333445555', 5);
INSERT INTO EMPLOYEE VALUES('James', 'E', 'Borg', '888665555', '1937-11-10', '450 Stone, Houston, TX', 'M', 55000.00, NULL, 1);
INSERT INTO EMPLOYEE VALUES('Jennifer', 'D', 'Doe', '987654321', '1971-06-20', '291 Berry, Bellaire, TX', 'F', 43000.00, '888665555', 4);
INSERT INTO EMPLOYEE VALUES('John', 'D', 'Doe', '123456789', '1965-01-09', '731 Fondren, Houston, TX', 'M', 30000.00, '333445555', 5);
INSERT INTO EMPLOYEE VALUES('Franklin', 'T', 'Wong', '333445555', '1955-12-08', '638 Voss, Houston, TX', 'M', 40000.00, '888665555', 5);
INSERT INTO EMPLOYEE VALUES('Alicia', 'J', 'Zelaya', '999887777', '1968-07-19', '3321 Castle, Spring, TX', 'F', 25000.00, '987654321', 4);
INSERT INTO EMPLOYEE VALUES('Jennifer', 'S', 'Wallace', '987654321', '1941-06-20', '291 Berry, Bellaire, TX', 'F', 43000.00, '888665555', 4);
INSERT INTO EMPLOYEE VALUES('Ramesh', 'K', 'Narayan', '666884444', '1962-09-15', '975 Fire Oak, Humble, TX', 'M', 38000.00, '333445555', 5);
INSERT INTO EMPLOYEE VALUES('Joyce', 'A', 'English', '453453453', '1972-07-31', '5631 Rice, Houston, TX', 'F', 25000.00, '333445555', 5);

INSERT INTO DEPARTMENT_LOCATIONS VALUES(5, 'Houston');
INSERT INTO DEPARTMENT_LOCATIONS VALUES(5, 'Stafford');
INSERT INTO DEPARTMENT_LOCATIONS VALUES(10, 'Bellaire');
INSERT INTO DEPARTMENT_LOCATIONS VALUES(20, 'Houston');
INSERT INTO DEPARTMENT_LOCATIONS VALUES(30, 'Sugar Land');

INSERT INTO PROJECT VALUES('ProductX', 1, 'Houston', 5);
INSERT INTO PROJECT VALUES('ProductY', 2, 'Stafford', 5);
INSERT INTO PROJECT VALUES('ProductZ', 3, 'Sugar Land', 4);
INSERT INTO PROJECT VALUES('Computerization', 10, 'Stafford', 5);
INSERT INTO PROJECT VALUES('Reorganization', 20, 'Houston', 5);

INSERT INTO WORKS_ON VALUES('123456789', 1, 32.5);
INSERT INTO WORKS_ON VALUES('123456789', 2, 7.5);
INSERT INTO WORKS_ON VALUES('333445555', 2, 10);
INSERT INTO WORKS_ON VALUES('333445555', 3, 10);
INSERT INTO WORKS_ON VALUES('333445555', 10, 10);
INSERT INTO WORKS_ON VALUES('999887777', 1, 10);
INSERT INTO WORKS_ON VALUES('999887777', 4, 10);
INSERT INTO WORKS_ON VALUES('999887777', 10, 10);
INSERT INTO WORKS_ON VALUES('666884444', 3, 10);
INSERT INTO WORKS_ON VALUES('666884444', 4, 10);
INSERT INTO WORKS_ON VALUES('666884444', 5, 10);

INSERT INTO DEPENDENT VALUES('123456789', 'Alice', 'F', '1986-03-23', 'Daughter');
INSERT INTO DEPENDENT VALUES('123456789', 'Theodore', 'M', '1988-10-25', 'Son');
INSERT INTO DEPENDENT VALUES('333445555', 'Joy', 'F', '1988-12-30', 'Daughter');
INSERT INTO DEPENDENT VALUES('333445555', 'Mary', 'F', '1977-05-09', 'Spouse');
INSERT INTO DEPENDENT VALUES('999887777', 'Alice', 'F', '1986-03-23', 'Daughter');

-- PROBLEM STATEMENT SOLUTIONS

-- 1)   Retrieve the birth date and address of the employee(s) whose name is ‘John B. Smith’.
SELECT Bdate,
    Address
FROM EMPLOYEE
WHERE Fname = 'John'
    AND Minit = 'B'
    AND Lname = 'Smith';
-- 2)	Retrieve the name and address of all employees who work for the ‘Research’ department.
SELECT Fname,
    Minit,
    Lname,
    address
FROM EMPLOYEE,
    DEPARTMENT
WHERE Dname = 'Research'
    AND Dnumber = Dno;
-- 3)	For every project located in ‘Stafford’, list the project number, the controlling department number, and the department manager’s last name, address, and birth date.
SELECT Lname,
    address,
    Bdate
FROM EMPLOYEE,
    PROJECT,
    DEPARTMENT
WHERE;
-- 4)	Select all combinations of EMPLOYEE Ssn and DEPARTMENT Dname in the database.
SELECT Ssn,
    Dname
FROM EMPLOYEE,
    DEPARTMENT;
-- 5)	Retrieve all the attribute values of any EMPLOYEE who works in DEPARTMENT number 5.
SELECT *
FROM EMPLOYEE
WHERE Dno = 5;
-- 6)	Retrieve all distinct salary values.
SELECT DISTINCT Salary
FROM EMPLOYEE;
-- 7)	Make a list of all project numbers for projects that involve an employee whose last name is ‘Smith’, either as a worker or as a manager of the department that controls the project.
SELECT Pno
FROM PROJECT,
    EMPLOYEE
WHERE Lname = 'Smith';
-- 8)	Retrieve all employees whose address is in Houston, Texas.
SELECT *
FROM EMPLOYEE
WHERE Address LIKE '%Houston, TX';
-- 9)	Find all employees who were born during the 1950s
SELECT *
FROM EMPLOYEE
WHERE Bdate BETWEEN '1950-01-01' AND '1959-12-31';
-- 10)	Show the resulting salaries if every employee working on the ‘ProductX’ project is given a 10 percent raise.
SELECT Salary * 1.1
FROM EMPLOYEE,
    WORKS_ON
WHERE Pno = 1;
-- 11)	Retrieve a list of employees and the projects they are working on, ordered by department and, within each department, ordered alphabetically by last name, then first name.
SELECT Fname,
    Lname,
    Pname
FROM EMPLOYEE,
    PROJECT,
    WORKS_ON
WHERE EMPLOYEE.Ssn = WORKS_ON.Essn
    AND PROJECT.Pno = WORKS_ON.Pno
ORDER BY Dno,
    Lname,
    Fname;