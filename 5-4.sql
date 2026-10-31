USE test_db;

DROP TABLE IF EXISTS Order_items;
DROP TABLE IF EXISTS Orders;
DROP TABLE IF EXISTS Customers;

-- 1. Tạo bảng Customers
CREATE TABLE Customers (
    customer_id VARCHAR(10) PRIMARY KEY,
    customer_name VARCHAR(100)
);

-- 2. Tạo bảng Orders
CREATE TABLE Orders (
    order_id VARCHAR(10) PRIMARY KEY,
    order_date DATE,
    customer_id VARCHAR(10),
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

-- 3. Tạo bảng Order_items
CREATE TABLE Order_items (
    order_id VARCHAR(10),
    product_name VARCHAR(100),
    quantity INT,
    price DECIMAL(12, 2),
    FOREIGN KEY (order_id) REFERENCES Orders(order_id)
);

-- Thêm dữ liệu mẫu
INSERT INTO Customers VALUES 
('C01', 'Nguyễn Văn An'),
('C02', 'Trần Thị Bình'),
('C03', 'Lê Hoàng Cường');

INSERT INTO Orders VALUES 
('ORD01', '2026-03-01', 'C01'),
('ORD02', '2026-03-05', 'C02'),
('ORD03', '2026-03-10', 'C01');

INSERT INTO Order_items VALUES 
('ORD01', 'Laptop Dell', 1, 15000000),
('ORD01', 'Chuột không dây', 2, 250000),
('ORD02', 'Bàn phím cơ', 1, 1200000),
('ORD02', 'Tai nghe Gaming', 1, 800000),
('ORD03', 'Điện thoại iPhone 15', 1, 22000000);

SELECT 
    o.order_id,
    o.order_date,
    c.customer_name
FROM Orders o
INNER JOIN Customers c ON o.customer_id = c.customer_id;

SELECT 
    o.order_id,
    c.customer_name,
    oi.product_name,
    oi.quantity,
    oi.price
FROM Orders o
INNER JOIN Customers c ON o.customer_id = c.customer_id
INNER JOIN Order_items oi ON o.order_id = oi.order_id
ORDER BY o.order_id;

SELECT 
    o.order_id,
    o.order_date,
    c.customer_name,
    SUM(oi.quantity * oi.price) AS total_amount
FROM Orders o
INNER JOIN Customers c ON o.customer_id = c.customer_id
INNER JOIN Order_items oi ON o.order_id = oi.order_id
GROUP BY 
    o.order_id, 
    o.order_date, 
    c.customer_name;

SELECT 
    o.order_id,
    o.order_date,
    c.customer_name,
    SUM(oi.quantity * oi.price) AS total_amount
FROM Orders o
INNER JOIN Customers c ON o.customer_id = c.customer_id
INNER JOIN Order_items oi ON o.order_id = oi.order_id
GROUP BY 
    o.order_id, 
    o.order_date, 
    c.customer_name
HAVING SUM(oi.quantity * oi.price) > 10000000;

