USE RecipeDelight;

-- 1. a) CREATE USER
CREATE USER "testing"@"localhost" IDENTIFIED BY "password";

-- 1. b) CREATE INDEX
CREATE INDEX studentName ON Student(lastName);

-- 1. c) GRANT
GRANT SELECT ON Employees TO karl@localhost;

-- 1. d) SET
SET @testing := 100;
-- will output 100
SELECT @testing;
-- will save the biggest salary to variable
SELECT @biggestSalary := MAX(salary) FROM Chef;

-- 1. e) LIMIT
SELECT chefId, firstName, lastName FROM Chef LIMIT 5;

--------------------------------------------------------------------------------

-- 2. a) REVOKE
REVOKE SELECT ON Employees FROM karl@localhost;

-- 2. b) Date/Time data types
-- DATETIME
SET @currentTime := NOW();
-- DATE
SET @currentTimeDate := DATE(@currentTime);
-- TIME
SET @currentTimeTime := TIME(@currentTime);
-- more uses
SELECT HOUR(@currentTime), MINUTE(@currentTime), SECOND(@currentTime);
-- TIMESTAMP
SET @currentTimeStamp := TIMESTAMP(@currentTime);
-- YEAR
SET @currentTimeYear := YEAR(@currentTime);

-- 2. c) EXPLAIN
EXPLAIN SELECT * FROM Student;
