CREATE DATABASE Phongcachxanh
GO
USE Phongcachxanh
GO

-- Table: User
CREATE TABLE [User] (
    Id INT PRIMARY KEY,
    email VARCHAR(255) NOT NULL,
    password VARCHAR(255) NOT NULL,
    fullname VARCHAR(255),
    address VARCHAR(255),
    level INT,
    points INT
);
GO 

-- Table: ProductCategory
CREATE TABLE ProductCategory (
    id INT PRIMARY KEY,
    name VARCHAR(255) NOT NULL
);
GO

-- Table: ProductBrand
CREATE TABLE ProductBrand (
    id INT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    description TEXT,
    highlightProduct INT 
);
GO


-- Table: Product
CREATE TABLE Product (
    id INT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    price MONEY,
    description TEXT,
    category INT,
    brand INT,
    warranty VARCHAR(255),
    color VARCHAR(50),
    size VARCHAR(50),
    unit VARCHAR(50),
    status VARCHAR(50),
    FOREIGN KEY (brand) REFERENCES ProductBrand(id),
    FOREIGN KEY (category) REFERENCES ProductCategory(id)
);
GO

-- Table: Comment
CREATE TABLE Comment (
    Id INT PRIMARY KEY,
    Title VARCHAR(255),
    Content TEXT,
    User_id INT,
    Product_id INT,
    Rating INT,
    FOREIGN KEY (User_id) REFERENCES [User](Id),
    FOREIGN KEY (Product_id) REFERENCES Product(id)
);
GO


--ALTER TABLE ProductBrand
--ADD FOREIGN KEY (highlightProduct) REFERENCES Product(id)


--ALTER TABLE Product
--ADD quantity int



-- Table: Cart
CREATE TABLE Cart (
    userId INT,
    productId INT,
    quantity INT,
    PRIMARY KEY (userId, productId),
    FOREIGN KEY (userId) REFERENCES [User](Id),
    FOREIGN KEY (productId) REFERENCES Product(id)
);
GO

-- Table: Service
CREATE TABLE Service (
    name VARCHAR(255),
    productCategoryId INT,
    description TEXT,
    price MONEY,
    FOREIGN KEY (productCategoryId) REFERENCES ProductCategory(id)
);
GO

-- Table: ArticleCategory
CREATE TABLE ArticleCategory (
    id INT PRIMARY KEY,
    name VARCHAR(255) NOT NULL
);
GO

-- Table: Article
CREATE TABLE Article (
    id INT PRIMARY KEY,
    categoryId INT,
    title VARCHAR(255) NOT NULL,
    content TEXT,
    publishedDate DATE,
    author VARCHAR(255),
    FOREIGN KEY (categoryId) REFERENCES ArticleCategory(id)
);
GO

-- Table: DistrictList
CREATE TABLE DistrictList (
    DistrictId INT PRIMARY KEY,
    DistrictName VARCHAR(255)
);
GO

-- Table: CityList
CREATE TABLE CityList (
    CityId INT PRIMARY KEY,
    CityName VARCHAR(255)
);
GO

-- Table: Orders
CREATE TABLE Orders (
    id INT PRIMARY KEY,
    userId INT,
    customerName VARCHAR(255),
    customerAddress VARCHAR(255),
    DistrictId INT,
    CityId INT,
    OrderDate DATETIME,
    status VARCHAR(50),
    totalAmount MONEY,
    FOREIGN KEY (userId) REFERENCES [User](Id),
    FOREIGN KEY (DistrictId) REFERENCES DistrictList(DistrictId),
    FOREIGN KEY (CityId) REFERENCES CityList(CityId)
);
GO

-- Table: OrderDetails
CREATE TABLE OrderDetails (
    orderId INT,
    productId INT,
    quantity INT,
    price MONEY,
    discount REAL,
    PRIMARY KEY (orderId, productId),
    FOREIGN KEY (orderId) REFERENCES Orders(id),
    FOREIGN KEY (productId) REFERENCES Product(id)
);
GO

