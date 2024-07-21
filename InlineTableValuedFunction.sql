
select * from  students;

-- Create students Table
--CREATE TABLE students
--(
--  ID INT PRIMARY KEY,
--  Name VARCHAR(50),
--  Gender VARCHAR(50),
--  DOB DATETIME,
--  Branch VARCHAR(50)
--)

-- Populate the students Table with test data
--INSERT INTO students VALUES(3, 'Anurag', 'Male','1995-04-19 10:53:27.060', 'ETC')
--INSERT INTO students VALUES(1, 'Pranaya', 'Male','1996-02-29 10:53:27.060', 'CSE')
--INSERT INTO students VALUES(2, 'Priyanka', 'Female','1995-05-25 10:53:27.060', 'CSE')
--INSERT INTO students VALUES(4, 'Preety', 'Female','1996-03-17 10:53:27.060', 'ETC')
--INSERT INTO students VALUES(5, 'Sambit', 'Male','1997-01-15 10:53:27.060', 'CSE')

--Inline table valued functions
CREATE FUNCTION FN_GetStudentDetailsByID
(
  @ID INT
)
RETURNS TABLE
AS
RETURN (SELECT * FROM students WHERE ID = @ID)

SELECT * FROM FN_GetStudentDetailsByID(2)

--Inline table valued functions

CREATE FUNCTION FN_GetStudentDetailsByBranch
(
  @Branch VARCHAR(50)
)
RETURNS TABLE
AS
RETURN (SELECT * FROM students WHERE Branch = @Branch)

SELECT * FROM FN_GetStudentDetailsByBranch('CSE')

--Inline table valued functions
CREATE FUNCTION FN_GetStudentDetailsByGender
(
  @Gender VARCHAR(50)
)
RETURNS TABLE
AS
RETURN (SELECT Name, DOB, Branch FROM Students WHERE Gender = @Gender)

SELECT * FROM FN_GetStudentDetailsByGender('Male')