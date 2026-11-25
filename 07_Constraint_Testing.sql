USE GameManagementDB;
GO

-- PART 7: CONSTRAINT TESTING

-- UNIQUE Constraint - Duplicate Customer Email
BEGIN TRY
    INSERT INTO Customers (FirstName, LastName, Email)
    VALUES ('Test', 'Customer', 'jason.duval@example.com');
END TRY
BEGIN CATCH
    SELECT ERROR_MESSAGE() AS ErrorMessage;
END CATCH;


-- CHECK Constraint - Negative Game Price
BEGIN TRY
    INSERT INTO Games (Title, Price)
    VALUES ('Test Game', -10.00);
END TRY
BEGIN CATCH
    SELECT ERROR_MESSAGE() AS ErrorMessage;
END CATCH;


-- CHECK Constraint - Invalid Review Rating
BEGIN TRY
    INSERT INTO Reviews (CustomerID, GameID, Rating)
    VALUES (20, 5, 6);
END TRY
BEGIN CATCH
    SELECT ERROR_MESSAGE() AS ErrorMessage;
END CATCH;


-- FOREIGN KEY Constraint - Invalid Customer
BEGIN TRY
    INSERT INTO Purchases (CustomerID)
    VALUES (-1);
END TRY
BEGIN CATCH
    SELECT ERROR_MESSAGE() AS ErrorMessage;
END CATCH;