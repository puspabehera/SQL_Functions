# SQL_Functions
System Defined Functions &amp; User Defined Functions
<h3>System Defined Function</h3>
<h3>1.Round() Function</h3>


```
SELECT ROUND(1.756,0)   --2.000
SELECT ROUND(1.46,0)    --1.00
SELECT ROUND(123.45,-1) --120.00
SELECT ROUND(126.45,-1) --130.00
SELECT ROUND(555.00,-2) --600.00
SELECT ROUND(123.5,0) -- 124.0 -- (0) will Round in form of  1.
SELECT ROUND(123.1,-1)-- 120.0 --(-1) will Round in form of 10.
SELECT ROUND(123.1,-2)--100.0 -- (-2) will Round in form of 100.
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
