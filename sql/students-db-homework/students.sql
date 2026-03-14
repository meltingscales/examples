-- sqlite language
-- use https://sqliteonline.com/

-- table defs
-- grades: (gradeID:int), className:str, grade:int
-- students_grades: (fk_grades:int fk_student:int)
-- students: (studentID:int), name:str, age:int, major:str
-- classes: (classID:str), major:str, className:str

-- CREATE + INSERT

CREATE TABLE students (
    studentID INTEGER PRIMARY KEY,
    name TEXT,
    age INTEGER,
    major TEXT
);

CREATE TABLE classes (
    classID INTEGER PRIMARY KEY,
    major TEXT,
    className TEXT
);

CREATE TABLE grades (
    gradeID INTEGER PRIMARY KEY,
    className TEXT,
    grade INTEGER
);

CREATE TABLE students_grades (
    fk_grades INTEGER,
    fk_student INTEGER,
    FOREIGN KEY (fk_grades) REFERENCES grades(gradeID),
    FOREIGN KEY (fk_student) REFERENCES students(studentID)
);

INSERT INTO students VALUES
    (1, 'Alice',   20, 'Computer Science'),
    (2, 'Bob',     22, 'Mathematics'),
    (3, 'Carol',   19, 'Computer Science'),
    (4, 'David',   21, 'Biology'),
    (5, 'Eve',     23, 'Mathematics'),
    (6, 'Frank',   20, 'Biology'),
    (7, 'Grace',   22, 'Computer Science');

INSERT INTO classes VALUES
    (1, 'Computer Science', 'Intro to CS'),
    (2, 'Computer Science', 'Data Structures'),
    (3, 'Computer Science', 'Algorithms'),
    (4, 'Mathematics',      'Calculus'),
    (5, 'Mathematics',      'Linear Algebra'),
    (6, 'Biology',          'Cell Biology'),
    (7, 'Biology',          'Genetics');

INSERT INTO grades VALUES
    (1,  'Intro to CS',      85),
    (2,  'Data Structures',  72),
    (3,  'Algorithms',       90),
    (4,  'Calculus',         65),
    (5,  'Linear Algebra',   78),
    (6,  'Cell Biology',     55),
    (7,  'Genetics',         88),
    (8,  'Intro to CS',      60),
    (9,  'Data Structures',  95),
    (10, 'Calculus',         73),
    (11, 'Linear Algebra',   80),
    (12, 'Cell Biology',     91),
    (13, 'Algorithms',       45),
    (14, 'Genetics',         70);

INSERT INTO students_grades VALUES
    (1,  1), (2,  1), (3,  1),  -- Alice: 3 classes
    (4,  2), (5,  2),            -- Bob: 2 classes
    (6,  3), (7,  3), (8,  3),  -- Carol: 3 classes (one grade below 70)
    (9,  4), (10, 4),            -- David: 2 classes
    (11, 5), (12, 5), (13, 5),  -- Eve: 3 classes (one grade below 70)
    (14, 6);                     -- Frank: 1 class


-- challenges

-- select all students
-- fill me in

-- select just names and majors
-- fill me in

-- select all classes
-- fill me in

-- select all students majoring in Biology
-- fill me in

-- select all grades above 80
-- fill me in

-- query that returns all students with grade >= 70, sorted by age
-- fill me in

-- query that returns all students with under 3 classes
-- fill me in


-- 3 more that claude picks

-- average grade per student (only students who have at least one grade)
-- fill me in

-- students who share the same major as at least one classmate
-- fill me in

-- students who have a failing grade (below 60) in any class
-- fill me in
