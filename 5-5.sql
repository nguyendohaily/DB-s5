USE test_db;

CREATE TABLE scores (
    student_id VARCHAR(10),
    subject VARCHAR(50),
    score DECIMAL(4, 2)
);

INSERT INTO scores (student_id, subject, score)
VALUES
    ('SV01', 'Toán', 8.5),
    ('SV01', 'Lý', 7.5),
    ('SV01', 'Hóa', 9.0),
    ('SV02', 'Toán', 6.0),
    ('SV02', 'Lý', 6.5),
    ('SV02', 'Hóa', 5.5),
    ('SV03', 'Toán', 9.0),
    ('SV03', 'Lý', 9.5),
    ('SV03', 'Hóa', 9.0),
    ('SV04', 'Toán', 7.0),
    ('SV04', 'Lý', 7.5),
    ('SV04', 'Hóa', 7.0),
    ('SV05', 'Toán', 5.0),
    ('SV05', 'Lý', 4.5),
    ('SV05', 'Hóa', 6.0);

SELECT 
    student_id,
    ROUND(AVG(score), 2) AS avg_score
FROM scores
GROUP BY student_id;

SELECT 
    student_id,
    ROUND(AVG(score), 2) AS avg_score
FROM scores
GROUP BY student_id
HAVING AVG(score) >= 7.0;

SELECT 
    student_id,
    ROUND(AVG(score), 2) AS avg_score
FROM scores
GROUP BY student_id
ORDER BY avg_score DESC

