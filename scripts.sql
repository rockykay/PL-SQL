-- DML (Data Manipulation Language)

-- Inserting data into Books
INSERT INTO Books (Title, Author, Published_Date)
VALUES ('The Catcher in the Rye', 'J.D. Salinger', '1951-07-16');

-- Inserting data into Members
INSERT INTO Members (Name, Email, Join_Date)
VALUES ('Rocky Kayitare', 'rkayitare@yom.com', CURDATE());

-- Inserting data into Loans
INSERT INTO Loans (Book_ID, Member_ID, Loan_Date, Return_Date)
VALUES (1, 1, CURDATE(), NULL);

-- Updating data in Books
UPDATE Books SET Title = 'To Kill a Mockingbird'
WHERE Book_ID = 1;

-- Deleting a record from Members
DELETE FROM Members WHERE Member_ID = 1;

-- Selecting data using JOIN between Members, Books, and Loans
SELECT Members.Name, Books.Title, Loans.Loan_Date
FROM Loans
JOIN Members ON Loans.Member_ID = Members.Member_ID
JOIN Books ON Loans.Book_ID = Books.Book_ID;

-- Inserting another record into Members
INSERT INTO Members (Member_ID, Name, Email, Join_Date)
VALUES (1, 'Kayitare Rocky', 'Kayitare@king.com', '2024-01-10');

-- Updating the Email field in Members
UPDATE Members SET Email = 'Rocky@kayitare.com'
WHERE Member_ID = 1;

-- Selecting all fields from Members
SELECT * FROM Members;

-- Deleting a record from Members
DELETE FROM Members WHERE Member_ID = 1;

------------------------------------------------------

-- DDL (Data Definition Language)

-- Creating the Members table
CREATE TABLE Members (
    Member_ID INT PRIMARY KEY,
    Name VARCHAR(100),
    Email VARCHAR(100),
    Join_Date DATE
);

-- Altering the Members table by adding a Phone_Number column
ALTER TABLE Members ADD Phone_Number VARCHAR(20);

-- Dropping the Members table
DROP TABLE Members;

------------------------------------------------------

-- DCL (Data Control Language)

-- Granting privileges to root on plsql database
GRANT ALL PRIVILEGES ON plsql.* TO 'root'@'localhost';

------------------------------------------------------

-- TCL (Transaction Control Language)

-- Starting a transaction and committing after insertion
START TRANSACTION;
INSERT INTO Members (Member_ID, Name, Email, Join_Date)
VALUES (2, 'Kankazi Daphrosa', 'kdaph@gmail.com', '2024-10-04');
COMMIT;

-- Starting a transaction and rolling back after insertion
START TRANSACTION;
INSERT INTO Members (Member_ID, Name, Email, Join_Date)
VALUES (3, 'Alice', 'alice@wonderland.com', '2024-04-12');
ROLLBACK;

-- Starting a transaction with a savepoint
START TRANSACTION;
INSERT INTO Members (Member_ID, Name, Email, Join_Date)
VALUES (4, 'Bob', 'bob@marley.com', '2024-02-11');
SAVEPOINT savepoint1;

-- Rolling back to the savepoint
ROLLBACK TO savepoint1;
COMMIT;
