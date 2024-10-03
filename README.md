SQL Operations for Library Management System
This project demonstrates basic SQL operations, including Data Manipulation Language (DML), Data Definition Language (DDL), Data Control Language (DCL), and Transaction Control Language (TCL) in the context of a library management system.

Table of Contents
Introduction
Prerequisites
Database Schema
Tables
SQL Operations
Data Manipulation Language (DML)
Data Definition Language (DDL)
Data Control Language (DCL)
Transaction Control Language (TCL)
Usage
License
Introduction
This project provides SQL scripts to manage a simple library system. It includes functionalities to insert, update, delete, and retrieve data from tables such as Books, Members, and Loans. Additionally, it demonstrates how to alter the schema of the database, control access, and use transactions for data integrity.

Prerequisites
To run these SQL scripts, you need:

A MySQL or similar SQL-compatible database system.
Access to a database management tool (like MySQL Workbench or command-line SQL client).
Basic understanding of SQL syntax.
Database Schema
The database contains three tables:

Books: Holds information about books in the library.
Members: Stores details of members registered in the library.
Loans: Tracks which member borrowed which book, along with loan and return dates.

Tables

CREATE TABLE Books (
    Book_ID INT PRIMARY KEY AUTO_INCREMENT,
    Title VARCHAR(255),
    Author VARCHAR(255),
    Published_Date DATE
);

CREATE TABLE Members (
    Member_ID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(100),
    Email VARCHAR(100),
    Join_Date DATE
);

CREATE TABLE Loans (
    Loan_ID INT PRIMARY KEY AUTO_INCREMENT,
    Book_ID INT,
    Member_ID INT,
    Loan_Date DATE,
    Return_Date DATE,
    FOREIGN KEY (Book_ID) REFERENCES Books(Book_ID),
    FOREIGN KEY (Member_ID) REFERENCES Members(Member_ID)
);

SQL Operations
Data Manipulation Language (DML)
DML commands are used to manipulate data in the database.

Insert Data:

INSERT INTO Books (Title, Author, Published_Date)
VALUES ('The Catcher in the Rye', 'J.D. Salinger', '1951-07-16');

INSERT INTO Members (Name, Email, Join_Date)
VALUES ('Rocky Kayitare', 'rkayitare@yom.com', CURDATE());

INSERT INTO Loans (Book_ID, Member_ID, Loan_Date, Return_Date)
VALUES (1, 1, CURDATE(), NULL);

Update Data:

UPDATE Books SET Title = 'To Kill a Mockingbird'
WHERE Book_ID = 1;


Delete Data:

DELETE FROM Members WHERE Member_ID = 1;

Retrieve Data (with JOINs):

SELECT Members.Name, Books.Title, Loans.Loan_Date
FROM Loans
JOIN Members ON Loans.Member_ID = Members.Member_ID
JOIN Books ON Loans.Book_ID = Books.Book_ID;

Data Definition Language (DDL)
DDL commands define and manage the structure of the database.

Create Table:

CREATE TABLE Members (
    Member_ID INT PRIMARY KEY,
    Name VARCHAR(100),
    Email VARCHAR(100),
    Join_Date DATE

    
);

Alter Table:
ALTER TABLE Members ADD Phone_Number VARCHAR(20);


Drop Table:

DROP TABLE Members;


Data Control Language (DCL)
DCL commands are used to control access to the database.

Grant Privileges:

GRANT ALL PRIVILEGES ON plsql.* TO 'root'@'localhost';

Transaction Control Language (TCL)
TCL commands are used to manage transactions in the database.

Start Transaction and Commit:

START TRANSACTION;
INSERT INTO Members (Member_ID, Name, Email, Join_Date)
VALUES (2, 'Kankazi Daphrosa', 'kdaph@gmail.com', '2024-10-04');
COMMIT;

Start Transaction and Rollback:

START TRANSACTION;
INSERT INTO Members (Member_ID, Name, Email, Join_Date)
VALUES (3, 'Alice', 'alice@wonderland.com', '2024-04-12');
ROLLBACK;


Savepoint in Transaction:

START TRANSACTION;
INSERT INTO Members (Member_ID, Name, Email, Join_Date)
VALUES (4, 'Bob', 'bob@marley.com', '2024-02-11');
SAVEPOINT savepoint1;
ROLLBACK TO savepoint1;
COMMIT;


Usage

due to difficulties installing ORACLE on my computer I resorted into using MYSQL 
Ensure you have a running instance of MySQL or a compatible database.
Create the necessary tables using the CREATE TABLE statements provided in the DDL section.
Run the DML statements to insert, update, delete, and retrieve data.
Use the DCL and TCL commands to control user access and manage transactions.
License
This project is open-source and available under the MIT License. Feel free to modify and use the scripts as needed


