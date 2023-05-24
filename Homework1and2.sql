SELECT * FROM STUDENT WHERE FirstName='Antonio';
SELECT * FROM STUDENT WHERE DateOfBirth = '1999-01-01';
SELECT * FROM STUDENT WHERE LastName like 'J%' and EnrolledDate like '1998-01-%';
SELECT * FROM STUDENT ORDER BY FirstName;
SELECT LastName FROM Teacher
UNION
SELECT LastName FROM Student;

CREATE TABLE CollegeMajor (
    MajotId int PRIMARY KEY,
    Name nvarchar(150),
    Academy nvarchar(150)
);

ALTER TABLE Student
ADD MajorId int 
FOREIGN KEY (MajorId) REFERENCES CollegeMajor(MajotId);
SELECT * FROM Student;
