CREATE DATABASE QLBH;
USE QLBH;
GO

-- Tạo bảng Suppliers 
CREATE TABLE Suppliers 
(
    SupplierID INT PRIMARY KEY IDENTITY(1,1),
    SupplierName NVARCHAR(100) NOT NULL,
    ContactName NVARCHAR(50),
    Address NVARCHAR(100),
    City NVARCHAR(50),
    Region NVARCHAR(50),
    PostalCode NVARCHAR(20),
    Country NVARCHAR(50),
    Phone NVARCHAR(20),
    Fax NVARCHAR(20),
    Email NVARCHAR(100)
);
GO
INSERT INTO Suppliers (SupplierName, ContactName, Address, City, Region, PostalCode, Country, Phone, Fax, Email)
VALUES 
('Supplier A', 'John Doe', '123 Main St', 'New York', 'NY', '10001', 'USA', '123-456-7890', '123-456-7891', 'john@example.com'),
('Supplier B', 'Jane Smith', '456 Elm St', 'Los Angeles', 'CA', '90001', 'USA', '987-654-3210', '987-654-3211', 'jane@example.com');
GO 
-- Tạo bảng Products 
CREATE TABLE Products 
(
    ProductID INT PRIMARY KEY IDENTITY(1,1),
    ProductName NVARCHAR(100) NOT NULL,
    SupplierID INT,
    CategoryID INT,
    UnitPrice MONEY DEFAULT 0,
    UnitsInStock INT DEFAULT 0,
    UnitsOnOrder INT DEFAULT 0,
    ReorderLevel INT DEFAULT 0,
    Discontinued BIT DEFAULT 0,
    Description NVARCHAR(MAX),
    CONSTRAINT FK_Products_Suppliers FOREIGN KEY (SupplierID) REFERENCES Suppliers(SupplierID)
);
GO
INSERT INTO Products (ProductName, SupplierID, CategoryID, UnitPrice, UnitsInStock, UnitsOnOrder, ReorderLevel, Discontinued, Description)
VALUES 
	('Product 1', 1, NULL, 12.50, 100, 0, 10, 0, 'Description for Product 1'),
	('Product 2', 1, NULL, 15.00, 50, 0, 5, 0, 'Description for Product 2'),
	('Product 3', 2, NULL, 8.00, 200, 0, 20, 0, 'Description for Product 3'),
	('Product 4', 2, NULL, 20.00, 0, 0, 0, 1, 'Description for Product 4'),
INSERT INTO Products (ProductName, SupplierID, CategoryID, UnitPrice, UnitsInStock, UnitsOnOrder, ReorderLevel, Discontinued, Description)
VALUES 
('Product A', 1, 1, 10.00, 100, 50, 10, 0, 'Description for Product A'),
('Product B', 1, 2, 15.00, 200, 30, 20, 0, 'Description for Product B'),
('Product C', 2, 1, 20.00, 150, 25, 15, 0, 'Description for Product C'),
('Product D', 2, 2, 25.00, 80, 10, 5, 0, 'Description for Product D');
GO 

-- Tạo bảng Customers 
CREATE TABLE Customers (
    CustomerID NCHAR(5) PRIMARY KEY,
    CompanyName NVARCHAR(100) NOT NULL,
    ContactName NVARCHAR(50),
    ContactTitle NVARCHAR(50),
    Address NVARCHAR(100),
    City NVARCHAR(50),
    Region NVARCHAR(50),
    PostalCode NVARCHAR(20),
    Country NVARCHAR(50),
    Phone NVARCHAR(20),
    Fax NVARCHAR(20),
    Email NVARCHAR(100)
);

GO
INSERT INTO Customers (CustomerID, CompanyName, ContactName, ContactTitle, Address, City, Region, PostalCode, Country, Phone, Fax, Email)
VALUES 
	('C001', 'Company A', 'Alice Johnson', 'Manager', '789 Pine St', 'London', NULL, 'E1 6AN', 'UK', '020-1234-5678', NULL, 'alice@example.com'),
	('C002', 'Company B', 'Bob Brown', 'Director', '321 Oak St', 'Boise', NULL, '83701', 'USA', '208-987-6543', '208-987-6544', 'bob@example.com'), 
	('C003', 'Company C', 'Charlie Green', 'Sales Associate', '123 Cherry St', 'Paris', NULL, '75001', 'France', '01-23-45-67-89', NULL, 'charlie@example.com'),
	('C004', 'Company D', 'Diana Prince', 'Marketing Manager', '456 Maple Ave', 'Lyon', NULL, '69001', 'France', '04-56-78-90-12', '04-56-78-90-13', 'diana@example.com'),
	('C005', 'Company E', 'Ethan Hunt', 'Director', '789 Oak St', 'Boise', NULL, '83702', 'USA', '208-555-1234', NULL, 'ethan@example.com'),
	('C006', 'Company F', 'Fiona Apple', 'CEO', '321 Pine St', 'London', NULL, 'E1 6AN', 'UK', '020-555-5678', '020-555-5679', 'fiona@example.com'),
	('C007', 'Company G', 'George Clooney', 'Actor', '654 Elm St', 'New York', NULL, '10001', 'USA', '212-555-9876', NULL, 'george@example.com'), 
INSERT INTO Customers (CustomerID, CompanyName, ContactName, ContactTitle, Address, City, Region, PostalCode, Country, Phone, Fax, Email)
VALUES 	
	('C008', 'Company V', 'Alice Johnson', 'Manager', '123 Main St', 'New York', NULL, '10001', 'USA', '212-555-1234', NULL, 'alice@example.com'),
	('C009', 'Company H', 'Bob Brown', 'Director', '456 Elm St', 'Los Angeles', NULL, '90001', 'USA', '310-555-5678', '310-555-5679', 'bob@example.com'),
	('C0010', 'Company K', 'Charlie Green', 'Sales Associate', '789 Pine St', 'Paris', NULL, '75001', 'France', '01-23-45-67-89', NULL, 'charlie@example.com'),
	('C0011', 'Company L', 'Diana Prince', 'Marketing Manager', '321 Oak St', 'Lyon', NULL, '69001', 'France', '04-56-78-90-12', '04-56-78-90-13', 'diana@example.com');
GO 
CREATE TABLE Employees 
(
    EmployeeID INT PRIMARY KEY IDENTITY(1,1),
    LastName NVARCHAR(50) NOT NULL,
    FirstName NVARCHAR(50) NOT NULL,
    Title NVARCHAR(50),
    BirthDate DATE,
    HireDate DATE,
    Address NVARCHAR(100),
    City NVARCHAR(50),
    Region NVARCHAR(50),
    PostalCode NVARCHAR(20),
    Country NVARCHAR(50),
    HomePhone NVARCHAR(20),
    Extension NVARCHAR(10),
    Notes NVARCHAR(MAX),
    ReportsTo INT,
    CONSTRAINT FK_Employees_Employees FOREIGN KEY (ReportsTo) REFERENCES Employees(EmployeeID)
);
GO
INSERT INTO Employees (LastName, FirstName, Title, BirthDate, HireDate, Address, City, Region, PostalCode, Country, HomePhone, Extension, Notes, ReportsTo)
VALUES 
('Johnson', 'Alice', 'Sales Representative', '1985-05-15', '2020-01-10', '123 Main St', 'New York', NULL, '10001', 'USA', '212-555-1234', '101', NULL, NULL),
('Smith', 'Bob', 'Sales Manager', '1980-03-20', '2019-06-15', '456 Elm St', 'Los Angeles', NULL, '90001', 'USA', '310-555-5678', '102', NULL, NULL),
('Brown', 'Charlie', 'Marketing Specialist', '1990-07-30', '2021-03-01', '789 Oak St', 'Chicago', NULL, '60601', 'USA', '312-555-8765', '103', NULL, 1),
('Davis', 'Diana', 'HR Manager', '1975-11-25', '2018-05-20', '321 Pine St', 'Houston', NULL, '77001', 'USA', '713-555-4321', '104', NULL, NULL);
GO

--- tạo bảng Oders 
CREATE TABLE Orders 
(
    OrderID INT PRIMARY KEY IDENTITY(1,1),
    CustomerID NCHAR(5),
    EmployeeID INT,
    OrderDate DATE,
    RequiredDate DATE,
    ShippedDate DATE,
    ShipVia INT,
    Freight MONEY DEFAULT 0,
    ShipName NVARCHAR(100),
    ShipAddress NVARCHAR(100),
    ShipCity NVARCHAR(50),
    ShipRegion NVARCHAR(50),
    ShipPostalCode NVARCHAR(20),
    ShipCountry NVARCHAR(50),
    CONSTRAINT FK_Orders_Customers FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
    CONSTRAINT FK_Orders_Employees FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID)
);
GO
INSERT INTO Orders (CustomerID, EmployeeID, OrderDate, RequiredDate, ShippedDate, ShipVia, Freight, ShipName, ShipAddress, ShipCity, ShipRegion, ShipPostalCode, ShipCountry)
VALUES 
('C001', 1, '1997-01-15', '1997-07-20', NULL, 1, 5.00, 'Alice Johnson', '123 Main St', 'New York', NULL, '10001', 'USA'),
('C002', 2, '1997-07-10', '1997-07-15', NULL, 2, 10.00, 'Bob Brown', '456 Elm St', 'Los Angeles', NULL, '90001', 'USA'),
('C003', 1, '1997-08-01', '1997-08-05', NULL, 1, 7.50, 'Charlie Green', '789 Pine St', 'Paris', NULL, '75001', 'France'),
('C004', 2, '1997-01-25', '1997-07-30', NULL, 2, 12.00, 'Diana Prince', '321 Oak St', 'Lyon', NULL, '69001', 'France'),
INSERT INTO Orders (CustomerID, EmployeeID, OrderDate, RequiredDate, ShippedDate, ShipVia, Freight, ShipName, ShipAddress, ShipCity, ShipRegion, ShipPostalCode, ShipCountry)
VALUES 
('C006', 1, '1997-07-15', '1997-07-20', NULL, 1, 5.00, 'Alice Johnson', '123 Main St', 'New York', NULL, '10001', 'USA'),
('C007', 2, '1997-07-10', '1997-07-15', NULL, 2, 10.00, 'Bob Brown', '456 Elm St', 'Los Angeles', NULL, '90001', 'USA'),
('C008', 1, '1997-08-01', '1997-08-05', NULL, 1, 7.50, 'Charlie Green', '789 Pine St', 'Paris', NULL, '75001', 'France'),
('C009', 2, '1997-07-25', '1997-07-30', NULL, 2, 12.00, 'Diana Prince', '321 Oak St', 'Lyon', NULL, '69001', 'France');
GO
INSERT INTO Orders (CustomerID, EmployeeID, OrderDate, RequiredDate, ShippedDate, ShipVia, Freight, ShipName, ShipAddress, ShipCity, ShipRegion, ShipPostalCode, ShipCountry)
VALUES 
('C001', 1, '1996-07-15', '1996-07-20', '1996-07-16', 1, 5.00, 'Alice Johnson', '123 Main St', 'New York', NULL, '10001', 'USA');
---- Tạo bảng Order_Details 
CREATE TABLE Order_Details 
(
    OrderID INT NOT NULL,
    ProductID INT NOT NULL,
    UnitPrice MONEY NOT NULL DEFAULT 0,
    Quantity INT NOT NULL DEFAULT 1,
    Discount FLOAT NOT NULL DEFAULT 0,
    CONSTRAINT PK_Order_Details PRIMARY KEY (OrderID, ProductID),
    CONSTRAINT FK_Order_Details_Orders FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    CONSTRAINT FK_Order_Details_Products FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);
GO
INSERT INTO Order_Details (OrderID, ProductID, UnitPrice, Quantity, Discount)
VALUES 
(1, 1, 12.50, 2, 0),  -- OrderID 1, ProductID 1
(1, 2, 15.00, 1, 0),  -- OrderID 1, ProductID 2
(2, 3, 8.00, 5, 0),   -- OrderID 2, ProductID 3
(3, 1, 12.50, 3, 0),  -- OrderID 3, ProductID 1
(4, 2, 15.00, 2, 0);  -- OrderID 4, ProductID 2
GO
------------------------ TUẦN 5 ---------------------------------------------------
--- Câu 1 (Tuần 5)
Select *
from Products 
--- Câu 2
Select CustomerID,CompanyName,City,Phone
from Customers 
--- Câu 3
Select ProductId, ProductName, UnitPrice
from Products
--- Câu 4
Select
    EmployeeID, 
    LastName + ' ' + FirstName AS 'EmployeeName' , 
    HomePhone AS 'Phone' , 
    DATEDIFF(YEAR, BirthDate, GETDATE()) AS Age
from Employees
--- Câu 5
Select  CustomerID, CompanyName, ContactName, ContactTitle 
from Customers 
where ContactTitle LIKE 'O%';
--- Câu 6
Select  CustomerID, CompanyName, City
from Customers 
where City IN  ('LonDon', 'Boise', 'Paris')
--- Câu 7
Select  CustomerID, CompanyName, City
from Customers 
where CompanyName LIKE 'V%' AND City = 'Lyon'
--- Câu 8
Select CustomerID, CompanyName, Fax 
from Customers 
where Fax IS NULL OR Fax = ''
--- Câu 9
Select CustomerID, CompanyName, Fax 
from Customers 
where Fax IS NOT NULL OR Fax <> '';
--- Câu 10
Select ProductID, ProductName, UnitPrice
from Products 
where UnitPrice LIKE ' %Boxes% ';
--- Câu 11
Select ProductID, ProductName, UnitPrice
from Products 
where UnitPrice > 10 and UnitPrice < 15;
--- Câu 12
Select OrderID, CustomerID, OrderDate 
from Orders 
where OrderDate >= '1996-09-01' AND OrderDate < '1996-10-01' 
ORDER BY CustomerID, OrderDate DESC;
---- Câu 13
Select OrderID, CustomerID, OrderDate 
from Orders 
where OrderDate >= '1996-09-01' AND OrderDate < '1996-10-01' 
ORDER BY CustomerID, OrderDate DESC;
--- Câu 14
SELECT OrderID, OrderDate, CustomerID, EmployeeID 
FROM Orders 
WHERE OrderDate >= '1997-10-01' AND OrderDate < '1998-01-01' 
ORDER BY MONTH(OrderDate);
--- Câu 15
SELECT OrderID, OrderDate, CustomerID, EmployeeID,
    DATEPART(WEEKDAY, OrderDate) AS WeekDayOfOrderDate 
FROM 
    Orders 
WHERE 
    OrderDate >= '1997-12-01' AND OrderDate < '1998-01-01' 
    AND (DATEPART(WEEKDAY, OrderDate) = 7 OR DATEPART(WEEKDAY, OrderDate) = 1); 
--- Câu 16
SELECT ProductID, ProductName, UnitPrice, (UnitsInStock * UnitPrice) AS TotalAccount 
FROM Products 
ORDER BY TotalAccount DESC;
--- Câu 17
SELECT TOP 5 CustomerID, CompanyName, City 
FROM Customers 
WHERE City LIKE 'M%';
--- Câu 18
SELECT TOP 2 EmployeeID, LastName + ' ' + FirstName AS EmployeeName, DATEDIFF(YEAR, BirthDate, GETDATE()) AS Age 
FROM Employees 
ORDER BY BirthDate ASC; 
--- Câu 19
SELECT ProductID, ProductName, UnitsInStock 
FROM Products 
WHERE UnitsInStock < 5;
--- Câu 20
SELECT od.OrderID, od.ProductID, od.Quantity, od.UnitPrice, od.Discount, (od.Quantity * od.UnitPrice - 0.2 * od.Discount) AS Total 
FROM Order_Details od;

----------------TUẦN 6-----------------------------------------------
---- Câu 1
SELECT 
    c.CustomerID, 
    c.CompanyName, 
    c.Address, 
    o.OrderID, 
    o.OrderDate 
FROM 
    Customers c
JOIN 
    Orders o ON c.CustomerID = o.CustomerID
WHERE 
    o.OrderDate >= '1997-07-01' AND o.OrderDate < '1997-08-01'
ORDER BY 
    c.CustomerID, 
    o.OrderDate DESC;
--- Câu 2
SELECT 
    c.CustomerID, 
    c.CompanyName, 
    c.Address, 
    o.OrderID, 
    o.OrderDate 
FROM 
    Customers c
JOIN 
    Orders o ON c.CustomerID = o.CustomerID
WHERE 
    o.OrderDate >= '1997-07-01' AND o.OrderDate < '1997-07-30'
ORDER BY 
    c.CustomerID, 
    o.OrderDate;
--- Câu 3
SELECT 
    p.ProductID, 
    p.ProductName, 
    od.Quantity, 
    od.UnitPrice, 
    od.Discount 
FROM 
    Orders
JOIN 
    Order_Details od ON o.OrderID = od.OrderID
JOIN 
    Products p ON od.ProductID = p.ProductID
WHERE 
    o.ShippedDate = '1996-07-12';
--- Câu 4
SELECT 
    o.OrderID, 
    c.CompanyName, 
    o.OrderDate, 
    o.RequiredDate 
FROM 
    Orders
JOIN 
    Customers c ON o.CustomerID = c.CustomerID
WHERE 
    (MONTH(o.OrderDate) = 4 OR MONTH(o.OrderDate) = 9) 
    AND YEAR(o.OrderDate) = 1997
ORDER BY 
    c.CompanyName, 
    o.OrderDate DESC;