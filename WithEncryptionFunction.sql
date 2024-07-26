---- Create Employee Table
--CREATE TABLE Employees
--(
--  ID INT PRIMARY KEY,
--  Name VARCHAR(50),
--  Gender VARCHAR(50),
--  DOB DATETIME,
--  DeptID INT
--)
--GO

---- Populate the Employees Table with test data
--INSERT INTO Employees VALUES(1, 'Pranaya', 'Male','1996-02-29 10:53:27.060', 1)
--INSERT INTO Employees VALUES(2, 'Priyanka', 'Female','1995-05-25 10:53:27.060', 2)
--INSERT INTO Employees VALUES(3, 'Anurag', 'Male','1995-04-19 10:53:27.060', 2)
--INSERT INTO Employees VALUES(4, 'Preety', 'Female','1996-03-17 10:53:27.060', 3)
--INSERT INTO Employees VALUES(5, 'Sambit', 'Male','1997-01-15 10:53:27.060', 1)
--INSERT INTO Employees VALUES(6, 'Hina', 'Female','1995-07-12 10:53:27.060', 2)
--GO

select * from Employees;

-- Function without with encryption option
create function fn_GetEmployees
(
@id INT
)
returns Table
as
return (select name,gender, cast(dob as date)as dob
from Employees
where id = @id)

select * from fn_GetEmployees(1)
sp_helptext fn_GetEmployees;

-- Function with encryption option
Alter function fn_GetEmployees
(
@id int
)
returns table
with encryption
as
return (select name, gender, cast(dob as date)as dob
from employees where id= @id)

select * from fn_GetEmployees(2)
sp_helptext fn_GetEmployees
