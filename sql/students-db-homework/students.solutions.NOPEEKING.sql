-- hey...no peeking!!!
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
-- okay.
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
-- here u go.

-- challenges

-- select all students
SELECT * FROM students;

-- select just names and majors
SELECT name, major FROM students;

-- select all classes
SELECT * FROM classes;

-- select all students majoring in Biology
SELECT * FROM students WHERE major = 'Biology';

-- select all grades above 80
SELECT * FROM grades WHERE grade > 80;

-- query that returns all students with grade >= 70, sorted by age
SELECT DISTINCT s.name, s.age, g.grade
FROM students s
JOIN students_grades sg ON s.studentID = sg.fk_student
JOIN grades g ON sg.fk_grades = g.gradeID
WHERE g.grade >= 70
ORDER BY s.age;

-- query that returns all students with under 3 classes
SELECT s.name, COUNT(sg.fk_grades) AS class_count
FROM students s
LEFT JOIN students_grades sg ON s.studentID = sg.fk_student
GROUP BY s.studentID
HAVING class_count < 3;


-- 3 more that claude picks

-- average grade per student (only students who have at least one grade)
SELECT s.name, ROUND(AVG(g.grade), 1) AS avg_grade
FROM students s
JOIN students_grades sg ON s.studentID = sg.fk_student
JOIN grades g ON sg.fk_grades = g.gradeID
GROUP BY s.studentID
ORDER BY avg_grade DESC;

-- students who share the same major as at least one classmate
SELECT DISTINCT s.name, s.major
FROM students s
WHERE s.major IN (
    SELECT major FROM students
    GROUP BY major
    HAVING COUNT(*) > 1
)
ORDER BY s.major, s.name;

-- students who have a failing grade (below 60) in any class
SELECT s.name, g.className, g.grade
FROM students s
JOIN students_grades sg ON s.studentID = sg.fk_student
JOIN grades g ON sg.fk_grades = g.gradeID
WHERE g.grade < 60
ORDER BY g.grade;

--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
