create procedure CreateGrade
as
begin
 SELECT COUNT(*)
 FROM Grade
 group by StudentID;
 Select MAX(Grade) Maximum
 FROM GRADE g, Student s
 where g.StudentID=s.ID;
end

execute CreateGrade;

