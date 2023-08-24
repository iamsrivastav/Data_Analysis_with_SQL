-- Create the Customers table
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100)
);

-- Create the Products table
CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100),
    Price INT
);

-- Create the Orders table
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATE,
    TotalAmount INT,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

-- Insert sample data into the Customers table (12 rows)
INSERT INTO Customers (CustomerID, FirstName, LastName, Email)
VALUES (1, 'John', 'Doe', 'john@example.com');
INSERT INTO Customers (CustomerID, FirstName, LastName, Email)
VALUES (2, 'Jane', 'Smith', 'jane@example.com');
INSERT INTO Customers (CustomerID, FirstName, LastName, Email)
VALUES (3, 'Alice', 'Johnson', 'alice@example.com');
INSERT INTO Customers (CustomerID, FirstName, LastName, Email)
VALUES (4, 'Bob', 'Williams', 'bob@example.com');
INSERT INTO Customers (CustomerID, FirstName, LastName, Email)
VALUES (5, 'Eva', 'Brown', 'eva@example.com');
INSERT INTO Customers (CustomerID, FirstName, LastName, Email)
VALUES (6, 'Michael', 'Jones', 'michael@example.com');
INSERT INTO Customers (CustomerID, FirstName, LastName, Email)
VALUES (7, 'Sarah', 'Lee', 'sarah@example.com');
INSERT INTO Customers (CustomerID, FirstName, LastName, Email)
VALUES (8, 'David', 'Anderson', 'david@example.com');
INSERT INTO Customers (CustomerID, FirstName, LastName, Email)
VALUES (9, 'Linda', 'Martin', 'linda@example.com');
INSERT INTO Customers (CustomerID, FirstName, LastName, Email)
VALUES (10, 'William', 'Clark', 'william@example.com');
INSERT INTO Customers (CustomerID, FirstName, LastName, Email)
VALUES (11, 'Olivia', 'White', 'olivia@example.com');
INSERT INTO Customers (CustomerID, FirstName, LastName, Email)
VALUES (12, 'Daniel', 'Taylor', 'daniel@example.com');

-- Insert sample data into the Products table (12 rows)
INSERT INTO Products (ProductID, ProductName, Price)
VALUES (1, 'Product A', 10);
INSERT INTO Products (ProductID, ProductName, Price)
VALUES (2, 'Product B', 15);
INSERT INTO Products (ProductID, ProductName, Price)
VALUES (3, 'Product C', 20);
INSERT INTO Products (ProductID, ProductName, Price)
VALUES (4, 'Product D', 25);
INSERT INTO Products (ProductID, ProductName, Price)
VALUES (5, 'Product E', 30);
INSERT INTO Products (ProductID, ProductName, Price)
VALUES (6, 'Product F', 35);
INSERT INTO Products (ProductID, ProductName, Price)
VALUES (7, 'Product G', 40);
INSERT INTO Products (ProductID, ProductName, Price)
VALUES (8, 'Product H', 45);
INSERT INTO Products (ProductID, ProductName, Price)
VALUES (9, 'Product I', 50);
INSERT INTO Products (ProductID, ProductName, Price)
VALUES (10, 'Product J', 55);
INSERT INTO Products (ProductID, ProductName, Price)
VALUES (11, 'Product K', 60);
INSERT INTO Products (ProductID, ProductName, Price)
VALUES (12, 'Product L', 65);

-- Insert sample data into the Orders table (first 12 rows)
INSERT INTO Orders (OrderID, CustomerID, OrderDate, TotalAmount)
VALUES (1, 1, TO_DATE('2023-08-01', 'YYYY-MM-DD'), 40);
INSERT INTO Orders (OrderID, CustomerID, OrderDate, TotalAmount)
VALUES (2, 2, TO_DATE('2023-08-02', 'YYYY-MM-DD'), 55);
INSERT INTO Orders (OrderID, CustomerID, OrderDate, TotalAmount)
VALUES (3, 3, TO_DATE('2023-08-03', 'YYYY-MM-DD'), 30);
INSERT INTO Orders (OrderID, CustomerID, OrderDate, TotalAmount)
VALUES (4, 4, TO_DATE('2023-08-04', 'YYYY-MM-DD'), 75);
INSERT INTO Orders (OrderID, CustomerID, OrderDate, TotalAmount)
VALUES (5, 5, TO_DATE('2023-08-05', 'YYYY-MM-DD'), 60);
INSERT INTO Orders (OrderID, CustomerID, OrderDate, TotalAmount)
VALUES (6, 6, TO_DATE('2023-08-06', 'YYYY-MM-DD'), 45);
INSERT INTO Orders (OrderID, CustomerID, OrderDate, TotalAmount)
VALUES (7, 7, TO_DATE('2023-08-07', 'YYYY-MM-DD'), 70);
INSERT INTO Orders (OrderID, CustomerID, OrderDate, TotalAmount)
VALUES (8, 8, TO_DATE('2023-08-08', 'YYYY-MM-DD'), 25);
INSERT INTO Orders (OrderID, CustomerID, OrderDate, TotalAmount)
VALUES (9, 9, TO_DATE('2023-08-09', 'YYYY-MM-DD'), 50);
INSERT INTO Orders (OrderID, CustomerID, OrderDate, TotalAmount)
VALUES (10, 10, TO_DATE('2023-08-10', 'YYYY-MM-DD'), 65);
INSERT INTO Orders (OrderID, CustomerID, OrderDate, TotalAmount)
VALUES (11, 11, TO_DATE('2023-08-11', 'YYYY-MM-DD'), 80);
INSERT INTO Orders (OrderID, CustomerID, OrderDate, TotalAmount)
VALUES (12, 12, TO_DATE('2023-08-12', 'YYYY-MM-DD'), 35);

-- Overview of all the data -- 
select * from customers;
select * from products;
select * from orders;

-- 1. Count the number of products in the Products table.
SELECT COUNT(*) as TotalProducts FROM Products;

-- 2. Calculate the average price of products in the Products table.
SELECT AVG(Price) as AvgPrice FROM Products;

-- 3. Find the earliest order date in the Orders table.
SELECT MIN(OrderDate) as EarliestOrderDate FROM Orders;

-- 4. List all customers who have placed orders.
SELECT DISTINCT CustomerID FROM Orders;

-- 5. Calculate the total number of orders placed by each customer.
SELECT CustomerID, COUNT(*) as OrderCount
FROM Orders
GROUP BY CustomerID;

-- 6. Find the most expensive product in the Products table.
SELECT ProductName, MAX(Price) as MaxPrice
FROM Products;

-- 7. Identify the customer who spent the most on a single order.
SELECT CustomerID, MAX(TotalAmount) as MaxOrderAmount
FROM Orders;

-- 8. List all products with a price less than $20.
SELECT ProductName, Price
FROM Products
WHERE Price < 20;

-- 9. Find the total revenue generated in each month.
SELECT EXTRACT(MONTH FROM OrderDate) as Month, SUM(TotalAmount) as MonthlyRevenue
FROM Orders
GROUP BY Month
ORDER BY Month;

-- 10. Count the number of orders placed on a specific date.
SELECT OrderDate, COUNT(*) as OrderCount
FROM Orders
WHERE OrderDate = TO_DATE('2023-08-05', 'YYYY-MM-DD');

-- 11. List all customers who have not placed any orders.
SELECT C.CustomerID, C.FirstName, C.LastName
FROM Customers C
LEFT JOIN Orders O ON C.CustomerID = O.CustomerID
WHERE O.CustomerID IS NULL;

-- 12. Calculate the total number of orders placed by customers from each city.
SELECT C.City, COUNT(O.OrderID) as OrderCount
FROM Customers C
LEFT JOIN Orders O ON C.CustomerID = O.CustomerID
GROUP BY C.City;

-- 13. Find the top 5 customers with the highest total spending.
SELECT C.CustomerID, C.FirstName, C.LastName, SUM(O.TotalAmount) as TotalSpent
FROM Customers C
JOIN Orders O ON C.CustomerID = O.CustomerID
GROUP BY C.CustomerID, C.FirstName, C.LastName
ORDER BY TotalSpent DESC
LIMIT 5;

-- 14. Calculate the average order amount for each customer.
SELECT O.CustomerID, AVG(O.TotalAmount) as AvgOrderAmount
FROM Orders O
GROUP BY O.CustomerID;

-- 15. Identify customers who have placed orders on consecutive days.
SELECT DISTINCT O1.CustomerID
FROM Orders O1
JOIN Orders O2 ON O1.CustomerID = O2.CustomerID
WHERE ABS(TO_DATE(O1.OrderDate) - TO_DATE(O2.OrderDate)) = 1;

-- 16. List all products that have not been ordered.
SELECT P.ProductID, P.ProductName
FROM Products P
LEFT JOIN Orders O ON P.ProductID = O.ProductID
WHERE O.OrderID IS NULL;

-- 17. Calculate the total revenue for each product category.
SELECT P.ProductName, SUM(O.TotalAmount) as TotalRevenue
FROM Products P
JOIN Orders O ON P.ProductID = O.ProductID
GROUP BY P.ProductName;

-- 18. Find the date with the highest total revenue.
SELECT OrderDate, SUM(TotalAmount) as DailyRevenue
FROM Orders
GROUP BY OrderDate
ORDER BY DailyRevenue DESC
LIMIT 1;

-- 19. Calculate the total revenue for each quarter of the year.
SELECT
    EXTRACT(YEAR FROM OrderDate) as OrderYear,
    TO_CHAR(OrderDate, 'Q') as Quarter,
    SUM(TotalAmount) as QuarterlyRevenue
FROM Orders
GROUP BY EXTRACT(YEAR FROM OrderDate), TO_CHAR(OrderDate, 'Q')
ORDER BY OrderYear, Quarter;

-- 20. Identify customers who placed their first order in a specific month.
SELECT CustomerID, MIN(OrderDate) as FirstOrderDate
FROM Orders
GROUP BY CustomerID
HAVING EXTRACT(MONTH FROM MIN(OrderDate)) = 8; -- Specify the month

-- 21. Calculate the total revenue for each customer's first order.
SELECT O.CustomerID, MIN(O.OrderDate) as FirstOrderDate, SUM(O.TotalAmount) as FirstOrderTotal
FROM Orders O
JOIN (
    SELECT CustomerID, MIN(OrderDate) as FirstOrderDate
    FROM Orders
    GROUP BY CustomerID
) FirstOrders ON O.CustomerID = FirstOrders.CustomerID AND O.OrderDate = FirstOrders.FirstOrderDate
GROUP BY O.CustomerID, FirstOrderDate;

-- 22. List all products ordered by more than one customer.
SELECT P.ProductID, P.ProductName
FROM Products P
JOIN Orders O ON P.ProductID = O.ProductID
GROUP BY P.ProductID, P.ProductName
HAVING COUNT(DISTINCT O.CustomerID) > 1;

-- 23. Find the customer with the longest gap between orders.
SELECT CustomerID, MAX(GapDays) as MaxGapDays
FROM (
    SELECT CustomerID, OrderDate - LAG(OrderDate) OVER(PARTITION BY CustomerID ORDER BY OrderDate) as GapDays
    FROM Orders
)
GROUP BY CustomerID
ORDER BY MaxGapDays DESC
LIMIT 1;

-- 24. Calculate the total revenue for each product in the last quarter.
SELECT P.ProductName, SUM(O.TotalAmount) as TotalRevenue
FROM Products P
JOIN Orders O ON P.ProductID = O.ProductID
WHERE TO_CHAR(O.OrderDate, 'YYYY-Q') = TO_CHAR(SYSDATE, 'YYYY-Q') -- Adjust for the current quarter
GROUP BY P.ProductName;

-- 25. Identify customers who placed an order with a total amount exceeding the average order amount.
SELECT O.CustomerID, AVG(O.TotalAmount) as AvgOrderAmount, MAX(O.TotalAmount) as MaxOrderAmount
FROM Orders O
GROUP BY O.CustomerID
HAVING MAX(O.TotalAmount) > AVG(O.TotalAmount);

-- 26. Calculate the average number of days between consecutive orders for each customer.
SELECT CustomerID, AVG(GapDays) as AvgDaysBetweenOrders
FROM (
    SELECT CustomerID, OrderDate - LAG(OrderDate) OVER(PARTITION BY CustomerID ORDER BY OrderDate) as GapDays
    FROM Orders
)
GROUP BY CustomerID;

-- 27. Find the top 3 products with the highest total revenue in each category.
SELECT
    ProductName,
    Category,
    TotalRevenue,
    ROW_NUMBER() OVER(PARTITION BY Category ORDER BY TotalRevenue DESC) as Ranking
FROM (
    SELECT P.ProductName, P.Category, SUM(O.TotalAmount) as TotalRevenue
    FROM Products P
    JOIN Orders O ON P.ProductID = O.ProductID
    GROUP BY P.ProductName, P.Category
) RankedProducts
WHERE Ranking <= 3;

-- 28. Calculate the total revenue for each customer in the last 90 days.
SELECT O.CustomerID, SUM(O.TotalAmount) as RevenueLast90Days
FROM Orders O
WHERE O.OrderDate >= SYSDATE - 90
GROUP BY O.CustomerID;

-- 29. List all customers who placed orders with a total amount greater than $100 in each year.
SELECT
    EXTRACT(YEAR FROM O.OrderDate) as OrderYear,
    O.CustomerID,
    C.FirstName,
    C.LastName,
    SUM(O.TotalAmount) as TotalSpent
FROM Orders O
JOIN Customers C ON O.CustomerID = C.CustomerID
GROUP BY EXTRACT(YEAR FROM O.OrderDate), O.CustomerID, C.FirstName, C.LastName
HAVING SUM(O.TotalAmount) > 100;

-- 30. Find the product that has been ordered the most in the last month.
SELECT O.ProductID, P.ProductName, SUM(O.Quantity) as TotalOrdered
FROM Orders O
JOIN Products P ON O.ProductID = P.ProductID
WHERE O.OrderDate >= TRUNC(LAST_DAY(SYSDATE - 1) - INTERVAL '1' MONTH) -- Adjust for the last month
GROUP BY O.ProductID, P.ProductName
ORDER BY TotalOrdered DESC
LIMIT 1;