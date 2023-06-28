create table student
(
studentID INT,
studentName varchar(30),
studentAGE int,
studentHEIGHT FLOAT
)

Select * from student
insert into student values (1,'Krunal',29,5.8)
insert into student values (2,'Vikrant',25,5.8)
insert into student values (3,'RAM',21,5.3)
insert into student values (4,'SHAM',27,5)

SELECT * FROM student
where studentAGE=25
SELECT * FROM student
where studentHEIGHT=5
SELECT * FROM student
where studentAGE <= 27
select * from student
where studentAGE >= 21
select * from student
where studentHEIGHT < 5.3
select * from student
where studentID > 2
select * from student
where studentAGE <> 25
select * from student
where studentAGE in(25,21)
select * from student
where studentAGE between 27 and 29
select * from student
where studentAGE=29 or studentHEIGHT=5.8
SELECT * FROM student
where studentAGE <= 25
and studentHEIGHT <= 5.8
select * from student
where studentName = 'vikrant'
select * from student
where studentName <> 'RAM'
select * from student
where studentName = 'RAM' or studentName = 'Krunal'
select * from student
where studentName in('Krunal','SHAM')
select * from student
where studentName not in('Krunal','SHAM')

--wild card (like)

select * from student
where studentName like 'V%'
or studentName like 'R%'
select * from student
where studentName like '%T'
or studentName like '%L'
select * from student
where studentName like '%an%'
or studentName like '%am%'
select * from student
where studentName like '%k%n%'

insert into student values(5,'HRISHIKESH',27,5.9)
insert into student values(6,'subel',26,5.7)

SELECT * FROM student
where studentName like 's%e%'

Delete from student where studentID=5 or studentID=6

select * from student
where studentName like '_h%'
select * from student
where studentName like '%n_'

--insert into student values (5,'ronak',22)
insert into student values (5,'ronak',22,null)

select * from student
where studentHEIGHT IS NULL
select * from student
where studentHEIGHT IS NOT NULL

Delete from student where studentHEIGHT is null

--decending order

select * from student
order by studentAGE desc

--alter (add or remove column)

select * from student
alter table student add gender char(1)
alter table student drop column gender
alter table student add mobilenumber bigint
alter table student drop column mobilenumber
insert into student values(1,'krunal',29,5.8,9175422995)

--update the row

update student
set mobilenumber =9175422995
where studentID=1

alter table student add DOB int
alter table student drop column DOB
alter table student add DOB date

select * from student
insert into student values (5,'mansi',25,5.4,null,'1997-05-03')
delete from student where studentID = 5
alter table student drop column DOB,mobilenumber

--updation of data

update student
set studentHEIGHT=5.2
where studentID=4
update student
set studentHEIGHT=7,studentAGE=26
where studentID=3
select * from student
alter table student add courseID INT
UPDATE student
set courseID=02
where studentID=2
UPDATE student
set courseID=4
where studentID=3
UPDATE student
set courseID=3
where studentID=4
Update student
set courseID=1
where studentID in (1,4)
update student
set courseID=3
where studentID in (2,3)

select * from student

create table course
(
courseID INT,
courseName varchar(20)
)
insert into course values (1,'powerBI'),(2,'testing'),(4,'paython')
UPDATE course
set courseName='python'
where courseID=4

select * from course

--JOIN 
select * from student
join course on student.courseID=course.courseID

--JOIN FOR SPECIFIC COLUMN STUDENT NAME & COURSE NAME
select studentName,courseName
from student
join course on student.courseID=course.courseID

--INNER JOIN
select studentName,courseName
from student
inner join course on student.courseID=course.courseID

--LEFT JOIN
select studentName,courseName
from student
LEFT JOIN course on student.courseID=course.courseID

--RIGHT JOIN
select studentName,courseName
from student
RIGHT JOIN course on student.courseID=course.courseID

--FULL OUTER JOIN
select studentName,courseName
from student
FULL OUTER JOIN course on student.courseID=course.courseID

--CROSS JOIN
--(SPECIFIC COLUMN DEFINE NOT REQUIRED, WHOLE TABLE WILL BE EXICUTED IN CROSS)

select * from student
CROSS JOIN course

--LEFT JOIN FOR SPECIFIC ROW/DATA
select studentName,courseName
from student
LEFT JOIN course on student.courseID=course.courseID
where courseName is null


--<<<<<<<<<<<<<<<<<<<CONSTRAINTS>>>>>>>>>>>>>>>>>>--
--<<<<<Not null>>>>>--
create table samplenotnull
(
ID INT NOT NULL,
NAME VARCHAR(20) NOT NULL,
AGE INT
)
SELECT * FROM samplenotnull
insert into samplenotnull values (1,'mahesh',25)
insert into samplenotnull values (2,null,26)

--<<<<<<<<<<<<UNIQUE>>>>>>>>>>>
CREATE TABLE SAMPLEUNIQUE
(
ID INT NOT NULL UNIQUE,
NAME VARCHAR (20) NOT NULL,
AGE INT
)
insert into SAMPLEUNIQUE values (1,'mahesh',25)
insert into SAMPLEUNIQUE values (1,'KK',26)
SELECT * FROM SAMPLEUNIQUE


--<<<<<<<<CHECK>>>>>>>>>---
--EXP 1)
CREATE TABLE SAMPLECHECK
(
ID INT NOT NULL CHECK(ID>3),
NAME VARCHAR (20),
AGE INT
)
INSERT INTO SAMPLECHECK VALUES (2,'KRUNAL',29)
INSERT INTO SAMPLECHECK VALUES (4,'MRUNAL',25)
SELECT * FROM SAMPLECHECK
--EXP 2)
CREATE TABLE SAMPLECHECKTESTEMAIL
(
ID INT NOT NULL,
NAME VARCHAR (20),
EMAILID VARCHAR (30) CHECK (EMAILID LIKE '%@GMAIL.COM'),
AGE INT
)
INSERT INTO SAMPLECHECKTESTEMAIL VALUES (1,'KRUNAL','KRUNAL.KENE@GMAIL.COM',29)
INSERT INTO SAMPLECHECKTESTEMAIL VALUES (2,'MRUNAL','MRUNAL.KENE@YMAIL.COM',27)
SELECT * FROM SAMPLECHECKTESTEMAIL

--<<<<DEFAULT>>>>
CREATE TABLE SAMPLEDEFAULT
(
ID INT NOT NULL,
NAME VARCHAR (20) NOT NULL,
AGE INT DEFAULT 23
)
SELECT * FROM SAMPLEDEFAULT
INSERT INTO SAMPLEDEFAULT (ID,NAME,AGE) VALUES (1,'KRUNAL',29)
INSERT INTO SAMPLEDEFAULT (ID,NAME) VALUES (2,'KRUNAL'),(3,'MRUNAL')
DELETE FROM SAMPLEDEFAULT WHERE AGE =23

--APPLYING DEFAULT CONSTRAINT TO NAME AS WELL IN CURRENT TABLE
ALTER TABLE SAMPLEDEFAULT ADD CONSTRAINT DF_NAME DEFAULT 'ABC' FOR NAME
INSERT INTO SAMPLEDEFAULT (ID) VALUES(5)
INSERT INTO SAMPLEDEFAULT (ID,NAME) VALUES(6,'MAN')
ALTER TABLE SAMPLEDEFAULT drop CONSTRAINT DF_NAME

--PRIMARY KEY---
Create table department
(
ID INT PRIMARY KEY,
NAME VARCHAR (30)
)
SELECT * FROM department
INSERT INTO department VALUES (01,'IT')
INSERT INTO department VALUES (02,'HR')
INSERT INTO department VALUES (0,'FINANCE')
INSERT INTO department VALUES (2,'FINANCE')
INSERT INTO department VALUES (NULL,'IT')

--FORIGN KEY--
CREATE TABLE EMPLOYEE
(
EMPLOYEEID INT,
EMPLOYEENAME VARCHAR(30),
EMPLOYEEAGE INT,
EMPLOYEEDEPARTMENTID INT REFERENCES department(ID)
)

DROP TABLE EMPLOYEE
SELECT * FROM department
SELECT * FROM EMPLOYEE
INSERT INTO EMPLOYEE VALUES (1,'ROHIT',28,2)
INSERT INTO EMPLOYEE VALUES (2,'KK',29,1)
INSERT INTO EMPLOYEE VALUES (3,'RAHUL',25,2)
INSERT INTO EMPLOYEE VALUES (4,'RAHUL',24,NULL)

--FORIGN KEY ALWAYS TAKES REFERENCE OF PRIMARY KEY, THE VALUES WILL BE TAKEN FROM 

--PRIMARYKEY TABLE. IT CAN BE REPETED AND NULL TOO--

--SELF JOIN--USING ALIAS--

create table EmployeeSJ
(
EmpID int,
EmpName varchar(20),
ManID int
)
insert into EmployeeSJ values(1,'Rohit', 0),(2,'Neha', 1),(3,'Manish', 1)
select * from EmployeeSJ
select emp.EmpName as Employee, man.EmpName as Manager
from EmployeeSJ as emp
left join EmployeeSJ as man on emp.ManID = man.EmpID

--union and union all--
create table test1(ID int)
create table test2(ID int)
insert into test1 values (1),(2),(2),(3),(4)
insert into test2 values (2),(3),(4),(3),(5)
select * from test1
select * from test2
select * from test1
union all
select * from test2
select * from test1
union
select * from test2

---Views--- (CODE WHEN WE WANT TO CHECK THE PERTICULAR THING FROM A TABLE)(**WE AVOID TO UPDATE THE TABLE IN VIEW**)
select * from student
create view VWstudent
as
select studentName, studentAGE from student
select * from VWstudent
WHERE studentAGE<=26
UPDATE VWstudent
set studentAGE=24
where studentName='RAM'
CREATE VIEW VWstudentcourse
as
select studentName,coursename
from student
LEFT JOIN COURSE ON STUDENT.courseID = COURSE.courseID
select * from VWstudentcourse
SELECT * FROM course
SELECT * FROM student

--AVOID DOING BELOW UPDATIONS IN THE VIEW COMMAND---
UPDATE VWstudentcourse
SET courseName = 'TESTING'
WHERE studentName = 'RAM'
UPDATE VWstudentcourse
SET courseName = 'TESTING'
WHERE studentName = 'SHAM'

-- STORE PROCEDURE----
SELECT * FROM department
SELECT * FROM Employee
CREATE PROCEDURE SPGETEMPLOYEE
as
begin
select * from Employee
left join department on EMPLOYEEDEPARTMENTID = ID
END
EXEC SPGETEMPLOYEE
CREATE PROCEDURE SPGETSTUDENT (@STUDID INT)
AS
BEGIN
SELECT * FROM student
WHERE studentID= @STUDID
END
EXEC SPGETSTUDENT 2
CREATE PROCEDURE SPGETSTUDENT2 (@STUDID INT, @AGE INT=25)
AS
BEGIN
SELECT * FROM student
WHERE studentID=@STUDID OR studentAGE=@AGE
end
exec SPGETSTUDENT2 2,27 
EXEC SPGETSTUDENT2 1 
--IT WILL GIVE ROW WITH ID=2, AND ALL ROW WITH AGE=27
-- IT WILL GIVE ROW WITH ID=1 & ALL THE ROW WITH AGE BY DEFAULT 25
SELECT * FROM student
CREATE PROCEDURE SPUPDATESTUDAGE (@STUDID INT, @STUDAGE INT)
AS
BEGIN
UPDATE student
SET studentAGE=@STUDAGE
WHERE studentID=@STUDID
END
EXEC SPUPDATESTUDAGE 2,28
EXEC SPUPDATESTUDAGE 3,26

--SUBQUERY--
create table EmpSal
(
EmpName varchar(30),
salary bigint,
ID int
)
select * from EmpSal
Insert into EmpSal values ( 'Shiv',100,1)
Insert into EmpSal values ( 'Raju',150,2)
Insert into EmpSal values ( 'XYZ',200,3)
Insert into EmpSal values ( 'Sham',200,4)
create table EmpDetails
(
IDfk int,
PhoneNo int,
Address Varchar(20)
)
select * from EmpDetails
Insert into EmpDetails values (1,956050,'mumbai')
Insert into EmpDetails values (2,98452,'PUNE')
Insert into EmpDetails values (3,562545,'Nashik')
Insert into EmpDetails values (4,211223,'Nashik')


Select * from EmpDetails --OUTER QUERY
where
IDfk in (select id from EmpSal where Salary > 150) --- Inner query
-
-------CTE (COMMON TABLE EXPRESSION)------
---(IF YOU WANT TO GENERATE TEMPERORY FILE or TABLE (which allow to update it without disturbing parent table) FOR THE CURRENT AVAILABLE FILE OR TABLE)
SELECT * FROM (SELECT studentName,studentAGE FROM student) ABC
SELECT * FROM ABC
SELECT * FROM student
WITH ABC
AS (SELECT studentName,studentAGE FROM student)
SELECT * FROM ABC
with CTESTUD AS
(SELECT studentName,studentAGE FROM student)
SELECT SUM(studentAGE) from CTESTUD
SELECT * FROM CTESTUD -- DUE TO WE EXICUTED CTSTUD FOR "SUM" WE CAN NOT USE IT FOR 
SELECT*)
WITH CTESTUD1 (studentName,studentAGE,CURRENTDATE)
AS (SELECT studentName,studentAGE,GETDATE() FROM student)
select * from CTESTUD1
WITH CTESTUD2 AS
(SELECT studentName,studentAGE,GETDATE() AS CURRENTDATE FROM student)
SELECT * FROM CTESTUD2

--- TEMPERORY TABLE---
---1) LOCAL- # 
CREATE TABLE #LOCALTEMPTABLE
(
ID INT IDENTITY (1,1),
NAME VARCHAR(20)
)
INSERT INTO #LOCALTEMPTABLE VALUES ('JOHN'),('JHONY'),('JANARDHAN'),('KK'),('SUBEL')
SELECT * FROM #LOCALTEMPTABLE
TRUNCATE TABLE #LOCALTEMPTABLE

---2)GLOBAL- ##
CREATE TABLE ##GLOBALTEMPTABLE
(
ID INT IDENTITY (1,1),
NAME VARCHAR(20)
)
INSERT INTO ##GLOBALTEMPTABLE VALUES ('JOHN'),('JHONY'),('JANARDHAN'),('KK'),('SUBEL')
SELECT * FROM ##GLOBALTEMPTABLE

---INLINE WITH SUB QUERY & CTE---
CREATE TABLE ##STUD
(
NAME VARCHAR(30),
STUDAGE INT
)
INSERT INTO ##STUD 
SELECT studentName,studentAGE FROM student
SELECT * FROM ##STUD
SELECT * FROM student

--create temperory from existing table---
select * into ##student from student
select studentName, studentHEIGHT into ##student1 FROM student
select * from ##student
select * from ##student1

---updating table based on another table values--
select * from student
select * from course
alter table student add studentcourse varchar(20)
select * from student S
left join course C ON S.courseID=C.courseID
UPDATE S
SET studentcourse=courseName from student S
LEFT JOIN course C on S.courseID=C.courseID

----WINDOW FUCNTION----
--1) AGGREGATE (SUM, AVG, MIN., MAX., COUNT)
SELECT * FROM student
select AVG (studentAGE) from student
select MIN (studentAGE) as MINAVG from student
SELECT SUM (studentAGE) as sumage from student
select COUNT(studentName) as coountname from student

--2) GROUP BY
SELECT studentcourse, AVG (studentAGE) from student
group by studentcourse
SELECT studentcourse, AVG (studentAGE) as AVGAGE from student
group by studentcourse

--DENSE RANKING--
SELECT * , DENSE_RANK() OVER (ORDER BY studentAGE desc) AS RANKNAME FROM student
select *, DENSE_RANK() over (partition by studentcourse order by studentAGE) AS AGERANK 
from student
select * FROM student
UPDATE student
set studentAGE=24
where studentName = 'Vikrant'

---RANK---
SELECT * , RANK() OVER (ORDER BY studentAGE desc) AS RANKNAME FROM student
select *, RANK() over (partition by studentcourse order by studentAGE) AS AGERANK from
student
select * FROM student

--row numberselect *, ROW_NUMBER () over (order by studentAGE) as uniqueno from student
select *, ROW_NUMBER () over (partition by studentcourse order by studentAGE) as
uniqueno1 from student
select *, ROW_NUMBER () over (partition by studentcourse order by studentHEIGHT desc) as
uniqueheight from student

--DATE TIME FUNCTIONS---
select * from student 
alter table student add DOB datetime
update student set DOB='1992-11-07' WHERE studentID=1
update student set DOB='1998-11-06' WHERE studentID=2
update student set DOB='1995-1-08' WHERE studentID=3
update student set DOB='1998-5-07' WHERE studentID=4

---GETDATE--
select GETDATE ()
--datepart-- (date part, date)
select *,
DATEPART(YYYY,DOB) AS birthyear,
DATEPART(MM,DOB) AS Birthmonth,
DATEPART(DD,DOB) AS birthday,
DATEPART(WEEKDAY,DOB) as BIRTHWD
From student
---date add--
select *,
DATEADD(month,13,DOB) as birthday,
DATEADD(day,15,DOB) AS birthday1,
DATEADD(year,2,DOB) as birthday2,
DATEADD(YEAR,-1,DOB) AS BIRTHDAY3
FROM student

--DATE DIFFERENCE---
SELECT *,
DATEDIFF(YEAR,DOB,GETDATE()) AS AGEYEAR,
DATEDIFF(MONTH,DOB,GETDATE()) AS AGEMONTH,
DATEDIFF(DAY,DOB,GETDATE()) AS AGEDAY
FROM student
--DATEFROMPART-- (YEAR, MONTH, DAY)
SELECT DATEFROMPARTS (2025,03,05)
--CONVERT(DATA TYPE (LEGNTH, EXPRESSION, STYLE))
SELECT *, CONVERT (DATE,DOB) AS DT FROM student ---(IT DISPLAY ONLY DATE FROM DOB)
SELECT CONVERT (date, GETDATE(),111)
SELECT CONVERT (VARCHAR, GETDATE(),111)
SELECT CONVERT (VARCHAR, GETDATE(),110)
SELECT CONVERT (VARCHAR, GETDATE(),109)
SELECT CONVERT (VARCHAR, GETDATE(),112)
SELECT CONVERT (CHAR, GETDATE(),109)
SELECT CONVERT (date, GETDATE(),109)
SELECT CONVERT (date, GETDATE(),111)
SELECT CONVERT (date, GETDATE(),111) AS KPK FROM student
SELECT*, CONVERT (date, GETDATE(),111) AS KPK FROM student
SELECT GETDATE()
--format (date, formatstring)
select *, FORMAT (DOB,'MMMM-YY') AS DT FROM student
select *, FORMAT (DOB,'MMMM-yyyy') AS DT FROM student
select *, FORMAT (DOB,'yyyy-MMMM') AS DT FROM student
--CASE "WHEN"--
select * from student
select*,
case when studentAGE<25 AND studentName like 'R%' then 'A'
WHEN studentAGE<28 then 'B'
ELSE 'C'
END AS ABC FROM student