use database_new;

CREATE TABLE Departments
(
    [id]        int PRIMARY KEY IDENTITY (1,1),
    [Financing] money                NOT NULL DEFAULT 0 CHECK ([Financing] > 0),
    [Name]      nvarchar(100) UNIQUE NOT NULL check ([Name] not like N''),
)
INSERT INTO Departments(Financing,Name) VALUES(3945,N'Software Development')
INSERT INTO Departments(Financing,Name) VALUES(14957,N'Hardware Development')
INSERT INTO Departments(Financing,Name) VALUES(37925,N'UI/UX design')
INSERT INTO Departments(Financing,Name) VALUES(27997,N'IT')
INSERT INTO Departments(Financing,Name) VALUES(9997,N'KibergSecurity')


CREATE TABLE Faculties
(
    [id]        int PRIMARY KEY IDENTITY (1,1),
    [Dean]      nvarchar(max)        NOT NULL  CHECK ([Dean] not like N''),
    [Name]      nvarchar(100) UNIQUE NOT NULL check ([Name] not like N''),
)
INSERT INTO Faculties(Dean,Name) VALUES(N'Dean1',N'Computer Science')
INSERT INTO Faculties(Dean,Name) VALUES(N'Dean2',N'IT')
INSERT INTO Faculties(Dean,Name) VALUES(N'Dean3',N'KibergSecurity')
INSERT INTO Faculties(Dean,Name) VALUES(N'Dean4',N'IT engineering')


CREATE TABLE Groups
(
    [id]        int PRIMARY KEY IDENTITY (1,1),
    [Name]      nvarchar(10) UNIQUE NOT NULL check ([Name] not like N''),
    [Rating]   int NOT NULL check ([Rating] >= 1  AND [Rating] <= 5),
    [Year]   int NOT NULL check ([Year] >= 1  AND [Year] <= 5),
)
INSERT INTO Groups(Name,Rating,Year) VALUES(N'Andrey',4,2)
INSERT INTO Groups(Name,Rating,Year) VALUES(N'Vichislav',2,1)
INSERT INTO Groups(Name,Rating,Year) VALUES(N'Maksim',2,5)
INSERT INTO Groups(Name,Rating,Year) VALUES(N'Aykhan',3,5)
INSERT INTO Groups(Name,Rating,Year) VALUES(N'Samsi',4,3)
INSERT INTO Groups(Name,Rating,Year) VALUES(N'Gulay',1,2)


CREATE TABLE Teachers(
	[id] int PRIMARY KEY IDENTITY(1,1),
	[EmploymentDate] date NOT NULL CHECK([EmploymentDate] > '01.01.1990' ),
	[IsAssistant]  bit                  NOT NULL DEFAULT 0,
    [IsProfessor]  bit                  NOT NULL DEFAULT 0,
	[Position]      nvarchar(max) NOT NULL check ([Position] not like N''),
	[Premium] money NOT NULL DEFAULT 0 CHECK([Premium]>=0),
	[Salary] money NULL CHECK([Salary]>0),
	[Name] nvarchar(10) NOT NULL check(Name not like N''),
	[Surname] nvarchar(Max) NOT NULL check(Surname not like N''),
)
INSERT INTO Teachers(EmploymentDate,IsAssistant,IsProfessor,Position,Premium,Salary,Name,Surname) VALUES('01.02.2000',0,1,N'.Net teacher',1145,1590,N'Andrey',N'Andreyevich')
INSERT INTO Teachers(EmploymentDate,IsAssistant,IsProfessor,Position,Premium,Salary,Name,Surname) VALUES('01.03.2010',1,1,N'Java teacher',257,1590,N'Vichislav',N'Sergeyev')
INSERT INTO Teachers(EmploymentDate,IsAssistant,IsProfessor,Position,Premium,Salary,Name,Surname) VALUES('01.04.1990',1,0,N'JavaScript teacher',1725,590,N'Maksim',N'Hudaverdi')
INSERT INTO Teachers(EmploymentDate,IsAssistant,IsProfessor,Position,Premium,Salary,Name,Surname) VALUES('01.04.1990',1,0,N'JavaScript teacher',725,450,N'Victory',N'Hudaverdi')

--Task 1
SELECT * FROM Departments order by id desc ;
--Task 2
Select Name as 'Group Name',Rating as 'Group Rating' from Groups;
--Task 3
Select Surname,(Salary/Premium) * 100,(Salary/(Salary + Premium)) * 100 from Teachers;
--Task 4
Select 'The dean of faculty ' + Faculties.Name + ' is ' + Faculties.Dean from Faculties;
--Task 5
select Surname from Teachers
where (IsProfessor = 1 and (Salary > 1050));
--Task 6
select Name from Departments
where Financing < 11000 or Financing > 25000;
--Task 7
select Name
from Faculties
where not (Name = 'Computer Science');
--Task 8
select Surname,Position
from Teachers
where IsProfessor = 0;
-- Task 9
select Surname,Position,Salary
from Teachers
where IsAssistant = 1 And (Premium > 160 and Premium <550);
-- Task 10
select Surname,Salary
from Teachers
where IsAssistant = 1;
-- Task 11
select Surname,Position
from Teachers
where EmploymentDate < '01.01.2000' ;
-- Task 12
Select
    [Name] as 'Name of Department'
    from Departments
where [Name] <= 'Software Development'
order by [Name];
------------------------------
-- Task 13
select Surname
from Teachers
where Salary+Premium < 1200;
-- Task 14
select Name
from Groups
where Year = 5 and (Rating >= 2 and Rating<=4);
-- Task 15
select Surname
from Teachers
where IsAssistant = 1 and (Salary<550 OR Premium <200);