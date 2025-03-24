CREATE DATABASE SIS

CREATE TABLE Students (
    student_id INT IDENTITY(1,1) PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    date_of_birth DATE NOT NULL,
    email VARCHAR(MAX)  NOT NULL,
    phone_number BIGINT NOT NULL
);
--DROP TABLE Students
CREATE TABLE Teachers (
    teacher_id INT IDENTITY(1,1) PRIMARY KEY ,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(MAX)  NOT NULL
);
--DROP TABLE Teachers
CREATE TABLE Courses (
    course_id INT IDENTITY(1,1) PRIMARY KEY ,
    course_name VARCHAR(100) NOT NULL,
    credits INT NOT NULL,
    teacher_id INT,
    CONSTRAINT fk_teach FOREIGN KEY (teacher_id) REFERENCES Teachers(teacher_id) ON DELETE SET NULL
);
--DROP TABLE Courses
CREATE TABLE Enrollments (
    enrollment_id INT IDENTITY(1,1) PRIMARY KEY,
    student_id INT,
    course_id INT,
    enrollment_date DATE NOT NULL,
    CONSTRAINT fk_studid FOREIGN KEY  (student_id) REFERENCES Students(student_id) ON DELETE CASCADE,
    CONSTRAINT fk_courseid FOREIGN KEY (course_id) REFERENCES Courses(course_id) ON DELETE CASCADE
);
--DROP TABLE Enrollments
CREATE TABLE Payments (
    payment_id INT IDENTITY(1,1) PRIMARY KEY ,
    student_id INT,
    amount DECIMAL(10,2) NOT NULL,
    payment_date DATE NOT NULL,
    CONSTRAINT fk_stid FOREIGN KEY (student_id) REFERENCES Students(student_id) ON DELETE CASCADE
);

--DROP TABLE Payments
-- Insert records into Students
INSERT INTO Students (first_name, last_name, date_of_birth, email, phone_number) VALUES
('Jenefa', 'Joy', '2000-05-15', 'jenefa.joy@email.com', 9876543210),
('Jane', 'Smith', '1999-08-22', 'jane.smith@email.com', 9876543211),
('Emily', 'Johnson', '2001-02-10', 'emily.johnson@email.com', 9876543212),
('Michael', 'Brown', '1998-11-30', 'michael.brown@email.com', 9876543213),
('Sarah', 'Williams', '2002-07-19', 'sarah.williams@email.com', 9876543214),
('David', 'Miller', '2000-09-25', 'david.miller@email.com', 9876543215),
('Sophia', 'Wilson', '2001-12-14', 'sophia.wilson@email.com', 9876543216),
('Daniel', 'Moore', '1999-04-03', 'daniel.moore@email.com', 9876543217),
('Olivia', 'Taylor', '2000-06-18', 'olivia.taylor@email.com', 9876543218),
('James', 'Anderson', '2001-01-05', 'james.anderson@email.com', 9876543219);

-- Insert records into Teachers
INSERT INTO Teachers (first_name, last_name, email) VALUES
('Alice', 'Cooper', 'alice.cooper@email.com'),
('Bob', 'Marley', 'bob.marley@email.com'),
('Charlie', 'Parker', 'charlie.parker@email.com'),
('Diana', 'Ross', 'diana.ross@email.com'),
('Edward', 'Wilson', 'edward.wilson@email.com'),
('Fiona', 'Garcia', 'fiona.garcia@email.com'),
('George', 'Harrison', 'george.harrison@email.com'),
('Helen', 'Adams', 'helen.adams@email.com'),
('Isaac', 'Newton', 'isaac.newton@email.com'),
('Jack', 'White', 'jack.white@email.com');

-- Insert records into Courses
INSERT INTO Courses (course_name, credits, teacher_id) VALUES
('Mathematics', 4, 1),
('Physics', 3, 2),
('Chemistry', 4, 3),
('Biology', 3, 4),
('Computer Science', 5, 5),
('History', 2, 6),
('English Literature', 3, 7),
('Economics', 4, 8),
('Psychology', 3, 9),
('Philosophy', 2, 10);

-- Insert records into Enrollments
INSERT INTO Enrollments (student_id, course_id, enrollment_date) VALUES
(1, 1, '2024-01-10'),
(2, 2, '2024-01-12'),
(3, 3, '2024-01-15'),
(4, 4, '2024-01-18'),
(5, 5, '2024-01-20'),
(6, 6, '2024-01-22'),
(7, 7, '2024-01-25'),
(8, 8, '2024-01-28'),
(9, 9, '2024-01-30'),
(10, 10, '2024-02-01');

-- Insert records into Payments
INSERT INTO Payments (student_id, amount, payment_date) VALUES
(1, 500.00, '2024-01-05'),
(2, 400.00, '2024-01-08'),
(3, 450.00, '2024-01-12'),
(4, 550.00, '2024-01-15'),
(5, 600.00, '2024-01-18'),
(6, 500.00, '2024-01-20'),
(7, 650.00, '2024-01-22'),
(8, 700.00, '2024-01-25'),
(9, 480.00, '2024-01-28'),
(10, 530.00, '2024-02-01');


SELECT * FROM Students
SELECT * FROM Courses
SELECT * FROM Teachers
SELECT * FROM Enrollments
SELECT * FROM Payments

INSERT INTO Students (first_name, last_name, date_of_birth, email, phone_number)
VALUES ('John', 'Doe', '1995-08-15', 'john.doe@example.com', 1234567890);

SELECT student_id FROM Students WHERE first_name = 'John' AND last_name = 'Doe';
SELECT course_id FROM Courses WHERE course_name = 'Mathematics'; 

INSERT INTO Enrollments (student_id, course_id, enrollment_date)
VALUES (11, 1, GETDATE());  


--'Diana', 'Ross'
SELECT * FROM Teachers WHERE first_name = 'Diana' AND last_name = 'Ross';
UPDATE Teachers
SET email = 'diana.new@email.com'
WHERE teacher_id = 4; 

SELECT student_id FROM Students WHERE first_name = 'James' AND last_name = 'Anderson';
SELECT * FROM Enrollments WHERE student_id=10;

delete FROM Enrollments WHERE student_id = 10 AND course_id = 10; 

SELECT * FROM Courses;
SELECT * FROM Teachers;

UPDATE Courses
SET teacher_id = 9 
WHERE course_id = 2; 

DELETE FROM Students WHERE student_id = 7; 

UPDATE Payments
SET amount = 600.00 
WHERE payment_id = 10; 

-------------------
-- task 3
--Write an SQL query to calculate the total payments made by a specific student. You will need to 
--join the "Payments" table with the "Students" table based on the student's ID. 
SELECT first_name+' '+last_name as name,amount 
from Students s
join Payments p on s.student_id= p.student_id

--Write an SQL query to retrieve a list of courses along with the count of students enrolled in each 
--course. Use a JOIN operation between the "Courses" table and the "Enrollments" table.
SELECT course_name,count(student_id)
from Courses c
join Enrollments e on c.course_id= e.course_id
group by course_name

--Write an SQL query to find the names of students who have not enrolled in any course. Use a 
--LEFT JOIN between the "Students" table and the "Enrollments" table to identify students 
--without enrollments. 
SELECT course_name,count(student_id) 
from Courses c
left join  Enrollments e on c.course_id = e.course_id 
group by course_name 
HAVING COUNT(student_id) = 0

--Write an SQL query to retrieve the first name, last name of students, and the names of the 
--courses they are enrolled in. Use JOIN operations between the "Students" table and the 
--"Enrollments" and "Courses" tables. 
SELECT first_name+' '+last_name as name ,course_name
from Students s
join Enrollments e ON s.student_id=e.student_id
join Courses c on c.course_id= e.course_id
group by course_name,first_name,last_name

--Create a query to list the names of teachers and the courses they are assigned to. Join the 
--"Teacher" table with the "Courses" table. 
SELECT first_name+' '+last_name as name ,course_name
FROM Teachers t
left join Courses c ON  t.teacher_id=c.teacher_id
group by course_name,first_name,last_name

--Retrieve a list of students and their enrollment dates for a specific course. You'll need to join the 
--"Students" table with the "Enrollments" and "Courses" tables.
SELECT s.first_name, s.last_name, e.enrollment_date
FROM Students s
JOIN Enrollments e ON s.student_id = e.student_id
JOIN Courses c ON e.course_id = c.course_id
WHERE c.course_name = 'Physics' 
ORDER BY e.enrollment_date DESC;

--Find the names of students who have not made any payments. Use a LEFT JOIN between the 
--"Students" table and the "Payments" table and filter for students with NULL payment records. 
SELECT first_name+' '+last_name as name 
from Students s
left join Payments p ON s.student_id=p.student_id 
where amount is null

--Write a query to identify courses that have no enrollments. You'll need to use a LEFT JOIN 
--between the "Courses" table and the "Enrollments" table and filter for courses with NULL 
--enrollment records. 
SELECT e.course_id,course_name
FROM Enrollments e
LEFT JOIN Courses c ON e.course_id = c.course_id
WHERE e.enrollment_id IS NULL  


SELECT s.first_name, s.last_name, COUNT(e.course_id) AS course_count
FROM Students s
JOIN Enrollments e ON s.student_id = e.student_id
GROUP BY s.first_name, s.last_name
HAVING COUNT(e.course_id) > 1

-- Find teachers who are not assigned to any courses. Use a LEFT JOIN between the "Teacher" 
--table and the "Courses" table and filter for teachers with NULL course assignments.
SELECT first_name+' '+last_name as name
FROM Teachers t
LEFT JOIN Courses c ON t.teacher_id=c.teacher_id
WHERE c.course_id IS NULL
--------------------------------------------------------
--TASK 4

--Write an SQL query to calculate the average number of students enrolled in each course. Use 
--aggregate functions and subqueries to achieve this. 
SELECT course_id, 
       (SELECT COUNT(*) FROM Enrollments e WHERE e.course_id = c.course_id) AS student_count
FROM Courses c;

--Identify the student(s) who made the highest payment. Use a subquery to find the maximum 
--payment amount and then retrieve the student(s) associated with that amount. 
SELECT first_name + ' ' + last_name AS name, 
       (SELECT MAX(amount) FROM Payments) AS max_payment
FROM Students
WHERE student_id IN (
    SELECT student_id 
    FROM Payments 
    WHERE amount = (SELECT MAX(amount) FROM Payments)
);

--Retrieve a list of courses with the highest number of enrollments. Use subqueries to find the 
--course(s) with the maximum enrollment count.
SELECT TOP 1 course_name, 
       (SELECT COUNT(*) FROM Enrollments e WHERE e.course_id = c.course_id) AS student_count
FROM Courses c
ORDER BY (SELECT COUNT(*) FROM Enrollments e WHERE e.course_id = c.course_id) DESC ;

--Calculate the total payments made to courses taught by each teacher. Use subqueries to sum 
--payments for each teacher's courses.
SELECT t.first_name + ' ' + t.last_name AS teacher_name, 
       (SELECT SUM(p.amount) 
        FROM Payments p 
        WHERE p.student_id IN (SELECT e.student_id 
                               FROM Enrollments e 
                               WHERE e.course_id IN (SELECT c.course_id 
                                                     FROM Courses c 
                                                     WHERE c.teacher_id = t.teacher_id))) 
 AS total_payments
FROM Teachers t;

--Identify students who are enrolled in all available courses. Use subqueries to compare a 
--student's enrollments with the total number of courses. 
SELECT first_name + ' ' + last_name AS name,student_id
from Students
where student_id in (select student_id from Enrollments where course_id =all
(select course_id from Courses))

--Retrieve the names of teachers who have not been assigned to any courses. Use subqueries to 
--find teachers with no course assignments. 
SELECT first_name, last_name
FROM Teachers
WHERE teacher_id NOT IN (SELECT DISTINCT teacher_id FROM Courses);

--Calculate the average age of all students. Use subqueries to calculate the age of each student 
--based on their date of birth. 
SELECT AVG(DATEDIFF(YEAR, date_of_birth, GETDATE())) AS avg_age
FROM Students;

-- Identify courses with no enrollments. Use subqueries to find courses without enrollment 
--records. 
SELECT course_name
FROM Courses
WHERE course_id NOT IN (SELECT DISTINCT course_id FROM Enrollments);

--Calculate the total payments made by each student for each course they are enrolled in. Use 
--subqueries and aggregate functions to sum payments. 
SELECT first_name + ' ' + last_name AS name,(select sum(amount) 
from payments )
from Students
group by first_name,last_name

-- Identify students who have made more than one payment. Use subqueries and aggregate 
--functions to count payments per student and filter for those with counts greater than one.
SELECT first_name + ' ' + last_name AS name, 
(SELECT COUNT(*) FROM Enrollments WHERE Students.student_id=Enrollments.student_id) 
FROM Students	
where (SELECT COUNT(*) FROM Enrollments WHERE Students.student_id=Enrollments.student_id)> 1

--Write an SQL query to calculate the total payments made by each student. Join the "Students" 
--table with the "Payments" table and use GROUP BY to calculate the sum of payments for each 
--student. 
SELECT first_name + ' ' + last_name AS name,sum(amount) as total
from Students s
left join Payments p on s.student_id=p.student_id
group by first_name,last_name

--Retrieve a list of course names along with the count of students enrolled in each course. Use 
--JOIN operations between the "Courses" table and the "Enrollments" table and GROUP BY to 
--count enrollments. 
SELECT c.course_name, COUNT(e.student_id) AS enrolled_students
FROM Courses c
LEFT JOIN Enrollments e ON c.course_id = e.course_id
GROUP BY c.course_name
order by COUNT(e.student_id) desc;

--Calculate the average payment amount made by students. Use JOIN operations between the 
--"Students" table and the "Payments" table and GROUP BY to calculate the average. 
SELECT s.first_name, s.last_name, AVG(p.amount) AS avg_payment
FROM Students s
JOIN Payments p ON s.student_id = p.student_id
GROUP BY s.first_name, s.last_name;






