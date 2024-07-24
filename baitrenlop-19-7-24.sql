USE BookLibrary
GO
CREATE TABLE Category(
id int PRIMARY KEY,
name varchar(20)
)
CREATE TABLE Product(
id int PRIMARY KEY IDENTITY,
cat_id int CONSTRAINT FK_category FOREIGN KEY REFERENCES Category(id),
name varchar (25),
price money,
unit varchar(20),
qty int
)
GO
INSERT INTO Category values (1,'Phones')
INSERT INTO Product (cat_id,name,price,unit,qty) values (1,'Iphone 15', 1000,'phone',100)
INSERT INTO Product (cat_id,name,price,unit,qty) values (1,'Galaxy Ultra 20', 1000,'phone',150)
SELECT * FROM Category
SELECT * FROM Product
UPDATE Product SET name='Iphone 16' WHERE name='Iphone 15'
GO
SELECT * FROM Product WHERE name='Iphone 16'
SELECT * FROM Product WHERE price >=500 AND price <=1500
