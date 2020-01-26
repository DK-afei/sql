--CREATE VIEW V_IS (Sno,Sname,Ssex,Sage,Sdept) AS
--SELECT Sno,Sname,Ssex,Sage,Sdept FROM Student
--WHERE Sdept='IS';
--SELECT * FROM V_IS;

--CREATE VIEW V_S_C_G  (Sno,Sname,Cno,Cname,Grade) AS 
--SELECT Student.Sno,Sname,Course.Cno,Cname,Grade
--FROM Student,Course,SC
--WHERE Student.Sno=SC.Sno AND Course.Cno=SC.Cno;
--SELECT * FROM V_S_C_G;

--CREATE VIEW V_NUM_AVG (dept_num,avg_age) AS
--SELECT COUNT(Sno) dept_num,AVG(Sage) avg_age
--FROM Student
--GROUP BY Sdept;
--SELECT * FROM V_NUM_AVG;

--CREATE VIEW V_YEAR (Sname,Sbirthday) AS
--SELECT Sname,2019-Sage Sbirthday
--FROM Student;
--SELECT * FROM V_YEAR;

--CREATE VIEW V_AVG_C_G (cno,sno_num,avg_grade) AS 
--SELECT cno,COUNT(Cno) sno_num,AVG(Grade) avg_grade
--FROM SC
--GROUP BY Cno;
--SELECT * FROM V_AVG_C_G;

--CREATE VIEW V_AVG_S_G (Sno,cno_num,avg_grade) AS 
--SELECT Sno,COUNT(Sno) cno_num,AVG(Grade) avg_grade
--FROM SC
--GROUP BY Sno;
--SELECT * FROM V_AVG_S_G;


--SELECT  DISTINCT V_S_C_G.Sno,V_S_C_G.Sname,avg_grade 
--FROM V_S_C_G,V_AVG_S_G
--WHERE V_S_C_G.Sno=V_AVG_S_G.Sno AND avg_grade>80;



--CREATE VIEW V_S_C_G_up_avg (Sno,Sname,Cno,Cname,Grade ) AS 
--SELECT Sno,Sname,Cno,Cname,Grade 
--FROM V_S_C_G x
--WHERE Grade>
--(SELECT avg_grade FROM V_AVG_C_G y
--WHERE x.Cno=y.Cno);
--SELECT * FROM V_S_C_G_up_avg;

--CREATE VIEW V_S_C_G_up_avg_sno (Sno) AS  
--SELECT Sno
--FROM V_S_C_G_up_avg x
--GROUP BY Sno
--HAVING COUNT(Cno)=(
--SELECT  COUNT(Cno)
--FROM V_S_C_G y
--GROUP BY y.Sno
--HAVING x.Sno=y.Sno);
--SELECT * FROM V_S_C_G_up_avg_sno;

--SELECT Sno,Sname,Cno,Grade FROM V_S_C_G
--WHERE V_S_C_G.Sno IN( 
--SELECT Sno FROM V_S_C_G_up_avg_sno);
--SELECT * FROM dbo.V_S_C_G;

--CREATE VIEW V_S_C_G_D  (Sno,Sname,avg_grade,Sdept) AS 
--SELECT  DISTINCT V_S_C_G.Sno,V_S_C_G.Sname,avg_grade,Sdept 
--FROM V_S_C_G,V_AVG_S_G,Student
--WHERE V_S_C_G.Sno=V_AVG_S_G.Sno AND V_S_C_G.Sno=Student.Sno;
--SELECT * FROM V_S_C_G_D;

--SELECT Sdept,COUNT(Sno) sno_num_80
--FROM V_S_C_G_D
--WHERE avg_grade>80
--GROUP BY Sdept
--ORDER BY sno_num_80 DESC;

--SELECT * FROM Student;
--UPDATE V_IS
--SET Sname='201215123_ÍõÃô'
--WHERE Sno='201215123';
--UPDATE V_IS
--SET Sname='201215124_ÕÅÁ¢'
--WHERE Sno='201215124';
--SELECT * FROM V_IS;

--INSERT
--INTO V_IS
--VALUES  ( 'S12', -- Sno - char(9)
--          'YAN XI', -- Sname - char(20)
--          'ÄÐ', -- Ssex - char(2)
--          19, -- Sage - smallint
--          'IS'  -- Sdept - char(20)
--          );
--SELECT * FROM V_IS;
--SELECT * FROM Student;

--INSERT
--INTO V_IS
--VALUES  ( 'S13', -- Sno - char(9)
--          'YANXI', -- Sname - char(20)
--          'ÄÐ', -- Ssex - char(2)
--          19, -- Sage - smallint
--          'MA'  -- Sdept - char(20)
--          );
--SELECT * FROM V_IS;
--SELECT * FROM Student;

--DELETE 
--FROM V_IS
--WHERE Sno='S12';
--SELECT * FROM V_IS;
--SELECT * FROM Student;

--DELETE 
--FROM V_IS
--WHERE Sno='S13';
--SELECT * FROM V_IS;
--SELECT * FROM Student;


--SELECT * FROM V_S_C_G;
--UPDATE V_S_C_G
--SET Sname='201730702_µËÇÅ'
--WHERE Sno='201730702';
--SELECT * FROM V_S_C_G;
--SELECT * FROM Student;


--SELECT * FROM V_AVG_S_G;
--UPDATE V_AVG_S_G
--SET avg_grade=90
--WHERE Sno='201730702';
--SELECT * FROM V_AVG_S_G;
--SELECT * FROM Student;

