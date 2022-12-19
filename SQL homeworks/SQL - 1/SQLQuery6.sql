USE ACADEMY;
CREATE DATABASE ACADEMY;
CREATE TABLE Groups(
	[id] int PRIMARY KEY IDENTITY(1,1),
	[Name] nvarchar(10) NOT NULL check(Name not like N'') UNIQUE,
	[Raiting] int NOT NULL CHECK([Raiting]>=0 AND [Raiting]<=5),
	[Year] int NOT NULL CHECK([Year]>=1 AND [Year]<=5),
)

INSERT INTO Groups(Name,Raiting,Year) VALUES(N'FS_4217',3,1)
INSERT INTO Groups(Name,Raiting,Year) VALUES(N'FS_4218',2,2)
INSERT INTO Groups(Name,Raiting,Year) VALUES(N'FS_4219',5,4)

SELECT * FROM Groups;
----------------------------------------------------------------------------------
CREATE TABLE Departments(
	[id] int PRIMARY KEY IDENTITY(1,1),
	[Financing] money NOT NULL DEFAULT 0 CHECK([Financing]>=0),
	[Name] nvarchar(10) NOT NULL check(Name not like N'') UNIQUE,
)
INSERT INTO Departments(Financing,Name) VALUES(20.50,N'Someone3')
INSERT INTO Departments(Financing,Name) VALUES(21.20,N'Someone4')
INSERT INTO Departments(Financing,Name) VALUES(24.75,N'Someone5')

SELECT * FROM Departments; 
----------------------------------------------------------------------------------
CREATE TABLE Faculties(
	[id] int PRIMARY KEY IDENTITY(1,1),
	[Name] nvarchar(10) NOT NULL check(Name not like N'') UNIQUE,
)
INSERT INTO Faculties(Name) VALUES(N'Andrey')
INSERT INTO Faculties(Name) VALUES(N'Vichislav')
INSERT INTO Faculties(Name) VALUES(N'Maksim')

SELECT * FROM Faculties;
------------------------------------------------------------------------------------
CREATE TABLE Teachers(
	[id] int PRIMARY KEY IDENTITY(1,1),
	[EmploymentDate] date NOT NULL CHECK([EmploymentDate] > '01.01.1990' ),
	[Premium] money NOT NULL DEFAULT 0 CHECK([Premium]>=0),
	[Salary] money NULL DEFAULT 0 CHECK([Salary]>0),
	[Name] nvarchar(10) NOT NULL check(Name not like N''),
	[Surname] nvarchar(Max) NOT NULL check(Surname not like N''),
)

INSERT INTO Teachers(EmploymentDate,Premium,Salary,Name,Surname) VALUES('01.02.2000',145,590,N'Andrey',N'Andreyevich')
INSERT INTO Teachers(EmploymentDate,Premium,Salary,Name,Surname) VALUES('01.03.2010',257,590,N'Vichislav',N'Sergeyev')
INSERT INTO Teachers(EmploymentDate,Premium,Salary,Name,Surname) VALUES('01.04.1990',725,590,N'Maksim',N'Hudaverdi')

SELECT * FROM Teachers;