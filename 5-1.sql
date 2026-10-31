USE test_db;

-- 1. Xóa bảng students cũ nếu đã tồn tại
DROP TABLE IF EXISTS students;

-- 2. Tạo lại bảng students với cấu trúc mới
CREATE TABLE students (
    student_id VARCHAR(10) PRIMARY KEY,
    full_name VARCHAR(100),
    birth_year INT,
    gender VARCHAR(10),
    score DECIMAL(4, 2)
);

-- 3. Thêm dữ liệu mẫu
INSERT INTO students (student_id, full_name, birth_year, gender, score)
VALUES
    ('SV01', 'Nguyễn Văn An', 2004, 'Nam', 8.56),
    ('SV02', 'Trần Thị Bình', 2003, 'Nữ', 7.24),
    ('SV03', 'Lê Hoàng Cường', 2005, 'Nam', 9.15),
    ('SV04', 'Phạm Minh Đức', 2002, 'Nam', 6.88),
    ('SV05', 'Vũ Mai Hoa', 2004, 'Nữ', 8.42);

SELECT 
    student_id, 
    UPPER(full_name) AS full_name_uppercase
FROM students;

SELECT 
    full_name, 
    YEAR(CURDATE()) - birth_year AS age
FROM students;

SELECT 
    student_id,
    full_name,
    ROUND(score, 1) AS rounded_score
FROM students;

SELECT 
    COUNT(student_id) AS total_students,
    MAX(score) AS highest_score,
    MIN(score) AS lowest_score
FROM students;