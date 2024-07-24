USE AdventureWorks2019
GO
SELECT * FROM HumanResources.Employee
SELECT * FROM HumanResources.Department WHERE DepartmentID > 15

SELECT DepartmentID, Name, GroupName FROM HumanResources.Department WHERE DepartmentID > 15

Go
DECLARE @deptID INT
SELECT @deptID =12
SELECT DepartmentID, Name, GroupName FROM HumanResources.Department
							WHERE DepartmentID >= @deptID
Go

USE NorthWind
GO
SELECT * FROM Categories
SELECT CategoryID, CategoryName, [Description] FROM Categories
SELECT EmployeeID, LastName, FirstName FROM Employees
SELECT TOP 1 * FROM Employees

SELECT @@LANGUAGE
SELECT @@VERSION

Go
USE AdventureWorks2019
SELECT SUM(StandardCost) FROM Production.ProductCostHistory
SELECT AVG(StandardCost) FROM Production.ProductCostHistory
SELECT MAX(StandardCost) FROM Production.ProductCostHistory
SELECT COUNT(*) AS TotalRecords FROM Production.ProductPhoto
SELECT GETDATE()
SELECT DATEPART (hh,GETDATE())
SELECT CONVERT (VarChar(50),GETDATE(), 103)

SELECT DB_ID('AdventureWorks2019')

CREATE DATABASE EXAMPLE3

USE EXAMPLE3

CREATE TABLE Contacts(
MailID VARCHAR(20),
Name NTEXT,
TelephoneNumber INT
)

ALTER TABLE Contacts ADD Address NVARCHAR(50)

INSERT INTO Contacts values ('xeko@gmail.com',N'Nguyễn Văn A',9898998,N'Hà Nội')
INSERT INTO Contacts values ('lynka@gmail.com',N'Nguyễn Thị B',432934,N'Hà Nội')
INSERT INTO Contacts values ('tranvanC@gmail.com',N'Trần Văn C',905243524,N'Hà Nội')
INSERT INTO Contacts values ('vand@gmail.com',N'Trịnh Văn D',4563576,N'Hà Nội')
SELECT * FROM Contacts

DELETE FROM Contacts WHERE MailID='tranvanC@gmail.com'
UPDATE Contacts SET Name=N'Nguyen Viet Anh' WHERE MailID='vand@gmail.com'
CREATE LOGIN example3 WITH PASSWORD='123456'
CREATE USER example3 FROM LOGIN example3
REVOKE ALL ON Contacts FROM example3
GRANT SELECT ON Contacts TO example3
Go



