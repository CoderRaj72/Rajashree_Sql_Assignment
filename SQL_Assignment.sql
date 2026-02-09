CREATE DATABASE customersdb;
USE customersdb;

CREATE TABLE Customers (
    customerID INT PRIMARY KEY,
    firstname VARCHAR(50),
    lastname VARCHAR(50),
    country VARCHAR(50),
    age INT CHECK (age BETWEEN 0 AND 99),
    phone VARCHAR(15)
);

INSERT INTO Customers(customerID, firstname, lastname, country, age, phone)
VALUES
(1, 'John', 'Bianchi', 'Italy', 34, '3798967769'),
(2, 'Aiko', 'Tanaka', 'Japan', 32, '3690887089'),
(3, 'Carlos', 'Gomez', 'Spain', 35, '4643275436'),
(4, 'Sofia', 'Muller', 'Germany', 25, '4636774325'),
(5, 'Ethan', 'Johnson', 'USA', 36, '6786708656');

select * from customers;

create table sales(
orderID  int,
ordernumber int,
product varchar(100),
quantity int,
amount decimal(10, 2),
customerID int,
foreign key(customerID) references customers(customerID)
);

INSERT INTO sales (orderID, ordernumber, product, quantity, amount, customerID)
VALUES
(101, 365, 'mobile', 1, 346, 4),
(102, 543, 'television', 4, 545, 3),
(103, 645, 'vacuum', 3, 64, 2),
(104, 554, 'computer', 2, 465, 1),
(105, 456, 'computer', 1, 246, 3),
(106, 546, 'television', 4, 545, 4),
(107, 345, 'computer', 2, 465, 4),
(108, 576, 'computer', 3, 645, 4);

select * from sales;

SELECT 
    c.firstname,
    c.lastname,
    s.product,
    s.amount
FROM Customers c
INNER JOIN sales s
    ON c.customerID = s.customerID
WHERE s.amount BETWEEN 300 AND 700;


SELECT 
    c.firstname,
    c.lastname,
    s.product,
    s.amount
FROM Customers c
INNER JOIN sales s
    ON c.customerID = s.customerID
WHERE s.product = 'television' or 'vaccum';


SELECT 
    c.firstname,
    c.lastname,
    s.product,
    s.amount
FROM Customers c
INNER JOIN sales s
    ON c.customerID = s.customerID
WHERE s.product not in ('mobile');

SELECT 
    c.firstname,
    c.lastname,
    s.product,
    s.amount
FROM Customer c
INNER JOIN sales s
    ON c.customerID = s.customerID
ORDER BY s.product;


SELECT 
    c.firstname,
    c.lastname,
    s.product,
    s.amount
FROM Customer c
INNER JOIN sales s
    ON c.customerID = s.customerID
where s.product like 'computer'
order by s.product;