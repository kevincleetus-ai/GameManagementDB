
USE GameManagementDB;
GO

-- PART 5: SQL PROGRAMMING

-- STORED PROCEDURE - Purchase a Game
CREATE OR ALTER PROCEDURE dbo.PurchaseGame
    @CustomerID INT,
    @GameID INT
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRY
        IF NOT EXISTS (
            SELECT 1 FROM Customers
            WHERE CustomerID = @CustomerID AND IsActive = 1
        )
            THROW 50001, 'Customer not found or inactive.', 1;

        IF NOT EXISTS (
            SELECT 1 FROM Games
            WHERE GameID = @GameID AND IsAvailable = 1
        )
            THROW 50002, 'Game not available.', 1;

        BEGIN TRANSACTION;

        INSERT INTO Purchases (CustomerID)
        VALUES (@CustomerID);

        DECLARE @PurchaseID INT = SCOPE_IDENTITY();

        INSERT INTO PurchaseItems (PurchaseID, GameID, PurchasePrice)
        SELECT @PurchaseID, GameID, Price
        FROM Games
        WHERE GameID = @GameID;

        COMMIT TRANSACTION;

        SELECT @PurchaseID AS NewPurchaseID;
    END TRY
    BEGIN CATCH
        IF @@TRANCOUNT > 0
            ROLLBACK TRANSACTION;

        SELECT ERROR_MESSAGE() AS ErrorMessage;
    END CATCH
END;
GO

-- Test Stored Procedure
BEGIN TRANSACTION;

EXEC dbo.PurchaseGame
    @CustomerID = 20,
    @GameID = 16;

SELECT *
FROM Purchases
WHERE CustomerID = 20;

ROLLBACK TRANSACTION;
GO


-- FUNCTION - Calculate Customer Spending
CREATE OR ALTER FUNCTION dbo.CalculateCustomerSpending
(
    @CustomerID INT
)
RETURNS DECIMAL(12,2)
AS
BEGIN
    DECLARE @Total DECIMAL(12,2);

    SELECT @Total = COALESCE(SUM(pi.PurchasePrice), 0)
    FROM Purchases p
    INNER JOIN PurchaseItems pi
        ON p.PurchaseID = pi.PurchaseID
    WHERE p.CustomerID = @CustomerID
      AND p.Status = 'Completed';

    RETURN @Total;
END;
GO

-- Test Function
SELECT
    CustomerID,
    FirstName,
    LastName,
    dbo.CalculateCustomerSpending(CustomerID) AS TotalSpent
FROM Customers
ORDER BY TotalSpent DESC;
GO


-- TRIGGER - Validate Game Reviews
CREATE OR ALTER TRIGGER dbo.ValidateGameReview
ON Reviews
AFTER INSERT
AS
BEGIN
    IF EXISTS (
        SELECT 1
        FROM inserted i
        WHERE NOT EXISTS (
            SELECT 1
            FROM Purchases p
            INNER JOIN PurchaseItems pi
                ON p.PurchaseID = pi.PurchaseID
            WHERE p.CustomerID = i.CustomerID
              AND pi.GameID = i.GameID
              AND p.Status = 'Completed'
        )
    )
    BEGIN
        RAISERROR('Customer must own the game to review it.', 16, 1);
        ROLLBACK TRANSACTION;
    END
END;
GO

-- Test Trigger
BEGIN TRANSACTION;

INSERT INTO Reviews (CustomerID, GameID, Rating, ReviewText)
VALUES (20, 5, 5, 'Great sandbox game.');

SELECT *
FROM Reviews
WHERE CustomerID = 20 AND GameID = 5;

ROLLBACK TRANSACTION;
GO


-- MANUAL TRANSACTION - Update and Rollback
BEGIN TRANSACTION;

UPDATE Games
SET Price = 19.99
WHERE GameID = 5;

-- Before Rollback
SELECT GameID, Title, Price
FROM Games
WHERE GameID = 5;

ROLLBACK TRANSACTION;

-- After Rollback
SELECT GameID, Title, Price
FROM Games
WHERE GameID = 5;
