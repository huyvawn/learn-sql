CREATE DATABASE LAB06
GO
USE LAB06
GO
CREATE TABLE Category(
CategoryId varchar(20) PRIMARY KEY,
Name varchar(28)
)
CREATE TABLE Product(
ProductId varchar(20) PRIMARY KEY,
CategoryId varchar(20) CONSTRAINT fk_category FOREIGN KEY REFERENCES Category(CategoryId),
Name varchar (50),
ManufacturedDate date
)
CREATE TABLE Employee(
Id int PRIMARY KEY,
Name varchar(30)
)
CREATE TABLE ProductManagement(
ProductId varchar(20) CONSTRAINT fk_ProductId FOREIGN KEY REFERENCES Product(ProductId),
--ManufacturedDate date ,
--productName varchar(50) ,
--CategoryId int CONSTRAINT fk_catId FOREIGN KEY REFERENCES Category(CategoryId),
--Manager varchar(30),
ManagerId int CONSTRAINT fk_employeeid FOREIGN KEY REFERENCES Employee(Id)
)
--ALTER TABLE ProductManagement
--ADD Manager varchar(30)

--2.
GO
INSERT INTO Category VALUES ('Z37E','ZeroElo37')
INSERT INTO Category VALUES ('G38','Ginger 38')
INSERT INTO Product VALUES ('Z37 111111','Z37E','Laptop Z37E','2009-12-12')
INSERT INTO Product VALUES('Z37 111112','Z37E','Laptop Z37E','2009-12-13')
INSERT INTO Product VALUES ('G38 111','G38','Phone G38','2010-10-14')
INSERT INTO Employee VALUES (987668,'Nguyen Van An')
INSERT INTO Employee VALUES (859403,'Nguyen Tuan Anh')
INSERT INTO ProductManagement VALUES ('Z37 111111',987668)
INSERT INTO ProductManagement VALUES ('Z37 111112',859403)
INSERT INTO ProductManagement VALUES ('G38 111',987668)

--4.
GO
SELECT * FROM Category
SELECT * FROM Product
SELECT * FROM Employee
--5.
GO
SELECT * FROM Category ORDER BY Name ASC
SELECT * FROM Employee ORDER BY Name ASC
--Hien thi san pham voi ma sp Z37E
SELECT * FROM Product WHERE CategoryId = 'Z37E'
--Hien thi cac SP cua Nguyen Van AN
SELECT Product.ProductId, CategoryId,Product.Name, ManufacturedDate,ManagerId FROM Product INNER JOIN ProductManagement
ON Product.ProductId = ProductManagement.ProductId WHERE ManagerId = (SELECT Id FROM Employee WHERE Name='Nguyen Van An') ORDER BY ProductId DESC
--6.
--a. So SP cua tung loai
SELECT CategoryId, COUNT(*) FROM Product GROUP BY CategoryId
--b. So loai SP trung binh theo tung loai SP
--c. Hien thi thong tin SP va loai SP
SELECT * FROM Product a JOIN Category b ON a.CategoryId= b.CategoryId
--d. Hien thi thong tin nguoi chiu trach nhiem, loai san pham va san pham
SELECT Product.ProductId, ManagerId, Product.CategoryId, Product.Name[Product Name], ManufacturedDate, Employee.Name[Manager] FROM ProductManagement
INNER JOIN Product ON Product.ProductId = ProductManagement.ProductId
INNER JOIN Employee ON ManagerId=Employee.Id
--7.
--a.Thay doi ngay SX la truoc hoac bang hien tai

ALTER TABLE Product
ADD CONSTRAINT chk_date CHECK (ManufacturedDate <= GETDATE())

--b. Xac dinh pk, fk

GO
--Xac dinh khoa cua 1 bang

select C.TABLE_NAME,C.COLUMN_NAME, T.CONSTRAINT_TYPE FROM
INFORMATION_SCHEMA.TABLE_CONSTRAINTS T
JOIN INFORMATION_SCHEMA.CONSTRAINT_COLUMN_USAGE C
ON C.CONSTRAINT_NAME=T.CONSTRAINT_NAME
WHERE
C.TABLE_NAME='Product'
and (T.CONSTRAINT_TYPE='FOREIGN KEY'
or T.CONSTRAINT_TYPE='PRIMARY KEY')

--Xac dinh toan bo constraint cua cac bang

select * from INFORMATION_SCHEMA.TABLE_CONSTRAINTS

--c.Them truong phien ban cho SP

ALTER TABLE Product
ADD Version varchar(15)
