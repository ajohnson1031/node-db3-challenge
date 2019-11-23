-- Multi-Table Query Practice

-- Display the ProductName and CategoryName for all products in the database. Shows 77 records.
SELECT p.ProductName,
       c.CategoryName
  FROM Product AS p
       JOIN
       Category AS c ON c.id = p.CategoryId;

-- Display the order Id and shipper CompanyName for all orders placed before August 9 2012. Shows 429 records.
SELECT o.id,
       s.CompanyName
  FROM [Order] AS o
       JOIN
       Shipper AS s ON o.ShipVia = s.id
 WHERE o.OrderDate < '2012-08-09';
;


-- Display the name and quantity of the products ordered in order with Id 10251. Sort by ProductName. Shows 3 records.
SELECT p.ProductName,
       o.Quantity
  FROM OrderDetail AS o
       JOIN
       Product AS p ON p.id = o.ProductId
 WHERE o.OrderId = 10251
 ORDER BY p.ProductName;


-- Display the OrderID, Customer's Company Name and the employee's LastName for every order. All columns should be labeled clearly. Displays 16,789 records.
SELECT o.id AS [Order ID],
       c.CompanyName AS [Company Name],
       e.LastName AS [Employee Last Name]
  FROM [Order] AS o
       JOIN
       Customer AS c ON c.id = o.CustomerId
       JOIN
       Employee AS e ON e.id = o.EmployeeId;
;

-- STRETCH
-- Query 1
 SELECT CategoryName AS [Category Name], COUNT(p.CategoryID) AS [Count] FROM Categories AS c JOIN Products AS p ON p.CategoryID = c.CategoryID GROUP BY c.CategoryName

-- Query 2
 SELECT OrderID, COUNT(o.ProductID) AS [ItemCount] FROM OrderDetails AS o GROUP BY o.OrderID