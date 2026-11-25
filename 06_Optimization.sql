
USE GameManagementDB;
GO

-- PART 6: OPTIMIZATION

-- UNIQUE INDEX - Game Titles
IF NOT EXISTS (
    SELECT 1 FROM sys.indexes
    WHERE name = 'IX_Games_Title'
      AND object_id = OBJECT_ID('dbo.Games')
)
    CREATE UNIQUE INDEX IX_Games_Title
    ON Games(Title);

-- NON-UNIQUE INDEX - Customer Purchases
IF NOT EXISTS (
    SELECT 1 FROM sys.indexes
    WHERE name = 'IX_Purchases_CustomerID'
      AND object_id = OBJECT_ID('dbo.Purchases')
)
    CREATE INDEX IX_Purchases_CustomerID
    ON Purchases(CustomerID);

-- NON-UNIQUE INDEX - Purchased Games
IF NOT EXISTS (
    SELECT 1 FROM sys.indexes
    WHERE name = 'IX_PurchaseItems_GameID'
      AND object_id = OBJECT_ID('dbo.PurchaseItems')
)
    CREATE INDEX IX_PurchaseItems_GameID
    ON PurchaseItems(GameID);

-- Verify Indexes
SELECT
    OBJECT_NAME(object_id) AS TableName,
    name AS IndexName,
    type_desc AS IndexType,
    is_unique AS IsUnique
FROM sys.indexes
WHERE object_id IN (
    OBJECT_ID('dbo.Games'),
    OBJECT_ID('dbo.Purchases'),
    OBJECT_ID('dbo.PurchaseItems')
)
AND name IS NOT NULL
ORDER BY TableName, IndexName;

-- EXECUTION PLANS - Query Performance
SET STATISTICS IO ON;

-- Game Lookup
SELECT GameID, Title, Price
FROM Games
WHERE Title = 'Grand Theft Auto VI';

-- Customer Purchase History
SELECT
    p.PurchaseID,
    p.PurchaseDate,
    pi.GameID,
    pi.PurchasePrice
FROM Purchases p
INNER JOIN PurchaseItems pi
    ON p.PurchaseID = pi.PurchaseID
WHERE p.CustomerID = 1;     

SET STATISTICS IO OFF;
SELECT GameID, Title, Price
FROM Games
WHERE Title = 'Grand Theft Auto VI';