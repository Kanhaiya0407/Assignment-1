



----------Problem Statement:


ABC Fashion is a leading retailer with a vast customer base
and a team of dedicated sales representatives.
They have a Sales Order Processing System
that helps manage customer orders and interactions.


----Salesman table creation

CREATE TABLE Salesman (
SalesmanId INT,
Name VARCHAR(255),
Commission DECIMAL(10, 2),
City VARCHAR(255),
Age INT
);

INSERT INTO Salesman (SalesmanId, Name, Commission, City, Age)
VALUES
(101, 'Joe', 50, 'California', 17),
(102, 'Simon', 75, 'Texas', 25),
(103, 'Jessie', 105, 'Florida', 35),
(104, 'Danny', 100, 'Texas', 22),
(105, 'Lia', 65, 'New Jersey', 30);


-------Customer table creation

CREATE TABLE Customer (
SalesmanId INT,
CustomerId INT,
CustomerName VARCHAR(255),
PurchaseAmount INT,
);

INSERT INTO Customer (SalesmanId, CustomerId, CustomerName, PurchaseAmount)
VALUES
(101, 2345, 'Andrew', 550),
(103, 1575, 'Lucky', 4500),
(104, 2345, 'Andrew', 4000),
(107, 3747, 'Remona', 2700),
(110, 4004, 'Julia', 4545)


---------Orders table Creation

CREATE TABLE Orders (OrderId int, CustomerId int, SalesmanId int, Orderdate Date, Amount
money)

INSERT INTO Orders Values
(5001,2345,101,'2021-07-01',550),
(5003,1234,105,'2022-02-15',1500)


----------Tasks to be Performed:
1. Insert a new record in your Orders table.

2. Add Primary key constraint for SalesmanId column in Salesman table. Add default
constraint for City column in Salesman table. Add Foreign key constraint for SalesmanId
column in Customer table. Add not null constraint in Customer_name column for the
Customer table.

3. Fetch the data where the Customer’s name is ending with ‘N’ also get the purchase
amount value greater than 500.

4. Using SET operators, retrieve the first result with unique SalesmanId values from two
tables, and the other result containing SalesmanId with duplicates from two tables.

5. Display the below columns which has the matching data.
Orderdate, Salesman Name, Customer Name, Commission, and City which has the
range of Purchase Amount between 500 to 1500.

6. Using right join fetch all the results from Salesman and Orders table.

-----------------------------ASSIGNMENT------------------------------------------


1. Insert a new record in your Orders table.

INSERT INTO ORDERS (ORDERID,CUSTOMERID,SALESMANID,ORDERDATE,AMOUNT)
 VALUES (5004,4567,109,'2025-04-28',2000);

SELECT * FROM ORDERS;

2. Add Primary key constraint for SalesmanId column in Salesman table. Add default
constraint for City column in Salesman table. Add Foreign key constraint for SalesmanId
column in Customer table. Add not null constraint in Customer_name column for the
Customer table.

--Add Primary key constraint for SalesmanId column in Salesman table.

  
 ALTER TABLE SalesmaN ADD CONSTRAINT PK_Salesman PRIMARY KEY (SalesmanId);




--Add default constraint for City column in Salesman table.

ALTER TABLE SALESMAN ADD CONSTRAINT DF_CITY DEFAULT 'USA' FROM CITY;



 --Add Foreign key constraint for SalesmanId columnin customer table
column in Customer table.



ALTER TABLE Customer
         ADD CONSTRAINT FK_Salesman FOREIGN KEY (SalesmanId) 
         REFERENCES Salesman(SalesmanId);

--not null constraint in Customer_name column for the
Customer table.

 alter table customer alter column customername varchar(100) not null





3. Fetch the data where the Customer’s name is ending with ‘N’ also get the purchase
amount value greater than 500.


select * from customer where customername like '%n'
and purchaseamount>500;




4. Using SET operators, retrieve the first result with unique SalesmanId values from two
tables, and the other result containing SalesmanId with duplicates from two tables.


select salesmanid  from salesman
union
select salesmanid from customer 



5. Display the below columns which has the matching data.
Orderdate,
Salesman Name, 
Customer Name,
Commission, 
and City which has the range of Purchase Amount between 500 to 1500.

select * from customer
select * from salesman
select * from orders


	select o.Orderdate, s.Name as SalesmanName, c.CustomerName,
	s.Commission as SalesmanCommission, s.City as SalesmanCity
from Orders o join Customer c
on o.CustomerId = c.CustomerId
join Salesman s 
on o.SalesmanId = s.SalesmanId
where c.PurchaseAmount between 500 and 1500;






6. Using right join fetch all the results from Salesman and Orders table.

select * from customer
select * from salesman
select * from orders

select * from Salesman s right join Orders o
on s.SalesmanId = o.SalesmanId;
