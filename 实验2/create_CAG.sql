USE [11703990404_����];
CREATE TABLE CAG(
Cno CHAR(4),
AG SMALLINT,
PRIMARY KEY (Cno),
FOREIGN KEY(Cno) REFERENCES Course(Cno)
);
INSERT
INTO CAG(Cno,AG)
SELECT Cno,AVG(Grade)
FROM SC
GROUP BY Cno;
SELECT * FROM CAG;