create database Company_Database

create table Employee(
SSN int primary key,
Fname nvarchar(20) not null,
Lname nvarchar(20),
Mname nvarchar(20) not null,
Gender char(1),
BirthDate date,
SupervisorID int,
foreign key(SupervisorID) references Employee(SSN)
);

create table Department (
DNUM int primary key,
DName varchar(100) not null,
ManagerHiredate date not null,
MangerSSN int,
foreign key(MangerSSN) references Employee(SSN)
);

create table DepartmentLocation(
DeptLocation varchar(100),
DNUM int,
foreign key(DNUM) references Department(DNUM),
primary key(DNUM,DeptLocation)
);

create table Project(
PNumber int primary key,
Pname varchar(100) not null,
Plocation varchar(100),
PCity varchar(100),
BelongsDNUM int,
foreign key(BelongsDNUM) references Department(DNUM)
);

create table WorkOn(
workingHours decimal(5,2) not null,
ProjectNumber int,
EmployeeSSN int,
foreign key(ProjectNumber) references Project(PNumber),
foreign key(EmployeeSSN) references Employee(SSN),
primary key(ProjectNumber,EmployeeSSN)
);

create table EmployeeDependent(
DependentName nvarchar(50) not null,
BirthDate date,
Gender char(1),
DepSSN int,
foreign key (DepSSN) references Employee(SSN),
primary key(DepSSN, DependentName)
);

alter table Employee
add DNUM int foreign key references Department(DNUM)













