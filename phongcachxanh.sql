CREATE DATABASE PhongCachXanh
GO
USE PhongCachXanh

CREATE TABLE ProductType(
TypeId int PRIMARY KEY,
TypeName varchar
)

CREATE TABLE ProductBrand(
BrandId int PRIMARY KEY,
BrandName varchar,
Description varchar,
Highlight int FOREIGN KEY REFERENCES Product(ProductId)
)

CREATE TABLE Product(
ProductId int PRIMARY KEY,
ProductName varchar,
ProductType int FOREIGN KEY REFERENCES ProductType(TypeId),
ProductBrand int FOREIGN KEY REFERENCES ProductBrand(BrandId),
Description varchar,
Price money,
Warranty int,
rating real,
)

CREATE TABLE Customer(
CustomerId int PRIMARY KEY,
Name varchar,
Address varchar,
Tel int
)

CREATE TABLE Orders(
Id int PRIMARY KEY,
CustomerId int FOREIGN KEY REFERENCES Customer(CustomerId),
OrderDate date
)

CREATE TABLE OrderDetails(
OrderId int FOREIGN KEY REFERENCES Orders(Id),
ProductId int FOREIGN KEY REFERENCES Product(ProductId),
quantity int
)

CREATE TABLE Service(
Id int PRIMARY KEY,
Name varchar,
description varchar,
price money
)