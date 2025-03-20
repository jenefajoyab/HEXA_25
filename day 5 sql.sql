-- Create and populate the 'employees' table
CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    department VARCHAR(50)
);

INSERT INTO employees VALUES
(1, 'John', 'Smith', 'Sales'),
(2, 'Mary', 'Johnson', 'Marketing'),
(3, 'Robert', 'Brown', 'IT'),
(4, 'Susan', 'Davis', 'HR'),
(5, 'Michael', 'Wilson', 'Sales');

-- Create and populate the 'new_hires' table
CREATE TABLE new_hires (
    employee_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    department VARCHAR(50)
);

INSERT INTO new_hires VALUES
(4, 'Susan', 'Davis', 'HR'),
(5, 'Michael', 'Wilson', 'Sales'),
(6, 'Jennifer', 'Lee', 'Marketing'),
(7, 'David', 'Thomas', 'IT');

SELECT employee_id, first_name, last_name, department FROM employees
UNION
SELECT employee_id, first_name, last_name, department FROM new_hires;

SELECT employee_id, first_name, last_name, department FROM employees
INTERSECT
SELECT employee_id, first_name, last_name, department FROM new_hires;

SELECT employee_id, first_name, last_name, department FROM employees
EXCEPT
SELECT employee_id, first_name, last_name, department FROM new_hires;

MERGE INTO employees AS target
USING new_hires AS source
ON (target.employee_id = source.employee_id)
WHEN MATCHED THEN
    UPDATE SET 
        target.department = source.department
WHEN NOT MATCHED THEN
    INSERT (employee_id, first_name, last_name, department)
    VALUES (source.employee_id, source.first_name, source.last_name, source.department);

	SELECT * FROM employees
	SELECT * FROM new_hires