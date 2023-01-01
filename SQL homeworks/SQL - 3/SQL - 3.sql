Create DATABASE ACADEMY;
USE ACADEMY;
---------------------------------- Curators --------------------------------------
CREATE TABLE Curators(
    [id] int PRIMARY KEY IDENTITY(1,1),
    [Name] nvarchar(max) NOT NULL check([Name] not like N''),
    [Surname] nvarchar(max) NOT NULL check([Surname] not like N''),
)
INSERT INTO Curators(Name,Surname) VALUES(N'Curator 1','Zeynalov')
INSERT INTO Curators(Name,Surname) VALUES(N'Curator 2','Maximov')
INSERT INTO Curators(Name,Surname) VALUES(N'Curator 3','Cameli')
INSERT INTO Curators(Name,Surname) VALUES(N'Curator 4','Acbarli')
INSERT INTO Curators(Name,Surname) VALUES(N'Curator 5','Azimov')
INSERT INTO Curators(Name,Surname) VALUES(N'Curator 6','Mamedli')
SELECT * FROM Curators;
------------------------------ Departments ------------------------------------
CREATE TABLE Departments(
    [id] int PRIMARY KEY IDENTITY(1,1),
    [Financing] money NOT NULL DEFAULT 0 CHECK([Financing]>=0),
    [Name] nvarchar(100) NOT NULL check([Name] not like N'') UNIQUE,
    [FacultyId] int NOT NULL foreign key references Faculties(id),
)
INSERT INTO Departments(Financing,Name,FacultyId) VALUES(240.50,N'Department 1',1)
INSERT INTO Departments(Financing,Name,FacultyId) VALUES(210.20,N'Department 2',2)
INSERT INTO Departments(Financing,Name,FacultyId) VALUES(440.85,N'Department 3',3)
INSERT INTO Departments(Financing,Name,FacultyId) VALUES(600.15,N'Department 4',4)
INSERT INTO Departments(Financing,Name,FacultyId) VALUES(2700.95,N'Department 5',5)
INSERT INTO Departments(Financing,Name,FacultyId) VALUES(2900.25,N'Department 6',6)
SELECT * FROM Departments;
----------------------------- Faculties --------------------------------------
CREATE TABLE Faculties(
    [id] int PRIMARY KEY IDENTITY(1,1),
    [Financing] money NOT NULL CHECK([Financing]>=0) DEFAULT 0,
    [Name] nvarchar(100) NOT NULL check(Name not like N'') UNIQUE,
)
INSERT INTO Faculties(Financing, Name) VALUES(100,N'Faculty 1')
INSERT INTO Faculties(Financing, Name) VALUES(200,N'Faculty 2')
INSERT INTO Faculties(Financing, Name) VALUES(300,N'Faculty 3')
INSERT INTO Faculties(Financing, Name) VALUES(900,N'Faculty 4')
INSERT INTO Faculties(Financing, Name) VALUES(400,N'Faculty 5')
INSERT INTO Faculties(Financing, Name) VALUES(500,N'Faculty 6')
SELECT * FROM Faculties;
---------------------------------- Groups --------------------------------------
CREATE TABLE Groups(
    [id] int PRIMARY KEY IDENTITY(1,1),
    [Name] nvarchar(10) NOT NULL check(Name not like N'') UNIQUE,
    [Year] int NOT NULL CHECK([Year]>=1 AND [Year]<=5),
    [DepartmentId] int NOT NULL foreign key references Departments(id),
)
INSERT INTO Groups(Name,Year,DepartmentId) VALUES(N'FS_4217',5,1)
INSERT INTO Groups(Name,Year,DepartmentId) VALUES(N'FS_3576',2,2)
INSERT INTO Groups(Name,Year,DepartmentId) VALUES(N'FS_4243',3,3)
INSERT INTO Groups(Name,Year,DepartmentId) VALUES(N'FS_4976',2,4)
INSERT INTO Groups(Name,Year,DepartmentId) VALUES(N'FS_4467',3,5)
INSERT INTO Groups(Name,Year,DepartmentId) VALUES(N'FS_4289',5,6)
SELECT * FROM Groups;
----------------------------- GroupsCurators ---------------------------------
CREATE TABLE GroupsCurrators(
    [id] int PRIMARY KEY IDENTITY(1,1),
    [CuratorId] int NOT NULL foreign key references Curators(id),
    [GroupId] int NOT NULL foreign key references Groups(id),
)
INSERT INTO GroupsCurrators(CuratorId, GroupId) VALUES(1,1)
INSERT INTO GroupsCurrators(CuratorId, GroupId) VALUES(2,2)
INSERT INTO GroupsCurrators(CuratorId, GroupId) VALUES(3,3)
INSERT INTO GroupsCurrators(CuratorId, GroupId) VALUES(4,4)
INSERT INTO GroupsCurrators(CuratorId, GroupId) VALUES(5,5)
INSERT INTO GroupsCurrators(CuratorId, GroupId) VALUES(6,6)
SELECT * FROM GroupsCurrators;
------------------------------- GroupsLectures ---------------------------------
CREATE TABLE GroupsLectures(
    [id] int PRIMARY KEY IDENTITY(1,1),
    [GroupId] int NOT NULL foreign key references Groups(id),
    [LectureId] int NOT NULL foreign key references Lectures(id),
)
INSERT INTO GroupsLectures(GroupId, LectureId) VALUES(1,1)
INSERT INTO GroupsLectures(GroupId, LectureId) VALUES(2,2)
INSERT INTO GroupsLectures(GroupId, LectureId) VALUES(3,3)
INSERT INTO GroupsLectures(GroupId, LectureId) VALUES(4,4)
INSERT INTO GroupsLectures(GroupId, LectureId) VALUES(5,5)
INSERT INTO GroupsLectures(GroupId, LectureId) VALUES(6,6)
SELECT * FROM GroupsLectures;
------------------------------- Lectures -----------------------------------
CREATE TABLE Lectures(
    [id] int PRIMARY KEY IDENTITY(1,1),
    [LectureRoom] nvarchar(max) NOT NULL check([LectureRoom] not like N''),
    [SubjectId] int NOT NULL foreign key references Subjects(id),
    [TeacherId] int NOT NULL foreign key references Teachers(id),
)
INSERT INTO Lectures([LectureRoom], [SubjectId], [TeacherId]) VALUES('Lecture 1',1,1)
INSERT INTO Lectures([LectureRoom], [SubjectId], [TeacherId]) VALUES('Lecture 2',2,2)
INSERT INTO Lectures([LectureRoom], [SubjectId], [TeacherId]) VALUES('Lecture 3',3,3)
INSERT INTO Lectures([LectureRoom], [SubjectId], [TeacherId]) VALUES('Lecture 4',4,4)
INSERT INTO Lectures([LectureRoom], [SubjectId], [TeacherId]) VALUES('Lecture 5',5,5)
INSERT INTO Lectures([LectureRoom], [SubjectId], [TeacherId]) VALUES('Lecture 6',6,6)
SELECT * FROM Lectures;
------------------------------ Subjects --------------------------------------
CREATE TABLE Subjects(
    [id] int PRIMARY KEY IDENTITY(1,1),
    [Name] nvarchar(100) NOT NULL check(Name not like N'') UNIQUE,
)
INSERT INTO Subjects([Name]) VALUES(N'Fizika')
INSERT INTO Subjects([Name]) VALUES(N'Ximiya')
INSERT INTO Subjects([Name]) VALUES(N'History')
INSERT INTO Subjects([Name]) VALUES(N'It')
INSERT INTO Subjects([Name]) VALUES(N'Programming')
INSERT INTO Subjects([Name]) VALUES(N'Security')
SELECT * FROM Subjects;
-------------------------------- Teachers ---------------------------------
CREATE TABLE Teachers(
    [id] int PRIMARY KEY IDENTITY(1,1),
    [Salary] money NULL DEFAULT 0 CHECK([Salary]>0),
    [Name] nvarchar(max) NOT NULL check([Name] not like N''),
    [Surname] nvarchar(Max) NOT NULL check(Surname not like N''),
)
INSERT INTO Teachers([Salary],[Name],[Surname]) VALUES(590,N'Andrey',N'Andreyevich')
INSERT INTO Teachers([Salary],[Name],[Surname]) VALUES(650,N'Vichislav',N'Sergeyev')
INSERT INTO Teachers([Salary],[Name],[Surname]) VALUES(700,N'Maksim',N'Hudaverdi')
INSERT INTO Teachers([Salary],[Name],[Surname]) VALUES(1000,N'Aykhan',N'Zeynalov')
INSERT INTO Teachers([Salary],[Name],[Surname]) VALUES(300,N'Mamed',N'Mamedov')
INSERT INTO Teachers([Salary],[Name],[Surname]) VALUES(800,N'Usif',N'Kerimov')
SELECT * FROM Teachers;
---------------------------------Task 1---------------------------------------
Select T.Name,T.Surname,T.Salary,G.Name,G.Year from GroupsLectures
    inner join Lectures L on L.id = GroupsLectures.LectureId
    inner join Teachers T on T.id = L.TeacherId
    inner join Groups G on G.id = GroupsLectures.GroupId;
---------------------------------Task 2---------------------------------------
Select F.Name
FROM Groups
    inner join Departments D on D.id = Groups.DepartmentId
    inner join Faculties F on F.id = D.FacultyId
where D.Financing > F.Financing;
---------------------------------Task 3---------------------------------------
SELECT C.Surname,G.Name FROM GroupsCurrators
    INNER JOIN Groups G on GroupsCurrators.GroupId = G.id
    INNER JOIN Curators C on GroupsCurrators.CuratorId = C.id
---------------------------------Task 4---------------------------------------
SELECT T.Name,t.Surname
FROM GroupsLectures
    inner join Lectures L on L.id = GroupsLectures.LectureId
    inner join Teachers T on T.id = L.TeacherId
    inner join Groups G on G.id = GroupsLectures.GroupId
where G.Name = N'FS_4217';
---------------------------------Task 5---------------------------------------
SELECT T.Surname,F.Name
FROM GroupsLectures
    inner join Lectures L on L.id = GroupsLectures.LectureId
    inner join Teachers T on T.id = L.TeacherId
    inner join Groups G on G.id = GroupsLectures.GroupId
    inner join Departments D on D.id = G.DepartmentId
    inner join Faculties F on F.id = D.FacultyId
---------------------------------Task 6---------------------------------------
SELECT D.Name,G.Name
FROM GroupsLectures
    inner join Groups G on G.id = GroupsLectures.GroupId
    inner join Departments D on D.id = G.DepartmentId
---------------------------------Task 7---------------------------------------
SELECT S.Name
FROM Lectures
    inner join Teachers T on T.id = Lectures.TeacherId
    inner join Subjects S on S.id = Lectures.SubjectId
where T.Name =  'Aykhan';
---------------------------------Task 8---------------------------------------
SELECT D.Name
FROM GroupsLectures
    inner join Lectures L on L.id = GroupsLectures.LectureId
    inner join Subjects S on S.id = L.SubjectId
    inner join Groups G on G.id = GroupsLectures.GroupId
    inner join Departments D on D.id = G.DepartmentId
where S.Name =  'it';
---------------------------------Task 9---------------------------------------
SELECT Groups.Name
FROM Groups
    inner join Departments D on D.id = Groups.DepartmentId
    inner join Faculties F on F.id = D.FacultyId
where F.Name =  'Faculty 3';
---------------------------------Task 10---------------------------------------
SELECT Groups.Name,F.Name
FROM Groups
    inner join Departments D on D.id = Groups.DepartmentId
    inner join Faculties F on F.id = D.FacultyId
where Groups.Year = 5;
---------------------------------Task 11---------------------------------------
SELECT T.Name,S.Name,G.Name
FROM GroupsLectures
    inner join Groups G on G.id = GroupsLectures.GroupId
    inner join Lectures L on L.id = GroupsLectures.LectureId
    inner join Subjects S on S.id = L.SubjectId
    inner join Teachers T on T.id = L.TeacherId
where L.LectureRoom = 'Lecture 3';
