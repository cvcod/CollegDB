
IF EXISTS (SELECT * FROM sys.databases WHERE name = 'College')
 DROP DATABASE College
 GO

create database College
Go

Use College
Go

create table Students(
ID int identity(1,1) Not Null CONSTRAINT PK_Students PRIMARY KEY CLUSTERED, 
FName varchar(20) Not Null, LName varchar(20) Not Null, SSN int Not Null, 
StreetAddress varchar(50) Not Null, City varchar(20), StateAbbr char(2) Not Null, Zip int Not Null, Phone# int Not Null
);

create table Classes(
ID int identity(1,1) Not null CONSTRAINT PK_Classes PRIMARY KEY CLUSTERED, 
Title varchar(20) Not Null, Number int Not Null, Department varchar(20) Not Null, 
Students_ID int Not Null CONSTRAINT FK_Classes_Students FOREIGN KEY (Students_ID) REFERENCES dbo.Students (ID)
);

create table Scores(
ID int identity(1,1) Not null CONSTRAINT PK_Scores PRIMARY KEY CLUSTERED, 
ScoreType varchar(10) Not Null, ScoreDescription char(1) Not Null, DateAssigned datetime Not Null,
DateDue datetime Not Null, DateSubmitted datetime Not Null, PointsEarned int Not Null, PointsPossible int Not Null,
Classes_ID int Not Null CONSTRAINT FK_Scores_Classes FOREIGN KEY (Classes_ID) REFERENCES dbo.Classes (ID)
);



insert into Students(FName, LName, SSN, StreetAddress, City, StateAbbr, Zip, Phone#)
values ('Std1First', 'Std1Last', 111111111, '1 Street1', 'City1', 'ST', 11111, 1011111111 ),
       ('Std2First', 'Std2Last', 222222222, '2 Street2', 'City2', 'ST', 22222, 2022222222 ), 
	   ('Std3First', 'Std3Last', 333333333, '3 Street3', 'City3', 'ST', 33333, 2033333333 );

insert into Classes(Title, Number, Department, Students_ID)
values ('Algebra1', 101, 'Math', 1),
       ('History1', 102, 'Social Studies', 1),
	   ('Chemistry1', 103, 'Science', 3);

insert into Scores(ScoreType, ScoreDescription, DateAssigned, DateDue, DateSubmitted,
                    PointsEarned, PointsPossible, Classes_ID )
values ('HW', 'A', '11/09/2018', '11/15/2018', '11/11/2018', 19, 20, 1),
       ('quiz', 'B', '11/13/2018', '11/17/2018', '11/16/2018', 8, 10, 2),
	   ('exam', 'C', '11/19/2018', '11/19/2018', '11/19/2018', 75, 100, 3);
      














