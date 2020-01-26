USE test;
CREATE TABLE Student(
Sno CHAR(9) PRIMARY KEY,
Sname CHAR(20) UNIQUE,
Ssex CHAR(2),
Sage SMALLINT,
Sdept CHAR(20));
INSERT INTO Student
VALUES
('201215121','����','��',20,'CS'),
('201215122','����','Ů',19,'CS'),
('201215123','����','Ů',18,'MA'),
('201215124','����','��',19,'IS'),
('201730702','����','��',20,'IT');
select *from Student;
CREATE TABLE Course(
Cno CHAR(4) PRIMARY KEY,
Cname CHAR(40) NOT NULL,
Cpno CHAR(4),
Ccredit SMALLINT,
FOREIGN KEY(Cpno) REFERENCES Course(Cno));
INSERT INTO Course
VALUES
(1,'���ݿ�',5,4),
(2,'��ѧ',null,2),
(3,'��Ϣϵͳ',1,4),
(4,'����ϵͳ',6,3),
(5,'���ݽṹ',7,4),
(6,'���ݴ���',null,2),
(7,'PASCAL',6,4),
(8,'Ӣ��',3,2);
select *from Course;
ALTER TABLE Course
ADD FOREIGN KEY(Cpno)
REFERENCES Course(Cno);
CREATE TABLE SC(
Sno CHAR(9),
Cno CHAR(4),
Grade SMALLINT,
PRIMARY KEY (Sno,Cno),
FOREIGN KEY(Sno) REFERENCES Student(Sno),
FOREIGN KEY (Cno) REFERENCES Course(Cno)
);
INSERT INTO SC
VALUES
('201215121',1,92),
('201215121',2,85),
('201215121',3,88),
('201215122',2,90),
('201215122',3,80),
('201730702',8,88);
select *from SC;