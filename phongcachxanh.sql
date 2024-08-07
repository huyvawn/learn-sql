IF EXISTS (SELECT * FROM sys.databases WHERE name = 'Phongcachxanh')
BEGIN 
USE [master]
    DROP DATABASE Phongcachxanh;
END
GO

-- Create a new database
CREATE DATABASE Phongcachxanh
COLLATE Latin1_General_100_CI_AI_SC_UTF8;
GO

-- Use the newly created database
USE Phongcachxanh;
GO


-- Table: User
CREATE TABLE [User] (
    Id INT PRIMARY KEY,
    email NVARCHAR(255) NOT NULL,
    [password] NVARCHAR(255) NOT NULL,
    fullname NVARCHAR(255),
    address NVARCHAR(255),
    level INT,
    points INT
);
GO 

-- Table: ProductCategory
CREATE TABLE ProductCategory (
    id INT PRIMARY KEY,
    [name] NVARCHAR(255) NOT NULL
);
GO

-- Table: ProductBrand
CREATE TABLE ProductBrand (
    id INT PRIMARY KEY,
    [name] NVARCHAR(255) NOT NULL,
    description NVARCHAR(255),
    highlightProduct INT 
);
GO


-- Table: Product
CREATE TABLE [Product] (
    id INT PRIMARY KEY,
    [name] NVARCHAR(256) NOT NULL,
    price MONEY,
    [description] NVARCHAR(255),
    category INT,
    brand INT,
    warranty NVARCHAR(255),
    color NVARCHAR(50),
    size NVARCHAR(50),
    unit NVARCHAR(50),
    [status] NVARCHAR(50),
    FOREIGN KEY (brand) REFERENCES ProductBrand(id),
    FOREIGN KEY (category) REFERENCES ProductCategory(id)
);
GO

-- Table: Comment
CREATE TABLE Comment (
    Id INT PRIMARY KEY,
    Title NVARCHAR(255),
    Content NVARCHAR(255),
    [User_id] INT,
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
CREATE TABLE [Service] (
    [name] NVARCHAR(255),
    productCategoryId INT,
    description NVARCHAR(255),
    price MONEY,
    FOREIGN KEY (productCategoryId) REFERENCES ProductCategory(id)
);
GO

-- Table: ArticleCategory
CREATE TABLE ArticleCategory (
    id INT PRIMARY KEY,
    [name] NVARCHAR(255) NOT NULL
);
GO

-- Table: Article
CREATE TABLE Article (
    id INT PRIMARY KEY,
    categoryId INT,
    title NVARCHAR(255) NOT NULL,
    content NVARCHAR(255),
    publishedDate DATE,
    author NVARCHAR(255),
    FOREIGN KEY (categoryId) REFERENCES ArticleCategory(id)
);
GO

-- Table: DistrictList
CREATE TABLE DistrictList (
    DistrictId INT PRIMARY KEY,
    DistrictName NVARCHAR(255)
);
GO

-- Table: CityList
CREATE TABLE CityList (
    CityId INT PRIMARY KEY,
    CityName NVARCHAR(255)
);
GO

-- Table: Orders
CREATE TABLE Orders (
    id INT PRIMARY KEY,
    userId INT,
    customerName NVARCHAR(255),
    customerAddress NVARCHAR(255),
    DistrictId INT,
    CityId INT,
    OrderDate DATETIME,
    status NVARCHAR(50),
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



INSERT INTO [ProductBrand] (id, name, description) VALUES
(1, 'Ninjutso', 'High-performance gaming mice'),
(2, 'CHERRY', 'Premium keyboard and mouse solutions'),
(3, 'Razer', 'Innovative gaming devices and accessories'),
(4, 'Logitech', 'Computer peripherals and software'),
(5, 'Lamzu', 'Cutting-edge gaming hardware'),
(6, 'Endgame Gear', 'Professional gaming gear'),
(7, 'BenQ Zowie', 'High-end eSports peripherals'),
(8, 'Fnatic', 'eSports equipment and accessories'),
(9, 'Corsair', 'High-performance gaming and streaming equipment'),
(10, 'HyperX', 'Gaming gear and accessories'),
(11, 'Keychron', 'Mechanical keyboards and accessories'),
(12, 'Ducky', 'Mechanical keyboards and accessories'),
(13, 'Akko', 'Stylish and high-quality gaming peripherals'),
(14, 'iKBC', 'Durable mechanical keyboards');

INSERT INTO ProductCategory (id, name) VALUES
(1, 'Chuột không dây'),
(2, 'Bàn phím cơ'),
(3, 'Tai nghe gaming'),
(4, 'Màn hình máy tính'),
(5, 'Ghế gaming'),
(6, 'Phụ kiện máy tính'),
(7, 'Bàn gaming'),
(8, 'Tay cầm chơi game'),
(9, 'Webcam'),
(10, 'Microphone');

INSERT INTO [Product] (id, name, price, description, category, brand, warranty, color, size, unit, status) VALUES
(1, 'Chuột không dây siêu nhẹ Ninjutso Sora', 2499000, 'Trọng lượng siêu nhẹ và không có lỗ, kích thước 120.8mm x 59mm x 37.3mm', 1, 1, '12 tháng', 'Đen', 'Medium', 'Cái', 'Còn hàng'),
(2, 'Chuột không dây siêu nhẹ CHERRY Xtrfy M8 Wireless', 2790000, 'Cảm biến Pixart PAW3395, 26000 DPI, 650 IPS, 50G', 1, 2, '12 tháng', 'Đen', 'Medium', 'Cái', 'Còn hàng'),
(3, 'Chuột không dây Razer DeathAdder V3 Pro + HyperPolling Wireless Dongle', 3875000, 'Hiệu năng vượt trội cùng thiết kế độc nhất', 1, 3, '12 tháng', 'Đen', 'Medium', 'Cái', 'Còn hàng'),
(4, 'Chuột không dây Logitech MX Anywhere 3S', 2250000, 'Hiệu năng mạnh mẽ, thiết kế tiện lợi', 1, 4, '12 tháng', 'Xám', 'Small', 'Cái', 'Còn hàng'),
(5, 'Chuột không dây siêu nhẹ Lamzu Maya Doodle (Limited)', 2950000, 'Hỗ trợ 8KHz, thiết kế giới hạn', 1, 5, '12 tháng', 'Vàng', 'Medium', 'Cái', 'Còn hàng'),
(6, 'Chuột không dây Razer DeathAdder V3 Pro Wireless', 3590000, 'Hiệu năng vượt trội, thiết kế công thái học', 1, 3, '12 tháng', 'Đen', 'Medium', 'Cái', 'Còn hàng'),
(7, 'Chuột không dây siêu nhẹ Lamzu Maya - Hỗ trợ 4KHz', 2790000, 'Hiệu năng cao, trọng lượng nhẹ', 1, 5, '12 tháng', 'Xanh', 'Medium', 'Cái', 'Còn hàng'),
(8, 'Chuột không dây siêu nhẹ Lamzu Atlantis Mini Champion Edition', 3150000, 'Hỗ trợ 8KHz, thiết kế giới hạn', 1, 5, '12 tháng', 'Đỏ', 'Small', 'Cái', 'Còn hàng'),
(9, 'Chuột không dây Razer Viper V3 Hyperspeed', 2499000, 'Thiết kế siêu nhẹ, hiệu năng cao', 1, 3, '12 tháng', 'Đen', 'Medium', 'Cái', 'Còn hàng'),
(10, 'Chuột không dây Endgame Gear XM2we Wireless', 2499000, 'Hiệu năng mạnh mẽ, thiết kế tiện lợi', 1, 6, '12 tháng', 'Trắng', 'Medium', 'Cái', 'Còn hàng'),
(11, 'Chuột không dây BenQ Zowie EC1-CW', 2250000, 'Thiết kế công thái học, hiệu năng cao', 1, 7, '12 tháng', 'Đen', 'Medium', 'Cái', 'Còn hàng'),
(12, 'Chuột không dây siêu nhẹ Fnatic x Lamzu Thorn 4K Special Edition', 2750000, 'Hỗ trợ 4KHz, thiết kế đặc biệt', 1, 8, '12 tháng', 'Cam', 'Medium', 'Cái', 'Còn hàng'),
(13, 'Bàn phím cơ Logitech G Pro X', 3499000, 'Bàn phím cơ chuyên dụng cho game thủ, switch tháo rời được', 2, 4, '12 tháng', 'Đen', 'Fullsize', 'Cái', 'Còn hàng'),
(14, 'Bàn phím cơ Razer Huntsman Mini', 2999000, 'Thiết kế nhỏ gọn, switch quang học', 2, 3, '12 tháng', 'Đen', 'Mini', 'Cái', 'Còn hàng'),
(15, 'Bàn phím cơ Corsair K70 RGB MK.2', 3999000, 'Bàn phím cơ cao cấp, LED RGB', 2, 9, '12 tháng', 'Đen', 'Fullsize', 'Cái', 'Còn hàng'),
(16, 'Bàn phím cơ HyperX Alloy Origins', 3299000, 'Bàn phím cơ với switch HyperX, LED RGB', 2, 10, '12 tháng', 'Đen', 'Fullsize', 'Cái', 'Còn hàng'),
(17, 'Bàn phím cơ Keychron K6', 2999000, 'Bàn phím cơ không dây, compact 65%', 2, 11, '12 tháng', 'Đen', 'Compact', 'Cái', 'Còn hàng'),
(18, 'Bàn phím cơ Ducky One 2 Mini', 2699000, 'Bàn phím cơ 60%, LED RGB', 2, 12, '12 tháng', 'Trắng', 'Mini', 'Cái', 'Còn hàng'),
(19, 'Bàn phím cơ Akko 3068B Plus', 2599000, 'Bàn phím cơ không dây, layout 65%', 2, 13, '12 tháng', 'Hồng', 'Compact', 'Cái', 'Còn hàng'),
(20, 'Bàn phím cơ iKBC CD108', 1999000, 'Bàn phím cơ fullsize, switch Cherry', 2, 14, '12 tháng', 'Đen', 'Fullsize', 'Cái', 'Còn hàng');

INSERT INTO [User] (Id, email, [password], fullname, address, level, points) VALUES
(1, 'anh@example.com', 'matkhau123', 'Anh Nguyen', '123 Đường Xoài', 1, 100),
(2, 'binh@example.com', 'matkhau456', 'Binh Tran', '456 Đường Nhãn', 2, 200),
(3, 'cuc@example.com', 'matkhau789', 'Cuc Le', '789 Đường Xoan', 3, 300),
(4, 'dung@example.com', 'matkhau000', 'Dung Pham', '321 Đường Mận', 1, 150),
(5, 'em@example.com', 'matkhauabc', 'Em Do', '654 Đường Gòn', 2, 250),
(6, 'fong@example.com', 'matkhaudef', 'Fong Huynh', '987 Đường Hồng', 3, 350),
(7, 'giang@example.com', 'matkhaunoi', 'Giang Vo', '135 Đường Dừa', 1, 120),
(8, 'hieu@example.com', 'matkhaujkl', 'Hieu Nguyen', '246 Đường Thông', 2, 220),
(9, 'hoang@example.com', 'matkhaumno', 'Hoang Lai', '369 Đường Dâu', 3, 320),
(10, 'hoa@example.com', 'matkhaupqr', 'Hoa Ngo', '579 Đường Tùng', 1, 180);

INSERT INTO Comment (Id, Title, Content, [User_id], Product_id, Rating) VALUES
(1, 'Sản phẩm tuyệt vời', 'Tôi thật sự thích sử dụng sản phẩm này. Rất đáng khuyến khích!', 1, 1, 5),
(2, 'Không tệ', 'Sản phẩm khá ổn, nhưng có thể cải thiện thêm.', 2, 2, 3),
(3, 'Chất lượng xuất sắc', 'Chất lượng tuyệt vời và giá cả hợp lý. Sẽ mua lại.', 3, 3, 4),
(4, 'Trải nghiệm tồi tệ', 'Tôi đã có trải nghiệm tồi tệ với sản phẩm này. Rất thất vọng.', 4, 4, 1),
(5, 'Giá trị tốt', 'Sản phẩm tốt với mức giá này. Tôi hài lòng với giao dịch.', 5, 5, 4),
(6, 'Sản phẩm bình thường', 'Sản phẩm khá ổn, nhưng không như mô tả.', 6, 6, 3),
(7, 'Tuyệt vời!', 'Thực sự tuyệt vời! Vượt xa mong đợi của tôi.', 7, 7, 5),
(8, 'Không đáng', 'Sản phẩm không đạt yêu cầu của tôi. Tôi không khuyến khích mua.', 8, 8, 2),
(9, 'Rất hài lòng', 'Tôi rất hài lòng với sản phẩm. Chất lượng tốt và giao hàng nhanh.', 9, 9, 4),
(10, 'Sẽ mua lại', 'Tôi chắc chắn sẽ mua sản phẩm này lần nữa. Rất hài lòng.', 10, 10, 5);

INSERT INTO Cart (userId, productId, quantity) VALUES
(1, 1, 2),
(2, 2, 1),
(3, 3, 5),
(4, 4, 3),
(5, 5, 4),
(6, 6, 2),
(7, 7, 1),
(8, 8, 6),
(9, 9, 3),
(10, 10, 2);

INSERT INTO [Service] ([name], productCategoryId, description, price) VALUES
('Dịch vụ sửa chữa máy tính', 1, 'Sửa chữa và bảo trì máy tính cá nhân.', 150000),
('Dịch vụ bảo trì điện lạnh', 2, 'Bảo trì và sửa chữa các thiết bị điện lạnh.', 200000),
('Dịch vụ vệ sinh công nghiệp', 3, 'Vệ sinh và làm sạch các khu vực công nghiệp.', 300000),
('Dịch vụ lắp đặt mạng', 4, 'Lắp đặt và cấu hình hệ thống mạng.', 100000),
('Dịch vụ bảo trì hệ thống phần mềm', 5, 'Bảo trì và cập nhật hệ thống phần mềm.', 250000),
('Dịch vụ thiết kế website', 6, 'Thiết kế và phát triển các trang web theo yêu cầu.', 500000),
('Dịch vụ tư vấn kỹ thuật', 7, 'Tư vấn và hỗ trợ kỹ thuật cho các vấn đề công nghệ.', 180000),
('Dịch vụ kiểm tra hệ thống', 8, 'Kiểm tra và đánh giá hiệu suất hệ thống.', 220000),
('Dịch vụ hỗ trợ người dùng', 9, 'Cung cấp hỗ trợ kỹ thuật và chăm sóc khách hàng.', 130000),
('Dịch vụ cài đặt phần mềm', 10, 'Cài đặt và cấu hình các ứng dụng phần mềm.', 120000);

INSERT INTO DistrictList (DistrictId, DistrictName) VALUES
(1, 'Quận 1'),
(2, 'Quận 2'),
(3, 'Quận 3'),
(4, 'Quận 4'),
(5, 'Quận 5'),
(6, 'Quận 6'),
(7, 'Quận 7'),
(8, 'Quận 8'),
(9, 'Quận 9'),
(10, 'Quận 10');

INSERT INTO CityList (CityId, CityName) VALUES
(1, 'Hà Nội'),
(2, 'Hồ Chí Minh'),
(3, 'Đà Nẵng'),
(4, 'Cần Thơ'),
(5, 'Nha Trang'),
(6, 'Hải Phòng'),
(7, 'Huế'),
(8, 'Bến Tre'),
(9, 'Vũng Tàu'),
(10, 'Biên Hòa');

INSERT INTO Orders (id, userId, customerName, customerAddress, DistrictId, CityId, OrderDate, status, totalAmount) VALUES
(1, 1, 'Nguyễn Văn A', '123 Đường Xoài, Quận 1', 1, 1, '2024-08-01 10:00:00', 'Đang xử lý', 500000),
(2, 2, 'Trần Thị B', '456 Đường Nhãn, Quận 2', 2, 2, '2024-08-02 11:00:00', 'Đã hoàn tất', 750000),
(3, 3, 'Lê Văn C', '789 Đường Xoan, Quận 3', 3, 3, '2024-08-03 12:00:00', 'Hủy bỏ', 300000),
(4, 4, 'Phạm Thị D', '321 Đường Mận, Quận 4', 4, 4, '2024-08-04 13:00:00', 'Đang xử lý', 600000),
(5, 5, 'Hoàng Văn E', '654 Đường Gòn, Quận 5', 5, 5, '2024-08-05 14:00:00', 'Đã hoàn tất', 900000),
(6, 6, 'Vũ Thị F', '987 Đường Hồng, Quận 6', 6, 6, '2024-08-06 15:00:00', 'Đang xử lý', 400000),
(7, 7, 'Nguyễn Thị G', '135 Đường Dừa, Quận 7', 7, 7, '2024-08-07 16:00:00', 'Đã hoàn tất', 650000),
(8, 8, 'Lê Văn H', '246 Đường Thông, Quận 8', 8, 8, '2024-08-08 17:00:00', 'Hủy bỏ', 200000),
(9, 9, 'Trần Văn I', '369 Đường Dâu, Quận 9', 9, 9, '2024-08-09 18:00:00', 'Đang xử lý', 550000),
(10, 10, 'Phạm Thị J', '579 Đường Tùng, Quận 10', 10, 10, '2024-08-10 19:00:00', 'Đã hoàn tất', 800000);

INSERT INTO OrderDetails (orderId, productId, quantity, price, discount) VALUES
(1, 1, 2, 250000, 0.05),
(1, 2, 1, 150000, 0.10),
(2, 3, 3, 300000, 0.00),
(2, 4, 1, 450000, 0.20),
(3, 5, 2, 600000, 0.15),
(4, 6, 1, 400000, 0.05),
(4, 7, 4, 200000, 0.10),
(5, 8, 2, 700000, 0.00),
(6, 9, 1, 150000, 0.20),
(7, 10, 5, 400000, 0.25);





SELECT * FROM ProductBrand

SELECT * FROM [Product]

SELECT * FROM ProductCategory

SELECT * FROM [User]

SELECT * FROM [Comment]

SELECT * FROM Cart

SELECT * FROM [Service]

SELECT * FROM DistrictList

SELECT * FROM CityList

SELECT * FROM Orders

SELECT * FROM OrderDetails


--Truy vấn danh sách sản phẩm cùng với tên nhãn hiệu và danh mục sản phẩm:
SELECT 
    p.id AS ProductID, 
    p.name AS ProductName, 
    pb.name AS BrandName, 
    pc.name AS CategoryName, 
    p.price, 
    p.description
FROM 
    [Product] p
JOIN 
    ProductBrand pb ON p.brand = pb.id
JOIN 
    ProductCategory pc ON p.category = pc.id;

--Truy vấn đơn hàng cùng với thông tin chi tiết của người dùng và địa chỉ:
SELECT 
    o.id AS OrderID, 
    u.fullname AS CustomerName, 
    u.email, 
    o.customerAddress, 
    dl.DistrictName, 
    cl.CityName, 
    o.OrderDate, 
    o.status, 
    o.totalAmount
FROM 
    Orders o
JOIN 
    [User] u ON o.userId = u.Id
JOIN 
    DistrictList dl ON o.DistrictId = dl.DistrictId
JOIN 
    CityList cl ON o.CityId = cl.CityId;

--Truy vấn các bình luận về sản phẩm kèm theo thông tin người dùng và tên sản phẩm:
SELECT 
    c.Id AS CommentID, 
    c.Title, 
    c.Content, 
    u.fullname AS UserName, 
    p.name AS ProductName, 
    c.Rating
FROM 
    Comment c
JOIN 
    [User] u ON c.User_id = u.Id
JOIN 
    [Product] p ON c.Product_id = p.id;

--Truy vấn sản phẩm được đánh giá cao nhất cùng với số lượng đánh giá:
SELECT 
    p.id AS ProductID, 
    p.name AS ProductName, 
    AVG(c.Rating) AS AverageRating, 
    COUNT(c.Id) AS NumberOfRatings
FROM 
    [Product] p
JOIN 
    Comment c ON p.id = c.Product_id
GROUP BY 
    p.id, p.name
ORDER BY 
    AverageRating DESC, NumberOfRatings DESC;

--Truy vấn tổng số lượng sản phẩm trong giỏ hàng của từng người dùng:
SELECT 
    u.fullname AS UserName, 
    SUM(c.quantity) AS TotalQuantity
FROM 
    Cart c
JOIN 
    [User] u ON c.userId = u.Id
GROUP BY 
    u.fullname
ORDER BY 
    TotalQuantity DESC;

--Truy vấn tổng số tiền của tất cả các đơn hàng của từng người dùng:
SELECT 
    u.fullname AS UserName, 
    SUM(o.totalAmount) AS TotalAmountSpent
FROM 
    Orders o
JOIN 
    [User] u ON o.userId = u.Id
GROUP BY 
    u.fullname
ORDER BY 
    TotalAmountSpent DESC;

--Truy vấn sản phẩm được mua nhiều nhất:
SELECT 
    p.id AS ProductID, 
    p.name AS ProductName, 
    SUM(od.quantity) AS TotalQuantitySold
FROM 
    OrderDetails od
JOIN 
    [Product] p ON od.productId = p.id
GROUP BY 
    p.id, p.name
ORDER BY 
    TotalQuantitySold DESC;

--Truy vấn người dùng có nhiều điểm thưởng nhất:
SELECT 
    u.fullname AS UserName, 
    u.points
FROM 
    [User] u
ORDER BY 
    u.points DESC
LIMIT 1;