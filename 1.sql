create database book;
use book;
-- Create tables
CREATE TABLE BOOK (
    Book_id INT PRIMARY KEY,
    Title VARCHAR(100),
    Publisher_Name VARCHAR(100),
    Pub_Year INT
);

CREATE TABLE BOOK_AUTHORS (
    Book_id INT,
    Author_Name VARCHAR(100),
    FOREIGN KEY (Book_id) REFERENCES BOOK(Book_id)
);

CREATE TABLE PUBLISHER (
    Name VARCHAR(100) PRIMARY KEY,
    Address VARCHAR(100),
    Phone VARCHAR(20)
);

CREATE TABLE BOOK_COPIES (
    Book_id INT,
    Programme_id INT,
    No_of_Copies INT,
    PRIMARY KEY (Book_id, Programme_id),
    FOREIGN KEY (Book_id) REFERENCES BOOK(Book_id)
);

CREATE TABLE BOOK_LENDING (
    Book_id INT,
    Programme_id INT,
    Card_No INT,
    Date_Out DATE,
    Due_Date DATE,
    PRIMARY KEY (Book_id, Programme_id, Card_No),
    FOREIGN KEY (Book_id, Programme_id) REFERENCES BOOK_COPIES(Book_id, Programme_id)
);

CREATE TABLE LIBRARY_PROGRAMME (
    Programme_id INT PRIMARY KEY,
    Programme_Name VARCHAR(100),
    Address VARCHAR(100)
);

-- Insert sample data
INSERT INTO BOOK (Book_id, Title, Publisher_Name, Pub_Year) VALUES
(1, 'Book Title 1', 'Publisher 1', 2020),
(2, 'Book Title 2', 'Publisher 2', 2018),
(3, 'Book Title 3', 'Publisher 3', 2015);

INSERT INTO BOOK_AUTHORS (Book_id, Author_Name) VALUES
(1, 'Author 1'),
(2, 'Author 2'),
(3, 'Author 3');

INSERT INTO PUBLISHER (Name, Address, Phone) VALUES
('Publisher 1', 'Address 1', '123-456-7890'),
('Publisher 2', 'Address 2', '987-654-3210');

INSERT INTO LIBRARY_PROGRAMME (Programme_id, Programme_Name, Address) VALUES
(1, 'Main Programme', 'Main St, City 1'),
(2, 'Secondary Programme', 'Second St, City 2');

INSERT INTO BOOK_COPIES (Book_id, Programme_id, No_of_Copies) VALUES
(1, 1, 5),
(2, 1, 3),
(3, 2, 2);

INSERT INTO BOOK_LENDING (Book_id, Programme_id, Card_No, Date_Out, Due_Date) VALUES
(1, 1, 1001, '2024-03-01', '2024-03-15'),
(2, 1, 1002, '2024-03-03', '2024-03-17');



SELECT 
    b.Book_id,
    b.Title,
    b.Publisher_Name,
    GROUP_CONCAT(ba.Author_Name SEPARATOR ', ') AS Authors,
    bc.Programme_id,
    bc.No_of_Copies
FROM 
    BOOK b
JOIN 
    BOOK_AUTHORS ba ON b.Book_id = ba.Book_id
JOIN 
    BOOK_COPIES bc ON b.Book_id = bc.Book_id
GROUP BY 
    b.Book_id, bc.Programme_id;
SELECT 
    Card_No,
    COUNT(*) AS Total_Borrowed
FROM 
    BOOK_LENDING
WHERE 
    Date_Out BETWEEN '2017-01-01' AND '2017-06-30'
GROUP BY 
    Card_No
HAVING 
    COUNT(*) > 3;
DELETE FROM BOOK WHERE Book_id = 1;
DELETE FROM BOOK_AUTHORS WHERE Book_id = 1;
DELETE FROM BOOK_COPIES WHERE Book_id = 1;
DELETE FROM BOOK_LENDING WHERE Book_id = 1;
CREATE TABLE BOOK_BY_YEAR (
    Year INT,
    Book_id INT,
    Title VARCHAR(100),
    Publisher_Name VARCHAR(100),
    PRIMARY KEY (Year, Book_id)
)
PARTITION BY RANGE (Year) (
    PARTITION p2010 VALUES LESS THAN (2011),
    PARTITION p2011 VALUES LESS THAN (2012),
    PARTITION p2012 VALUES LESS THAN (2013),
    PARTITION p2013 VALUES LESS THAN (2014),
    PARTITION p2014 VALUES LESS THAN (2015)
);

SELECT * FROM BOOK_BY_YEAR PARTITION (p2010);


CREATE VIEW AVAILABLE_BOOKS AS
SELECT 
    b.Book_id,
    b.Title,
    b.Publisher_Name,
    bc.Programme_id,
    bc.No_of_Copies
FROM 
    BOOK b
JOIN 
    BOOK_COPIES bc ON b.Book_id = bc.Book_id

