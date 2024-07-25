---- Create Department Table
--CREATE TABLE Department
--(
--  ID INT PRIMARY KEY,
--  DepartmentName VARCHAR(50)
--)
--GO

---- Populate the Department Table with test data
--INSERT INTO Department VALUES(1, 'IT')
--INSERT INTO Department VALUES(2, 'HR')
--INSERT INTO Department VALUES(3, 'Sales')
--GO

---- Create Employee Table
--CREATE TABLE Employee
--(
--  ID INT PRIMARY KEY,
--  Name VARCHAR(50),
--  Gender VARCHAR(50),
--  DOB DATETIME,
--  DeptID INT FOREIGN KEY REFERENCES Department(ID) 
--)
--GO

---- Populate the Employee Table with test data
--INSERT INTO Employee VALUES(1, 'Pranaya', 'Male','1996-02-29 10:53:27.060', 1)
--INSERT INTO Employee VALUES(2, 'Priyanka', 'Female','1995-05-25 10:53:27.060', 2)
--INSERT INTO Employee VALUES(3, 'Anurag', 'Male','1995-04-19 10:53:27.060', 2)
--INSERT INTO Employee VALUES(4, 'Preety', 'Female','1996-03-17 10:53:27.060', 3)
--INSERT INTO Employee VALUES(5, 'Sambit', 'Male','1997-01-15 10:53:27.060', 1)
--INSERT INTO Employee VALUES(6, 'Hina', 'Female','1995-07-12 10:53:27.060', 2)
--GO

select * from Department;
select * from Employee;

--MultiStatement Table Valued Function:

-- Multi-statement Table Valued function:
CREATE FUNCTION GetEmployees()
RETURNS @Table Table (ID int, Name nvarchar(20), DOB Date)
AS
BEGIN
  INSERT INTO @Table
    SELECT ID, Name, Cast(DOB AS Date)
    FROM Employee
  Return
End

Select * from GetEmployees()