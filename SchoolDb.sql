
DROP DATABASE IF EXISTS SchoolDb;

CREATE DATABASE SchoolDb IF NOT EXISTS;

USE SchoolDb; 

CREATE TABLE Users (
    id INT AUTO-INCREMENT,
    UserName VARCHAR(255) NOT NULL UNIQUE,
    Password VARCHAR(255) NOT NULL,
    PRIMARY KEY(id)
);

CREATE TABLE Teachers (
    id INT AUTO-INCREMENT,
    FirstName VARCHAR(255) NOT NULL,
    LastName VARCHAR(255),
    Subject VARCHAR(255),
    UserId INT NOT NULL,
    PRIMARY KEY(id)
);

CREATE TABLE Students (
    id INT AUTO-INCREMENT,
    FirstName VARCHAR(255) NOT NULL,
    LastName VARCHAR(255),
    Major VARCHAR(255),
    UserId INT,
    PRIMARY KEY(id)
);

CREATE TABLE Buildings (
    id INT AUTO-INCREMENT,
    Name VARCHAR(255) NOT NULL UNIQUE,
    PRIMARY KEY(id)
);

CREATE TABLE Classrooms (
    id INT AUTO-INCREMENT,
    Name VARCHAR(255) NOT NULL UNIQUE,
    BuildingId INT NOT NULL,
    PRIMARY KEY(id)
);

ALTER TABLE Teachers
ADD FOREIGN KEY (UserId)
REFERENCES Users(id);

ALTER TABLE Students
ADD FOREIGN KEY (UserId)
REFERENCES Users(id);

ALTER TABLE Classrooms
ADD FOREIGN KEY (BuildingId)
REFERENCES Buildings(id);

CREATE TABLE ClassroomsTeachers  (
    TeacherId INT
    ClassroomId INT
    PRIMARY KEY(TeacherId,ClassroomId)
);

CREATE TABLE ClassroomsStudents  (
    StudentId INT
    ClassroomId INT
    PRIMARY KEY(StudentId,ClassroomId)
);

ALTER TABLE ClassroomsTeachers
ADD FOREIGN KEY (TeacherId)
REFERENCES Teachers(id);

ALTER TABLE ClassroomsTeachers
ADD FOREIGN KEY (ClassroomId)
REFERENCES Classrooms(id);

ALTER TABLE ClassroomsStudents
ADD FOREIGN KEY (StudentId)
REFERENCES Students(id);


ALTER TABLE ClassroomsStudents
ADD FOREIGN KEY (ClassroomId)
REFERENCES Classrooms(id);