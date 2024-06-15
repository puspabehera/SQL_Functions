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
