# SQL_Functions
System Defined Functions & amp; User Defined Functions
<h3>System Defined Function</h3>
<h3>1.Round() Function</h3>

```
SELECT ROUND(1.756,0)   --2.000
SELECT ROUND(1.46,0)    --1.00
SELECT ROUND(123.45,-1) --120.00
SELECT ROUND(126.45,-1) --130.00 
SELECT ROUND(555.00,-2) --600.00
SELECT ROUND(123.5,0) -- 124.0  -- (0) will Round in form of 1.
SELECT ROUND(123.1,-1)-- 120.0  --(-1) will Round in form of 10.
SELECT ROUND(123.1,-2)--100.0  -- (-2) will Round in form of 100.
```

<h3>2.IIF() Function</h3>

```
using IIF() function with table data
Declare @GenderId int
SET @GenderId = 2 

select IIF(@GenderId = 1, 'male', 'female') as Gender

IIF Function
select Name, GenderId,
IIF(GenderId = 1, 'male', 'female') as Gender from Employee_info

```
<h3>3.Case Statement Function</h3>

  ```
select Name, GenderId,
case when GenderId = 1
then 'male'
else 'female'
end as Gender
from Employee_info
```
<h3>4. RAND() Function</h3>

```
SELECT RAND() AS RandomNumber;
SELECT RAND(100) AS RandomNumberWithSeed;
SELECT RAND() * 100 AS RandomNumberInRange;
SELECT FLOOR(RAND() * 100) + 1 AS RandomIntegerInRange;

SELECT id, FirstName, RAND() AS RandomNumber
FROM employees;

SELECT TOP 1 *
FROM employees
ORDER BY NEWID();

SELECT TOP 5 *
FROM employees
ORDER BY NEWID();

SELECT id, FirstName, RAND(CHECKSUM(NEWID())) AS RandomNumber
FROM employees;

DECLARE @Values TABLE (Value INT);
INSERT INTO @Values (Value)
VALUES (10), (20), (30), (40), (50);

SELECT TOP 1 Value
FROM @Values
ORDER BY NEWID();

SELECT 10.0 + (RAND() * (20.0 - 10.0)) AS RandomDecimalInRange;
```

<h3>5. STRING_AGG WITHIN_GROUP Function</h3>

 ```
select DeptId, STRING_AGG(EmailId,',')WITHIN GROUP (Order by EmailId) Email_List
from #Emp_Details
Group by DeptId ;
```

<h3>6.CHARINDEX() Function</h3>

```
SELECT CHARINDEX('t', 'Customer') AS MatchPosition;

result
MatchPosition
4
```

<h3>7. Scalar function without parameter </h3>

```
create function showmessage()
returns varchar (100)
as
begin
return 'welcome to function'
end

select dbo.showmessage();

O/P : welcome to function

```

<h3>8. Inline Table Valued function </h3>

```

CREATE FUNCTION ILTVF_GetEmployees()
RETURNS TABLE
AS
RETURN (SELECT ID, Name, Cast(DOB AS Date) AS DOB
        FROM Employee)

SELECT * FROM ILTVF_GetEmployees()

```

<h3> 9. Multi Statement Table Valued Function </h3>

```

CREATE FUNCTION MSTVF_GetEmployees()
RETURNS @Table Table (ID int, Name nvarchar(20), DOB Date)
AS
BEGIN
  INSERT INTO @Table
    SELECT ID, Name, Cast(DOB AS Date)
    FROM Employee
  Return
End

SELECT * FROM MSTVF_GetEmployees()

```


