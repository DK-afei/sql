USE [11703990404_����];
UPDATE SC
SET Grade=Grade*1.1
WHERE Cno IN
(
SELECT Cno
FROM Course
WHERE Cname='��ѧ'
);
SELECT * FROM SC;
