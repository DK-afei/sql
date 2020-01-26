USE [11703990404_µËÇÅ];
CREATE TABLE Student_SAG(
Sno CHAR(9) PRIMARY KEY,
Sname CHAR(20) UNIQUE,
Ssex CHAR(2),
Sage SMALLINT,
Sdept CHAR(20),
AG SMALLINT);
INSERT
INTO Student_SAG(Sno,Sname,Ssex,Sage,Sdept,AG)
SELECT Student.Sno,Sname,Ssex,Sage,Sdept,AG
FROM Student LEFT OUTER JOIN SAG ON(Student.Sno=SAG.Sno);
SELECT * FROM Student_SAG;