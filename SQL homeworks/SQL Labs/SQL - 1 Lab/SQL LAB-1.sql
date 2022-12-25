CREATE DATABASE Aychan;
USE Aychan;

CREATE TABLE Departments
(
    [id]        int PRIMARY KEY IDENTITY (1,1),
    [Building]  int                  NOT NULL CHECK ([Building] >= 1 AND [Building] <= 5),
    [Financing] money                NOT NULL DEFAULT 0 CHECK ([Financing] > 0),
    [Floor]     int                  NOT NULL CHECK ([Floor] >= 1),
    [Name]      nvarchar(100) UNIQUE NOT NULL check (Name not like N''),
)

INSERT INTO Departments(Building,Financing,Floor,Name) VALUES(3,13945,9,N'Andrey')
INSERT INTO Departments(Building,Financing,Floor,Name) VALUES(3,14957,2,N'Vichislav')
INSERT INTO Departments(Building,Financing,Floor,Name) VALUES(5,37925,5,N'Maksim')
INSERT INTO Departments(Building,Financing,Floor,Name) VALUES(5,27997,7,N'Aykhan')
INSERT INTO Departments(Building,Financing,Floor,Name) VALUES(3,9997,7,N'Samsi')
INSERT INTO Departments(Building,Financing,Floor,Name) VALUES(5,27997,7,N'Gulay')
-- Task 6
SELECT Name FROM Departments
where Building = 5 and Financing < 30000;
-- Task 7
SELECT Name FROM Departments
where Building = 3 and Financing > 12000 and Financing< 15000;
-- Task 9
SELECT Name,Building,Financing FROM Departments
where ((Building = 3 and Financing < 11000) or (Building = 3 and Financing > 25000))
   or ((Building = 5 and Financing < 11000) or (Building = 5 and Financing > 25000));
-- Task 13
SELECT Name,Building FROM Departments
where (Building = 1 or Building = 3 or Building = 8 or Building = 10);
-- Task 15
SELECT Name FROM Departments
where Not (Building = 1 or Building = 3);
-- Task 16
SELECT Name FROM Departments
where (Building = 1 or Building = 3);



CREATE TABLE Diseases
(
    [id]        int PRIMARY KEY IDENTITY (1,1),
    [Name]      nvarchar(100) UNIQUE NOT NULL check (Name not like N''),
    [Severity]  int                  NOT NULL CHECK ([Severity] >= 1) DEFAULT 1,
    [Financing] money                NOT NULL DEFAULT 0 CHECK ([Financing] > 0),
    [Floor]     int                  NOT NULL CHECK ([Floor] >= 1),
)
INSERT INTO Diseases(Name,Severity,Financing,Floor) VALUES(N'Andrey',3,145,9)
INSERT INTO Diseases(Name,Severity,Financing,Floor) VALUES(N'Vichislav',4,257,2)
INSERT INTO Diseases(Name,Severity,Financing,Floor) VALUES(N'Maksim',5,725,5)
INSERT INTO Diseases(Name,Severity,Financing,Floor) VALUES(N'Aykhan',1,610,1)
INSERT INTO Diseases(Name,Severity,Financing,Floor) VALUES(N'Samsi',2,317,2)
-- Task 4
Select Name as 'Name of Disease' from Diseases;
Select Severity as 'Severity of Disease' from Diseases;
-- Task 14
Select Name from Diseases
where not (Severity =1 or Severity=2);



CREATE TABLE Doctors
(
    [id]      int PRIMARY KEY IDENTITY (1,1),
    [Name]    nvarchar(100) NOT NULL check (Name not like N''),
    [Phone]   char(10)      NOT NULL,
    [Premium] money         NOT NULL DEFAULT 0 CHECK ([Premium] > 0),
    [Salary]  money         NOT NULL CHECK ([Salary] > 0),
    [Surname] nvarchar(100) NOT NULL CHECK (Surname not like N''),
)
INSERT INTO Doctors(Name,Phone,Premium,Salary,Surname) VALUES(N'Andrey',N'+34343565',145,932,N'Andreyevich')
INSERT INTO Doctors(Name,Phone,Premium,Salary,Surname) VALUES(N'Vichislav',N'+34343565',257,452,N'Sergeyev')
INSERT INTO Doctors(Name,Phone,Premium,Salary,Surname) VALUES(N'Maksim',N'+34343565',725,543,N'Hudaverdi')
INSERT INTO Doctors(Name,Phone,Premium,Salary,Surname) VALUES(N'Maksim',N'+34343565',725,843,N'Shamsi')
INSERT INTO Doctors(Name,Phone,Premium,Salary,Surname) VALUES(N'Maksim',N'+34343565',725,943,N'Omar')
INSERT INTO Doctors(Name,Phone,Premium,Salary,Surname) VALUES(N'Senan',N'+94346679',895,999,N'Narimanov')
INSERT INTO Doctors(Name,Phone,Premium,Salary,Surname) VALUES(N'Ulker',N'+80344795',1005,893,N'Nizami')
--Task 2
Select Phone,Surname from Doctors;
-- Task 10
SELECT Surname FROM Doctors
where (Premium + Salary) > 1500;
-- Task 11
SELECT Surname FROM Doctors
where (Salary/2) > 3*Premium;
-- Task 17
SELECT Surname FROM Doctors
where Surname like 'N%';


drop table Examinations;

CREATE TABLE Examinations
(
    [id]        int PRIMARY KEY IDENTITY (1,1),
    [DayOfWeek] int                  NOT NULL CHECK ([DayOfWeek] >= 1 AND [DayOfWeek] <= 7 ),
    [StartTime] time                 NOT NULL CHECK ([StartTime] > '8:00' AND [StartTime] < '18:00'),
    [EndTime]   time                 NOT NULL ,
    [Name]      nvarchar(100)        NOT NULL check ([Name] not like N'') UNIQUE,
)
INSERT INTO Examinations(DayOfWeek,StartTime,EndTime,Name) VALUES(1,N'12:00',N'13:00',N'Aykhan')
INSERT INTO Examinations(DayOfWeek,StartTime,EndTime,Name) VALUES(2,N'12:30',N'13:00',N'Maksim')
INSERT INTO Examinations(DayOfWeek,StartTime,EndTime,Name) VALUES(3,N'12:40',N'11:00',N'Anar')
INSERT INTO Examinations(DayOfWeek,StartTime,EndTime,Name) VALUES(3,N'12:40',N'17:00',N'Anar2')
-- Task 12
Select * from Examinations
where [DayOfWeek] <=3;
-- Task 5
Select * from Examinations as E;
Select * from Departments as D;
Select * from Wards as W;


CREATE TABLE Wards
(
    [id]        int PRIMARY KEY IDENTITY (1,1),
    [Building]  int                  NOT NULL CHECK ([Building] >= 1 AND [Building] <= 5),
    [Floor]     int                  NOT NULL CHECK ([Floor] >= 1),
    [Name]      nvarchar(100) UNIQUE NOT NULL check (Name not like N''),
)
INSERT INTO Wards(Building,Floor,Name) VALUES(4,1,'Aykhan')
INSERT INTO Wards(Building,Floor,Name) VALUES(2,5,'Maksim')
INSERT INTO Wards(Building,Floor,Name) VALUES(3,4,'Anar')
INSERT INTO Wards(Building,Floor,Name) VALUES(1,3,'Anar2')
INSERT INTO Wards(Building,Floor,Name) VALUES(5,1,'Anar3')
-- Task 1
SELECT * FROM Wards;
-- Task 3
Select Distinct Floor from Wards;
-- Task 8
SELECT Name FROM Wards
where (Building = 4 or Building = 5) and Floor = 1;
