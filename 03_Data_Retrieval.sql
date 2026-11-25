
USE GameManagementDB;
GO

-- PART 3: DATA RETRIEVAL

-- COUNT - Database Statistics
SELECT
    (SELECT COUNT(*) FROM Customers) AS TotalCustomers,
    (SELECT COUNT(*) FROM Games) AS TotalGames,
    (SELECT COUNT(*) FROM Purchases) AS TotalPurchases;

-- SUM - Total Revenue
SELECT SUM(pi.PurchasePrice) AS TotalRevenue
FROM PurchaseItems pi
INNER JOIN Purchases p ON pi.PurchaseID = p.PurchaseID
WHERE p.Status = 'Completed';

-- AVG - Average Game Rating
SELECT
    CAST(AVG(CAST(Rating AS DECIMAL(5,2))) AS DECIMAL(5,2))
    AS AverageRating
FROM Reviews;

-- GROUP BY - Most Purchased Games
SELECT
    g.Title,
    COUNT(CASE WHEN p.Status = 'Completed'
          THEN 1 END) AS TotalSales
FROM Games g
LEFT JOIN PurchaseItems pi ON g.GameID = pi.GameID
LEFT JOIN Purchases p ON pi.PurchaseID = p.PurchaseID
GROUP BY g.GameID, g.Title
ORDER BY TotalSales DESC, g.Title ASC;

-- ORDER BY - Price Ascending
SELECT Title, Price
FROM Games
ORDER BY Price ASC, Title ASC;

-- ORDER BY - Price Descending
SELECT Title, Price
FROM Games
ORDER BY Price DESC, Title ASC;

-- GROUP BY - Customer Spending
SELECT
    c.CustomerID,
    c.FirstName,
    c.LastName,
    COALESCE(SUM(pi.PurchasePrice), 0) AS TotalSpent
FROM Customers c
LEFT JOIN Purchases p ON c.CustomerID = p.CustomerID
    AND p.Status = 'Completed'
LEFT JOIN PurchaseItems pi ON p.PurchaseID = pi.PurchaseID
GROUP BY c.CustomerID, c.FirstName, c.LastName
ORDER BY TotalSpent DESC;

-- PAGINATION - First Five Games
SELECT GameID, Title, Price
FROM Games
ORDER BY GameID
OFFSET 0 ROWS
FETCH NEXT 5 ROWS ONLY;

-- PAGINATION - Second Page
SELECT GameID, Title, Price
FROM Games
ORDER BY GameID
OFFSET 5 ROWS
FETCH NEXT 5 ROWS ONLY;

-- SUBQUERY - Games Above Average Price
SELECT Title, Price
FROM Games
WHERE Price > (
    SELECT AVG(Price)
    FROM Games
)
ORDER BY Price DESC;

-- SUBQUERY - Customers Who Purchased GTA VI
SELECT CustomerID, FirstName, LastName
FROM Customers
WHERE CustomerID IN (
    SELECT p.CustomerID
    FROM Purchases p
    INNER JOIN PurchaseItems pi
        ON p.PurchaseID = pi.PurchaseID
    INNER JOIN Games g
        ON pi.GameID = g.GameID
    WHERE g.Title = 'Grand Theft Auto VI'
      AND p.Status = 'Completed'
);
