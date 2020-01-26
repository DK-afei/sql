USE [11703990404_µËÇÅ];
UPDATE SC
SET Grade=Grade*1.1
WHERE Cno IN
(
SELECT Cno
FROM Course
WHERE Cname='ÊýÑ§'
);
SELECT * FROM SC;
