USE test;
--CREATE TABLE SAG(
--Sno CHAR(9),
--AG SMALLINT,
--PRIMARY KEY (Sno),
--FOREIGN KEY(Sno) REFERENCES Student(Sno)
--);
--INSERT
--INTO SAG(Sno,AG)
--SELECT Sno,AVG(Grade)
--FROM SC
--GROUP BY Sno;
SELECT * FROM SAG;

--CREATE TABLE Student_SAG(
--Sno CHAR(9) PRIMARY KEY,
--Sname CHAR(20) UNIQUE,
--Ssex CHAR(2),
--Sage SMALLINT,
--Sdept CHAR(20),
--AG SMALLINT);
--INSERT
--INTO Student_SAG(Sno,Sname,Ssex,Sage,Sdept,AG)
--SELECT Student.Sno,Sname,Ssex,Sage,Sdept,AG
--FROM Student LEFT OUTER JOIN SAG ON(Student.Sno=SAG.Sno);
SELECT * FROM Student_SAG;



--CREATE TABLE SDG(
--Sdept CHAR(15),
--Avg_Grade SMALLINT);
--INSERT
--INTO SDG(Sdept,Avg_Grade)
--SELECT Student_SAG.Sdept,AVG(AG)
--FROM Student_SAG
--GROUP BY Student_SAG.Sdept;
SELECT * FROM SDG;
