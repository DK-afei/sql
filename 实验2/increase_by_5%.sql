USE [11703990404_����];
SELECT * FROM SC;
SELECT * FROM CAG;
UPDATE SC
SET Grade=Grade*1.05
WHERE Cno IN
(
SELECT Cno
FROM CAG
WHERE Cno=2 AND SC.Grade<CAG.AG
);
SELECT * FROM SC;