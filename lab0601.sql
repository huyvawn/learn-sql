CREATE DATABASE LAB0601
GO
USE LAB0601
CREATE TABLE Product (
ProductId int PRIMARY KEY,
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
CREATE TABLE Order(

)