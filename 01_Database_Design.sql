
-- PART 1: DATABASE DESIGN

CREATE DATABASE GameManagementDB;
GO

USE GameManagementDB;
GO

-- Customers
CREATE TABLE Customers (
    CustomerID INT IDENTITY(1,1) PRIMARY KEY,
    FirstName VARCHAR(100) NOT NULL,
    LastName VARCHAR(100) NOT NULL,
    Email VARCHAR(255) NOT NULL UNIQUE,
    RegistrationDate DATETIME2 NOT NULL DEFAULT GETDATE(),
    IsActive BIT NOT NULL DEFAULT 1
);

-- Games
CREATE TABLE Games (
    GameID INT IDENTITY(1,1) PRIMARY KEY,
    Title VARCHAR(255) NOT NULL,
    Description VARCHAR(MAX),
    Price DECIMAL(10,2) NOT NULL CHECK (Price >= 0),
    ReleaseDate DATE,
    IsAvailable BIT NOT NULL DEFAULT 1
);

-- Genres
CREATE TABLE Genres (
    GenreID INT IDENTITY(1,1) PRIMARY KEY,
    GenreName VARCHAR(100) NOT NULL UNIQUE
);

-- GameGenres (Many-to-Many Relationship)
CREATE TABLE GameGenres (
    GameGenreID INT IDENTITY(1,1) PRIMARY KEY,
    GameID INT NOT NULL,
    GenreID INT NOT NULL,
    FOREIGN KEY (GameID) REFERENCES Games(GameID),
    FOREIGN KEY (GenreID) REFERENCES Genres(GenreID),
    CONSTRAINT UQ_GameGenres UNIQUE (GameID, GenreID)
);

-- Purchases
CREATE TABLE Purchases (
    PurchaseID INT IDENTITY(1,1) PRIMARY KEY,
    CustomerID INT NOT NULL,
    PurchaseDate DATETIME2 NOT NULL DEFAULT GETDATE(),
    Status VARCHAR(20) NOT NULL DEFAULT 'Completed',
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
    CHECK (Status IN ('Pending', 'Completed', 'Cancelled'))
);

-- PurchaseItems
CREATE TABLE PurchaseItems (
    PurchaseItemID INT IDENTITY(1,1) PRIMARY KEY,
    PurchaseID INT NOT NULL,
    GameID INT NOT NULL,
    PurchasePrice DECIMAL(10,2) NOT NULL CHECK (PurchasePrice >= 0),
    FOREIGN KEY (PurchaseID) REFERENCES Purchases(PurchaseID),
    FOREIGN KEY (GameID) REFERENCES Games(GameID),
    CONSTRAINT UQ_PurchaseItems UNIQUE (PurchaseID, GameID)
);

-- Reviews
CREATE TABLE Reviews (
    ReviewID INT IDENTITY(1,1) PRIMARY KEY,
    CustomerID INT NOT NULL,
    GameID INT NOT NULL,
    Rating INT NOT NULL CHECK (Rating BETWEEN 1 AND 5),
    ReviewText VARCHAR(1000),
    ReviewDate DATETIME2 NOT NULL DEFAULT GETDATE(),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
    FOREIGN KEY (GameID) REFERENCES Games(GameID),
    CONSTRAINT UQ_Reviews UNIQUE (CustomerID, GameID)
);

-- Verify Tables
SELECT TABLE_NAME
FROM INFORMATION_SCHEMA.TABLES
WHERE TABLE_TYPE = 'BASE TABLE'
ORDER BY TABLE_NAME;
