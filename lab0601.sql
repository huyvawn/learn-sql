CREATE DATABASE LAB0601
GO
USE LAB0601
CREATE TABLE Product (
ProductId varchar(12) PRIMARY KEY,
ProductName varchar(20),
Description varchar(50),
Unit varchar(20),
Price money,

)
CREATE TABLE Customer(
CustomerId int PRIMARY KEY,
CustomerName varchar(20),
Address varchar(30),
Tel int
)
CREATE TABLE Orders(
OrderId int Primary key,
CustomerId int FOREIGN KEY REFERENCES Customer(CustomerId),
OrderDate date
)
CREATE TABLE OrderDetails(
OrderId int FOREIGN KEY REFERENCES Orders(OrderId),
ProductId varchar(12) FOREIGN KEY REFERENCES Product(ProductId),
qty int
)

INSERT INTO Product VALUES ('N67','NokiaGen67','Nokia phone lastest generation','Phone',400)
INSERT INTO Product VALUES ('RTX46','RTX 4060 OC 12G','NVIDIA Graphics card','Part',700)
INSERT INTO Product VALUES ('RTX47','RTX 4070 Ti','NVIDUA GPU','Part',1000)
INSERT INTO Customer VALUES (1,'Nguyen Van An','USA',14450)
INSERT INTO Customer VALUES (2,'Nguyen Van B','Vietnam', 34125)
INSERT INTO Orders values(123,1,'2024-7-27')
INSERT INTO Orders VALUES(101,2,'2024-7-27')
INSERT INTO OrderDetails VALUES (101,'N67',2)
INSERT INTO OrderDetails values (123,'N67',3)
INSERT INTO OrderDetails values (123,'RTX46',2)

--4.
SELECT * FROM Customer WHERE EXISTS (SELECT * FROM Orders WHERE CustomerId= Customer.CustomerId)
SELECT * FROM Product
SELECT * FROM Orders INNER JOIN OrderDetails ON Orders.OrderId = OrderDetails.OrderId

--5.
SELECT * FROM Customer ORDER BY CustomerName ASC
SELECT * FROM Product ORDER BY Price DESC
SELECT * FROM Product WHERE ProductId  in (SELECT ProductId FROM OrderDetails WHERE OrderId in
(SELECT OrderId FROM Orders WHERE CustomerId = (SELECT CustomerId from Customer WHERE CustomerName='Nguyen Van An')))

--6.
SELECT COUNT(*) AS NumberOfCustomers FROM (SELECT DISTINCT CustomerId [A] FROM Orders) tmp
SELECT COUNT(*) FROM Product
--Tong don hang
SELECT * FROM OrderDetails
SELECT OrderId,CustomerName ,[Total Purchase] FROM(SELECT c.OrderId, [Total Purchase], CustomerId FROM
(SELECT OrderId, SUM(qty*Price)[Total Purchase] FROM(SELECT qty,Price,a.OrderId,CustomerId FROM
(SELECT * FROM OrderDetails ) a INNER JOIN Product ON a.ProductId = Product.ProductId INNER JOIN Orders on a.OrderId=Orders.OrderId) b GROUP BY OrderId) c INNER JOIN Orders on c.OrderId = Orders.OrderId)
d INNER JOIN Customer on d.CustomerId= Customer.CustomerId