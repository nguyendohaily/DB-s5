USE test_db;

-- 1. Xóa bảng products cũ nếu đã tồn tại
DROP TABLE IF EXISTS products;

-- 2. Tạo bảng products mới
CREATE TABLE products (
    product_id VARCHAR(10) PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(50),
    price DECIMAL(12, 2)
);

-- 3. Thêm dữ liệu sản phẩm
INSERT INTO products (product_id, product_name, category, price)
VALUES
    ('P01', 'Dell XPS 13', 'Laptop', 25000000),
    ('P02', 'MacBook Air M2', 'Laptop', 23000000),
    ('P03', 'Asus VivoBook', 'Laptop', 14000000),
    ('P04', 'iPhone 15 Pro', 'Phone', 28000000),
    ('P05', 'Samsung Galaxy A54', 'Phone', 8500000),
    ('P06', 'Xiaomi Redmi Note 13', 'Phone', 5600000),
    ('P07', 'iPad Gen 10', 'Tablet', 10500000),
    ('P08', 'Galaxy Tab A9', 'Tablet', 4200000);

SELECT product_id, product_name, category, price
FROM products
WHERE price > (
    SELECT AVG(price) 
    FROM products
);

SELECT product_id, product_name, category, price
FROM products p
WHERE price = (
    SELECT MAX(price)
    FROM products
    WHERE category = p.category
);

SELECT product_id, product_name, category, price
FROM products
WHERE category IN (
    SELECT DISTINCT category
    FROM products
    WHERE price > 20000000
);

