-- Create Department Table
--CREATE TABLE Department
--(
--  ID INT PRIMARY KEY,
--  DepartmentName VARCHAR(50)
--)
--GO

-- Populate the Department Table with test data
--INSERT INTO Department VALUES(1, 'IT')
--INSERT INTO Department VALUES(2, 'HR')
--INSERT INTO Department VALUES(3, 'Sales')
--GO

-- Create Employee Table
--CREATE TABLE Employee
--(
--  ID INT PRIMARY KEY,
--  Name VARCHAR(50),
--  Gender VARCHAR(50),
--  DOB DATETIME,
--  DeptID INT FOREIGN KEY REFERENCES Department(ID) 
--)
--GO

-- Populate the Employee Table with test data
--INSERT INTO Employee VALUES(1, 'Pranaya', 'Male','1996-02-29 10:53:27.060', 1)
--INSERT INTO Employee VALUES(2, 'Priyanka', 'Female','1995-05-25 10:53:27.060', 2)
--INSERT INTO Employee VALUES(3, 'Anurag', 'Male','1995-04-19 10:53:27.060', 2)
--INSERT INTO Employee VALUES(4, 'Preety', 'Female','1996-03-17 10:53:27.060', 3)
--INSERT INTO Employee VALUES(5, 'Sambit', 'Male','1997-01-15 10:53:27.060', 1)
--INSERT INTO Employee VALUES(6, 'Hina', 'Female','1995-07-12 10:53:27.060', 2)
--GO

select * from Department;
select * from Employee;

--creating InlineTableValuedFuncions
CREATE FUNCTION FN_GetEmployeessByGender
(
  @Gender VARCHAR(50)
)
RETURNS TABLE
AS
RETURN (SELECT ID, Name, Gender, DOB, DeptID FROM Employee WHERE Gender = @Gender)
--let’s join the Employees returned by the inline table-valued function with the Departments table
SELECT Name, Gender, DOB, DepartmentName 
FROM FN_GetEmployeessByGender('Male') Emp
JOIN Department Dept on Dept.ID = Emp.DeptID

--Table-valued Function Returning data From two Tables using Join in SQL Server
CREATE FUNCTION FN_EmployeessByGender
(
  @Gender VARCHAR(50)
)
RETURNS TABLE
AS
RETURN (
       SELECT Emp.ID, Name, Gender, DOB, DepartmentName 
    FROM Employee Emp
    JOIN Department Dept on Emp.DeptId = Dept.Id
    WHERE Gender = @Gender)
go
SELECT * FROM dbo.FN_EmployeessByGender('Female');