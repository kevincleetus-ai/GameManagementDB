
USE GameManagementDB;
GO

-- PART 2: DATA MANIPULATION (INSERT)

-- Customers
INSERT INTO Customers (FirstName, LastName, Email)
VALUES
('Jason', 'Duval', 'jason.duval@example.com'),
('Lucia', 'Caminos', 'lucia.caminos@example.com'),
('Cal', 'Hampton', 'cal.hampton@example.com'),
('Boobie', 'Ike', 'boobie.ike@example.com'),
('David', 'Wilson', 'david.wilson@example.com'),
('Jessica', 'Taylor', 'jessica.taylor@example.com'),
('Daniel', 'Anderson', 'daniel.anderson@example.com'),
('Olivia', 'Thomas', 'olivia.thomas@example.com'),
('James', 'Martinez', 'james.martinez@example.com'),
('Sophia', 'Garcia', 'sophia.garcia@example.com'),
('William', 'Moore', 'william.moore@example.com'),
('Isabella', 'Jackson', 'isabella.jackson@example.com'),
('Alexander', 'Martin', 'alexander.martin@example.com'),
('Mia', 'Lee', 'mia.lee@example.com'),
('Benjamin', 'White', 'benjamin.white@example.com'),
('Charlotte', 'Harris', 'charlotte.harris@example.com'),
('Ethan', 'Clark', 'ethan.clark@example.com'),
('Amelia', 'Lewis', 'amelia.lewis@example.com'),
('Lucas', 'Walker', 'lucas.walker@example.com'),
('Harper', 'Hall', 'harper.hall@example.com');

SELECT * FROM Customers;

-- Games
INSERT INTO Games (Title, Description, Price, ReleaseDate)
VALUES
('The Witcher 3: Wild Hunt', 'Open-world fantasy RPG.', 39.99, '2015-05-19'),
('Cyberpunk 2077', 'Open-world futuristic action RPG.', 59.99, '2020-12-10'),
('Elden Ring', 'Action RPG in a dark fantasy world.', 59.99, '2022-02-25'),
('Red Dead Redemption 2', 'Open-world western adventure.', 59.99, '2018-10-26'),
('Minecraft', 'Sandbox building and survival game.', 29.99, '2011-11-18'),
('Stardew Valley', 'Farming and life simulation game.', 14.99, '2016-02-26'),
('Hollow Knight', 'Exploration-focused action platformer.', 14.99, '2017-02-24'),
('Resident Evil 4', 'Survival horror action game.', 39.99, '2023-03-24'),
('Baldurs Gate 3', 'Fantasy role-playing adventure.', 59.99, '2023-08-03'),
('Portal 2', 'First-person puzzle adventure.', 9.99, '2011-04-19'),
('Grand Theft Auto V', 'Open-world crime action game.', 29.99, '2013-09-17'),
('Hades', 'Roguelike action dungeon crawler.', 24.99, '2020-09-17'),
('Silent Hill 2', 'Psychological survival horror game.', 69.99, '2024-10-08'),
('Civilization VI', 'Turn-based strategy game.', 59.99, '2016-10-21'),
('Terraria', 'Sandbox adventure and crafting game.', 9.99, '2011-05-16'),
('Grand Theft Auto VI', 'Open-world action adventure set in Vice City and Leonida.', 69.99, '2026-11-19');

SELECT * FROM Games;

-- Genres
INSERT INTO Genres (GenreName)
VALUES
('RPG'),
('Action'),
('Adventure'),
('Horror'),
('Simulation'),
('Strategy'),
('Puzzle'),
('Sandbox');

SELECT * FROM Genres;

-- GameGenres
INSERT INTO GameGenres (GameID, GenreID)
VALUES
(1, 1), (1, 3),
(2, 1), (2, 2),
(3, 1), (3, 2),
(4, 2), (4, 3),
(5, 3), (5, 8),
(6, 5), (6, 1),
(7, 2), (7, 3),
(8, 4), (8, 2),
(9, 1), (9, 6),
(10, 7), (10, 3),
(11, 2), (11, 3),
(12, 2), (12, 1),
(13, 4), (13, 3),
(14, 6),
(15, 8), (15, 3),
(16, 2), (16, 3);

SELECT * FROM GameGenres;

-- Purchases
INSERT INTO Purchases (CustomerID, PurchaseDate, Status)
VALUES
(1, '2026-01-10', 'Completed'),
(2, '2026-01-15', 'Completed'),
(3, '2026-02-02', 'Completed'),
(4, '2026-02-12', 'Completed'),
(5, '2026-03-05', 'Completed'),
(6, '2026-03-18', 'Completed'),
(7, '2026-04-01', 'Completed'),
(8, '2026-04-11', 'Completed'),
(9, '2026-04-25', 'Completed'),
(10, '2026-05-08', 'Completed'),
(11, '2026-05-20', 'Completed'),
(12, '2026-06-04', 'Completed'),
(13, '2026-06-17', 'Completed'),
(14, '2026-07-09', 'Completed'),
(15, '2026-07-22', 'Completed'),
(16, '2026-08-03', 'Completed'),
(17, '2026-08-16', 'Completed'),
(18, '2026-09-01', 'Completed'),
(19, '2026-09-19', 'Completed'),
(20, '2026-10-05', 'Completed');

SELECT * FROM Purchases;

-- PurchaseItems
INSERT INTO PurchaseItems (PurchaseID, GameID, PurchasePrice)
VALUES
(1, 11, 29.99),
(1, 4, 59.99),
(2, 13, 69.99),
(2, 8, 39.99),
(3, 5, 29.99),
(4, 16, 69.99),
(5, 1, 39.99),
(5, 3, 59.99),
(6, 2, 59.99),
(7, 9, 59.99),
(8, 6, 14.99),
(9, 3, 59.99),
(9, 12, 24.99),
(10, 10, 9.99),
(11, 14, 59.99),
(12, 7, 14.99),
(13, 4, 59.99),
(13, 11, 29.99),
(14, 15, 9.99),
(15, 1, 39.99),
(16, 8, 39.99),
(17, 2, 59.99),
(18, 9, 59.99),
(18, 6, 14.99),
(19, 12, 24.99),
(20, 5, 29.99);

SELECT * FROM PurchaseItems;

-- Reviews
INSERT INTO Reviews (CustomerID, GameID, Rating, ReviewText)
VALUES
(1, 11, 5, 'Excellent open-world experience.'),
(1, 4, 5, 'Amazing story and characters.'),
(2, 13, 5, 'Fantastic psychological horror.'),
(2, 8, 4, 'Great remake with intense gameplay.'),
(3, 5, 5, 'Endless creativity and exploration.'),
(4, 16, 5, 'Great open-world adventure.'),
(5, 1, 5, 'One of the best RPG experiences.'),
(6, 2, 4, 'Excellent atmosphere and world design.'),
(7, 9, 5, 'Incredible characters and storytelling.'),
(8, 6, 5, 'Relaxing and enjoyable gameplay.'),
(9, 3, 5, 'Challenging but very rewarding.'),
(10, 10, 5, 'Creative puzzles and excellent writing.'),
(11, 14, 4, 'Very engaging strategy gameplay.'),
(12, 7, 5, 'Beautiful art style and challenging combat.'),
(13, 4, 5, 'A memorable western adventure.');

SELECT * FROM Reviews;

-- Verify Inserted Data
SELECT 'Customers' AS TableName, COUNT(*) AS Total FROM Customers
UNION ALL
SELECT 'Games', COUNT(*) FROM Games
UNION ALL
SELECT 'Genres', COUNT(*) FROM Genres
UNION ALL
SELECT 'GameGenres', COUNT(*) FROM GameGenres
UNION ALL
SELECT 'Purchases', COUNT(*) FROM Purchases
UNION ALL
SELECT 'PurchaseItems', COUNT(*) FROM PurchaseItems
UNION ALL
SELECT 'Reviews', COUNT(*) FROM Reviews;

-- PART 2: DATA MANIPULATION (UPDATE)

BEGIN TRANSACTION;

UPDATE Customers
SET IsActive = 0
WHERE CustomerID = 20;

UPDATE Games
SET Price = 49.99
WHERE GameID = 2;

-- Verify Updates
SELECT * FROM Customers WHERE CustomerID = 20;
SELECT * FROM Games WHERE GameID = 2;

ROLLBACK TRANSACTION;

-- PART 2: DATA MANIPULATION (DELETE)

BEGIN TRANSACTION;

INSERT INTO Customers (FirstName, LastName, Email)
VALUES ('Test', 'Customer', 'test.customer@example.com');

-- Before Deletion
SELECT * FROM Customers
WHERE Email = 'test.customer@example.com';

DELETE FROM Customers
WHERE Email = 'test.customer@example.com';

-- After Deletion
SELECT * FROM Customers
WHERE Email = 'test.customer@example.com';

ROLLBACK TRANSACTION;

-- PART 2: DATA MANIPULATION (TRUNCATE)

SELECT *
INTO GamesBackup
FROM Games;

BEGIN TRANSACTION;

-- Before Truncation
SELECT * FROM GamesBackup;

TRUNCATE TABLE GamesBackup;

-- After Truncation
SELECT * FROM GamesBackup;

ROLLBACK TRANSACTION;

-- Verify Restoration
SELECT * FROM GamesBackup;

DROP TABLE GamesBackup;
