CREATE DATABASE EmployeeDB
GO 
USE EmployeeDB
GO
CREATE TABLE Department(
DepartId INT PRIMARY KEY,
DepartName varchar(50) NOT NULL,
Description varchar(100) NOT NULL
)
GO
CREATE TABLE Employee(
EmpCode char(6) PRIMARY KEY,
FirstName varchar(30) NOT NULL,
LastName varchar(30) NOT NULL,
Birthday smalldatetime NOT NULL,
Gender BIT DEFAULT 1,
Address varchar(100),
DepartID INT CONSTRAINT fk_department FOREIGN KEY REFERENCES Department(DepartId),
Salary MONEY
)
GO
INSERT INTO Department VALUES (1,'Technology Department','The department focusing on improving technology related matters')
INSERT INTO Department VALUES (2,'Research Department','This department consists of teams developing researches')
INSERT INTO Department VALUES (3,'Human Resource Department','This department manage and oversee all employees in other departments')
INSERT INTO Employee VALUES ('1A','John','Mob','1990-04-09','0','USA',1,500)
INSERT INTO Employee VALUES ('2A','Jane','Smith','1998-10-01','1','Texas',2,800)
INSERT INTO Employee VALUES ('3A','Jake','Paul','1998-05-27','0','New York',3,1000)
GO
--Increase salary by 10%

UPDATE Employee
SET Salary=Salary*1.1;

--ADD CONSTRAINT check Salary
GO

ALTER TABLE Employee
ADD CONSTRAINT chk_salary CHECK (Salary > 0);

GO
SELECT* FROM Employee
SELECT * FROM Department