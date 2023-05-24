CREATE VIEW vv_StudentGrades AS
SELECT StudentID , count(*) as Grades
FROM Grade
group by StudentID;

select * from vv_StudentGrades
order by StudentID;
----------------------------------------------
ALTER VIEW vv_StudentGrades AS
SELECT s.FirstName, s.LastName, COUNT(*) AS Grades
FROM Grade g
JOIN Student s ON g.StudentID = s.ID
GROUP BY s.FirstName, s.LastName;

select * from vv_StudentGrades
order by Grades;
----------------------------------------------
select * from vv_StudentGrades
order by Grades desc;
----------------------------------------------
DECLARE @FirstN NVARCHAR(100);
SET @FirstN = 'Antonio';

SELECT *
FROM Student
WHERE FirstName = @FirstN;
------------------------------------------------
Create table FemaleStudents(
    ID INT,
    FirstName VARCHAR(100),
    DateOfBirth DATE
);

INSERT INTO FemaleStudents (ID, FirstName, DateOfBirth)
SELECT ID, FirstName, DateOfBirth
FROM Student
WHERE Gender = 'F';

Select * from FemaleStudents;

----------------------------------------------
CREATE TABLE #MaleStudents (
    LastName VARCHAR(100),
    EnrolledDate DATE
);

INSERT INTO #MaleStudents (LastName, EnrolledDate)
SELECT LastName, EnrolledDate
FROM Student
WHERE Gender = 'M' AND FirstName LIKE 'A%';

SELECT *
FROM #MaleStudents
WHERE LEN(LastName) = 7;
------------------------------------------------
SELECT *
FROM Teacher
WHERE LEN(FirstName) < 5
  AND LEFT(FirstName, 3) = LEFT(LastName, 3);
------------------------------------------------

