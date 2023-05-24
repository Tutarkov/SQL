SELECT Course.Name, AchievementType.Name
FROM Course
CROSS JOIN AchievementType;
-------------------------------------------------------------
SELECT Teacher.ID, Teacher.FirstName, Teacher.LastName
FROM Teacher
LEFT JOIN Grade ON Teacher.ID = Grade.TeacherID
WHERE Grade.ID IS NULL;
----------------------------------------------------------------
SELECT Teacher.ID, Teacher.FirstName, Teacher.LastName, COUNT(Grade.ID) AS GradeCount
FROM Teacher
LEFT JOIN Grade ON Teacher.ID = Grade.TeacherID
GROUP BY Teacher.ID, Teacher.FirstName, Teacher.LastName;
---------------------------------------------------------------
SELECT Teacher.ID, Teacher.FirstName, Teacher.LastName, COUNT(Grade.ID) AS GradeCount
FROM Teacher
LEFT JOIN Grade ON Teacher.ID = Grade.TeacherID
INNER JOIN Student ON Grade.StudentID = Student.ID
WHERE Student.ID < 100
GROUP BY Teacher.ID, Teacher.FirstName, Teacher.LastName;
------------------------------------------------------------
SELECT Grade.StudentID, MAX(Grade.Grade) AS MaxGrade, AVG(Grade.Grade) AS AvgGrade
FROM Grade
GROUP BY Grade.StudentID;
------------------------------------------------------------
SELECT Teacher.ID, Teacher.FirstName, Teacher.LastName, COUNT(Grade.ID) AS GradeCount
FROM Teacher
LEFT JOIN Grade ON Teacher.ID = Grade.TeacherID
GROUP BY Teacher.ID, Teacher.FirstName, Teacher.LastName
HAVING COUNT(Grade.ID) > 200;
----------------------------------------------------------------
SELECT Grade.StudentID, COUNT(Grade.ID) AS GradeCount, MAX(Grade.Grade) AS MaxGrade, AVG(Grade.Grade) AS AvgGrade
FROM Grade
GROUP BY Grade.StudentID
HAVING MAX(Grade.Grade) = AVG(Grade.Grade);
---------------------------------------------------------------
SELECT Student.FirstName, Student.LastName, GradeCount, MaxGrade, AvgGrade
FROM
(
    SELECT Grade.StudentID, COUNT(Grade.ID) AS GradeCount, MAX(Grade.Grade) AS MaxGrade, AVG(Grade.Grade) AS AvgGrade
    FROM Grade
    GROUP BY Grade.StudentID
    HAVING MAX(Grade.Grade) = AVG(Grade.Grade)
) AS Results
JOIN Student ON Results.StudentID = Student.ID;








