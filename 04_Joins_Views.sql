
USE GameManagementDB;
GO

-- PART 4: JOINS AND VIEWS

-- INNER JOIN - Customers and Purchases
SELECT
    c.FirstName,
    c.LastName,
    p.PurchaseID,
    p.PurchaseDate,
    p.Status
FROM Customers c
INNER JOIN Purchases p
    ON c.CustomerID = p.CustomerID;

-- LEFT JOIN - Games and Reviews
SELECT
    g.Title,
    r.Rating,
    r.ReviewText
FROM Games g
LEFT JOIN Reviews r
    ON g.GameID = r.GameID
ORDER BY g.Title;

-- THREE TABLE JOIN - Customer Purchase History
SELECT
    c.FirstName,
    c.LastName,
    p.PurchaseDate,
    pi.GameID,
    pi.PurchasePrice
FROM Customers c
INNER JOIN Purchases p
    ON c.CustomerID = p.CustomerID
INNER JOIN PurchaseItems pi
    ON p.PurchaseID = pi.PurchaseID
WHERE p.Status = 'Completed';

-- FOUR TABLE JOIN - Customer Game Library
SELECT
    c.FirstName,
    c.LastName,
    g.Title,
    p.PurchaseDate,
    pi.PurchasePrice
FROM Customers c
INNER JOIN Purchases p
    ON c.CustomerID = p.CustomerID
INNER JOIN PurchaseItems pi
    ON p.PurchaseID = pi.PurchaseID
INNER JOIN Games g
    ON pi.GameID = g.GameID
WHERE p.Status = 'Completed'
ORDER BY c.CustomerID, g.Title;

-- VIEW - Customer Game Library
GO
CREATE OR ALTER VIEW CustomerGameLibrary AS
SELECT
    c.CustomerID,
    c.FirstName,
    c.LastName,
    g.GameID,
    g.Title,
    p.PurchaseDate,
    pi.PurchasePrice
FROM Customers c
INNER JOIN Purchases p
    ON c.CustomerID = p.CustomerID
INNER JOIN PurchaseItems pi
    ON p.PurchaseID = pi.PurchaseID
INNER JOIN Games g
    ON pi.GameID = g.GameID
WHERE p.Status = 'Completed';
GO

-- Test View
SELECT *
FROM CustomerGameLibrary
ORDER BY CustomerID, Title;
