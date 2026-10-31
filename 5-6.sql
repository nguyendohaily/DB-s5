USE test_db;

DROP TABLE IF EXISTS Order_items;
DROP TABLE IF EXISTS Orders;
DROP TABLE IF EXISTS Customers;

CREATE TABLE Customers (
    customer_id VARCHAR(10) PRIMARY KEY,
    customer_name VARCHAR(100)
);

CREATE TABLE Orders (
    order_id VARCHAR(10) PRIMARY KEY,
    order_date DATE,
    customer_id VARCHAR(10),
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

CREATE TABLE Order_items (
    order_id VARCHAR(10),
    product_name VARCHAR(100),
    quantity INT,
    price DECIMAL(12, 2),
    FOREIGN KEY (order_id) REFERENCES Orders(order_id)
);

-- Thêm dữ liệu kiểm tra
INSERT INTO Customers VALUES 
('C01', 'Nguyễn Văn An'),
('C02', 'Trần Thị Bình'),
('C03', 'Lê Hoàng Cường'),
('C04', 'Phạm Minh Đức');

INSERT INTO Orders VALUES 
('ORD01', '2026-03-01', 'C01'),
('ORD02', '2026-03-05', 'C01'),
('ORD03', '2026-03-10', 'C02'),
('ORD04', '2026-03-12', 'C03');

INSERT INTO Order_items VALUES 
('ORD01', 'Laptop Dell', 1, 15000000),
('ORD01', 'Bàn phím cơ', 1, 1500000),
('ORD02', 'Màn hình 27 inch', 1, 7000000), -- C01: Tổng 23.500.000
('ORD03', 'iPhone 15 Pro', 1, 28000000),  -- C02: Tổng 28.000.000 (Cao nhất)
('ORD04', 'Tai nghe Gaming', 2, 2500000);  -- C03: Tổng 5.000.000

SELECT 
    o.order_id,
    c.customer_name,
    SUM(oi.quantity * oi.price) AS order_total
FROM Orders o
INNER JOIN Customers c ON o.customer_id = c.customer_id
INNER JOIN Order_items oi ON o.order_id = oi.order_id
GROUP BY 
    o.order_id, 
    c.customer_name;

SELECT 
    c.customer_id,
    c.customer_name,
    SUM(oi.quantity * oi.price) AS total_spent
FROM Customers c
INNER JOIN Orders o ON c.customer_id = o.customer_id
INNER JOIN Order_items oi ON o.order_id = oi.order_id
GROUP BY 
    c.customer_id, 
    c.customer_name;

SELECT 
    c.customer_id,
    c.customer_name,
    SUM(oi.quantity * oi.price) AS total_spent
FROM Customers c
INNER JOIN Orders o ON c.customer_id = o.customer_id
INNER JOIN Order_items oi ON o.order_id = oi.order_id
GROUP BY 
    c.customer_id, 
    c.customer_name
HAVING SUM(oi.quantity * oi.price) > 20000000;

SELECT 
    c.customer_id,
    c.customer_name,
    SUM(oi.quantity * oi.price) AS total_spent
FROM Customers c
INNER JOIN Orders o ON c.customer_id = o.customer_id
INNER JOIN Order_items oi ON o.order_id = oi.order_id
GROUP BY 
    c.customer_id, 
    c.customer_name
ORDER BY total_spent DESC
LIMIT 1;

