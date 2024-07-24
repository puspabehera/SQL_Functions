
select * from  student;

-- Create student Table
--CREATE TABLE student
--(
--  ID INT PRIMARY KEY,
--  Name VARCHAR(50),
--  Gender VARCHAR(50),
--  DOB DATETIME,
--  Branch VARCHAR(50)
--)
--go
-- Populate the student Table with test data
--INSERT INTO student VALUES(3, 'Anurag', 'Male','1995-04-19 10:53:27.060', 'ETC')
--INSERT INTO student VALUES(1, 'Pranaya', 'Male','1996-02-29 10:53:27.060', 'CSE')
--INSERT INTO student VALUES(2, 'Priyanka', 'Female','1995-05-25 10:53:27.060', 'CSE')
--INSERT INTO student VALUES(4, 'Preety', 'Female','1996-03-17 10:53:27.060', 'ETC')
--INSERT INTO student VALUES(5, 'Sambit', 'Male','1997-01-15 10:53:27.060', 'CSE')

--multiLine table valued functions

create function fn_GetStudent()
returns @Table table (id int, name varchar(20), DOB datetime)
as
begin
  insert into @Table
  select id,name,dob from student
  return
end

select * from dbo.fn_GetStudent()
