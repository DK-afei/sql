use [11703990404_����];
CREATE TABLE Course(
Cno CHAR(4) PRIMARY KEY,
Cname CHAR(40) NOT NULL,
Cpno CHAR(4),
Ccredit SMALLINT,
FOREIGN KEY(Cpno) REFERENCES Course(Cno));
SELECT *FROM Course;