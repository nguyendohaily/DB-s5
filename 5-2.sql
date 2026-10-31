USE test_db;

-- 1. Xóa bảng employees cũ nếu đã tồn tại
DROP TABLE IF EXISTS employees;

-- 2. Tạo bảng employees với cấu trúc mới
CREATE TABLE employees (
    emp_id VARCHAR(10) PRIMARY KEY,
    full_name VARCHAR(100),
    department VARCHAR(50),
    salary DECIMAL(12, 2)
);

-- 3. Thêm dữ liệu mẫu
INSERT INTO employees (emp_id, full_name, department, salary)
VALUES
    ('E01', 'Nguyễn Văn An', 'IT', 15000000),
    ('E02', 'Trần Thị Bình', 'IT', 18000000),
    ('E03', 'Lê Hoàng Cường', 'IT', 20000000),
    ('E04', 'Phạm Minh Đức', 'IT', 11000000),
    ('E05', 'Vũ Thùy Linh', 'HR', 10000000),
    ('E06', 'Đỗ Quỳnh Anh', 'HR', 12000000),
    ('E07', 'Bùi Văn Hùng', 'HR', 9000000),
    ('E08', 'Hoàng Nhật Minh', 'HR', 11000000),
    ('E09', 'Đặng Thảo Vân', 'Marketing', 13000000),
    ('E10', 'Ngô Quốc Bảo', 'Marketing', 14000000);

SELECT 
    department, 
    COUNT(emp_id) AS total_employees
FROM employees
GROUP BY department;

SELECT 
    department, 
    ROUND(AVG(salary), 2) AS average_salary
FROM employees
GROUP BY department;

SELECT 
    department, 
    COUNT(emp_id) AS total_employees
FROM employees
GROUP BY department
HAVING COUNT(emp_id) > 3;

SELECT 
    department, 
    ROUND(AVG(salary), 2) AS average_salary
FROM employees
GROUP BY department
HAVING AVG(salary) > 12000000;

