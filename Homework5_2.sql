INSERT INTO AchievementType (ID,Name,Description,ParticipationRate) values (6,'SumGrades',NULL,50);
INSERT INTO Grade (ID,StudentID,CourseID,TeacherID,Grade,Comment,CreatedDate) values (21000,15,3,3,10,'Dobar','2023-06-05 00:00:00');
delete from GradeDetails where ID='96000';
commit;

create procedure CreateGradeDetails
as
begin
 INSERT INTO GradeDetails(ID,GradeID,AchievementTypeID,AchievementPoints,AchievementMaxPoints,AchievementDate) values(96000,21000,6,90,100,'2023-06-05 00:00:00');
 select (g.AchievementPoints / g.AchievementMaxPoints) * t.ParticipationRate as sumGrades
 from AchievementType t, GradeDetails g
 where g.ID='96000';
end;

execute CreateGradeDetails



