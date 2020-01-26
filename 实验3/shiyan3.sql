USE test;
SELECT * FROM Student;
SELECT * FROM Course;
SELECT * FROM SC;

SELECT * FROM Student WHERE Sdept='CS';

SELECT Sno,Sname FROM Student
WHERE Sdept='CS' AND Sage NOT BETWEEN 19 AND 21;

SELECT MAX(Sage) Max_Sage FROM Student;

SELECT Sno,Sname FROM Student x
WHERE Sage=
(SELECT MAX(y.Sage)
FROM Student y
WHERE y.Sdept=x.Sdept);


SELECT Sno,Sname FROM Student 
WHERE Sdept='CS' AND Sage=
(SELECT MAX(dept_age) FROM 
(SELECT Sage FROM Student 
WHERE Sdept='CS') AS dept_student(dept_age)) 
UNION
SELECT Sno,Sname FROM Student 
WHERE Sdept='MA' AND Sage=
(SELECT MAX(dept_age) FROM 
(SELECT Sage FROM Student 
WHERE Sdept='MA') AS dept_student(dept_age)) 
UNION
SELECT Sno,Sname FROM Student 
WHERE Sdept='IS' AND Sage=
(SELECT MAX(dept_age) FROM 
(SELECT Sage FROM Student 
WHERE Sdept='IS') AS dept_student(dept_age)) 
UNION
SELECT Sno,Sname FROM Student 
WHERE Sdept='IT' AND Sage=
(SELECT MAX(dept_age) FROM 
(SELECT Sage FROM Student 
WHERE Sdept='IT') AS dept_student(dept_age)) ; 

SELECT COUNT(Sno) cs_num FROM Student
WHERE Sdept='CS';

SELECT Sdept,COUNT(Sno) Sdpet_num  FROM Student
GROUP BY Sdept
ORDER BY Sdpet_num ASC;

SELECT Sdept,AVG(Sage) AVG_Sage  FROM Student
GROUP BY Sdept 
ORDER BY AVG_Sage DESC;

SELECT Cname FROM Course;

SELECT Cname,Ccredit*16 class_hour FROM Course
WHERE Cpno IS NULL;

SELECT SUM(Ccredit*16) sum_class_hour FROM Course
WHERE Cpno IS NULL;

SELECT Sno,COUNT(SC.Cno) cno_num,AVG(SC.Grade) avg_grade,SUM(Course.Ccredit)
FROM SC,Course
GROUP BY Sno;

SELECT Cno,COUNT(Sno) sno_num,AVG(Grade) avg_grade 
FROM SC
GROUP BY Cno;


SELECT sno,COUNT(cno) cno_num, SUM(Ccredit) credit_sum,AVG(grade) avg_grade FROM 
(SELECT Sno,SC.Cno,Grade,Ccredit FROM Course,SC
WHERE Course.Cno=SC.Cno) AS ssss(Sno,Cno,Grade,Ccredit)
GROUP BY sno;


SELECT * FROM Student
WHERE Sno IN(
SELECT Sno
FROM
(SELECT Sno,AVG(Grade) avg_grade FROM
(SELECT DISTINCT Student.Sno,Sname,Course.Cno,Course.Cname,Grade
FROM Student,Course,SC
WHERE Student.Sno=SC.Sno AND SC.Cno=Course.Cno) AS ss(Sno,Sname,Cno,Cname,Grade)
GROUP BY Sno) AS sss(Sno,avg_grade)
WHERE avg_grade>85);




SELECT Sno,AVG(Grade) avg_grade  FROM
(SELECT Student.Sno,Sname,Sage,Sdept,Grade FROM Student,
(SELECT DISTINCT Student.Sno,Grade
FROM Student,SC
WHERE Student.Sno=SC.Sno) AS s_g(Sno,Grade)
WHERE Student.Sno=s_g.Sno) AS sssss(Sno,Sname,Sage,Sdept,Grade)
GROUP BY Sno
HAVING AVG(Grade)>85 
ORDER BY AVG(Grade) ASC;



SELECT * FROM Student
WHERE Sno IN
		(SELECT Sno FROM SC
			GROUP BY Sno 
			HAVING AVG(SC.Grade)>85
		);
SELECT * FROM Course;

SELECT _23.Sno FROM
(SELECT sno_23.Sno,COUNT(Sno) num_23 FROM 
(SELECT Student.Sno FROM Student,SC
WHERE Student.Sno=SC.Sno AND Grade>80) AS sno_23(Sno)
GROUP BY sno_23.Sno
INTERSECT 
SELECT Sno,COUNT(Sno) num FROM SC
GROUP BY Sno) AS _23(Sno,num);

SELECT Student.Sno,Sname FROM Student,dbo.SC
WHERE Student.Sno=SC.Sno AND Cno=1
INTERSECT
SELECT Student.Sno,Sname FROM Student,dbo.SC
WHERE Student.Sno=SC.Sno AND Cno=2;

SELECT * FROM SC;
SELECT DISTINCT Student.Sno FROM Student,SC
WHERE SC.Sno=Student.Sno AND Grade>80;
 
SELECT DISTINCT Student.Sno,Sname FROM Student,SC
WHERE Student.Sno=SC.Sno AND (Cno=1 OR Cno=2);

SELECT Student.Sno,Sname,Grade
FROM Student,SC
WHERE Student.Sno=SC.Sno AND Grade<60 AND cno=
(SELECT Cno FROM Course
WHERE Cname='Êý¾Ý¿â');

SELECT DISTINCT Student.Sno,Sname,Course.Cno,Course.Cname,Grade
FROM Student,Course,SC
WHERE Student.Sno=SC.Sno AND SC.Cno=Course.Cno;

SELECT * FROM Student
WHERE Sno NOT IN
(SELECT Sno FROM SC);

SELECT Sno FROM SC
GROUP BY Sno
HAVING COUNT(Cno)>3;

SELECT Sno,AVG(Grade) avg_grade
FROM SC
GROUP BY Sno;


SELECT Sno
FROM SC
GROUP BY Sno
HAVING AVG(Grade)>80;
