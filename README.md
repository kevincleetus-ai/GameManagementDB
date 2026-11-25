# Digital Game Library & Customer Management System

A relational database project developed using **Microsoft SQL Server** and **SQL Server Management Studio (SSMS)**.

The system simulates a digital video game storefront, similar to Steam, where customers can purchase games, maintain a game library, and submit reviews. It demonstrates relational database design, SQL querying, data manipulation, transaction management, data integrity, and query optimization.

## Technologies Used

- Microsoft SQL Server
- SQL Server Management Studio (SSMS)
- Transact-SQL (T-SQL)
- dbdiagram.io
- GitHub

## Database Overview

The database, `GameManagementDB`, consists of seven interconnected tables:

| Table | Description |
|---|---|
| Customers | Stores customer details, emails, registration dates, and account status. |
| Games | Stores game titles, descriptions, prices, release dates, and availability. |
| Genres | Stores available video game genres. |
| GameGenres | Connects games with their genres through a many-to-many relationship. |
| Purchases | Records customer purchases, dates, and transaction statuses. |
| PurchaseItems | Stores individual games included in each purchase and their purchase prices. |
| Reviews | Stores customer ratings and written game reviews. |

### Database Relationships

The database uses primary keys and foreign keys to establish relationships between tables.

- One customer can make multiple purchases.
- One purchase can contain multiple games.
- One game can appear in multiple purchases.
- One game can belong to multiple genres.
- One genre can contain multiple games.
- Customers can submit reviews for games they have purchased.

Many-to-many relationships are implemented through the `GameGenres` and `PurchaseItems` junction tables.

### Entity Relationship Diagram

The ER diagram was created using dbdiagram.io and illustrates the tables, primary keys, foreign keys, and relationships.

![Database Entity Relationship Diagram](./Databases%20Project%20Schema.png)

## Sample Data

The database includes representative records for testing and demonstration.

| Table | Records |
|---|---:|
| Customers | 20 |
| Games | 16 |
| Genres | 8 |
| GameGenres | 31 |
| Purchases | 20 |
| PurchaseItems | 26 |
| Reviews | 15 |

The sample game catalog includes titles such as The Witcher 3, Cyberpunk 2077, Elden Ring, Minecraft, Red Dead Redemption 2, Silent Hill 2, and Grand Theft Auto VI.

The dataset is illustrative and is intended for educational use.

## SQL Features Implemented

### 1. Database Design

- Database and table creation
- Auto-incrementing primary keys
- Foreign key relationships
- Unique constraints
- CHECK constraints
- Default values
- Many-to-many relationships
- Relational database normalization principles

### 2. Data Manipulation

- `INSERT` to populate tables
- `UPDATE` to modify records
- `DELETE` to remove records based on conditions
- `TRUNCATE` to remove table records
- `ROLLBACK` to reverse temporary modifications

### 3. Data Retrieval

- `SELECT` queries
- Aggregate functions: `COUNT`, `SUM`, and `AVG`
- `GROUP BY`
- `ORDER BY ASC` and `DESC`
- Pagination using `OFFSET` and `FETCH NEXT`
- Subqueries
- Sales and customer spending analysis

### 4. JOINs and Views

- `INNER JOIN`
- `LEFT JOIN`
- Three-table and four-table JOINs
- Customer purchase history queries
- Game review queries
- `CustomerGameLibrary` view for displaying purchased games

### 5. SQL Programming

- Stored procedure for processing game purchases
- Scalar function for calculating customer spending
- Trigger for validating game reviews
- Manual transactions using `BEGIN TRANSACTION`, `COMMIT`, and `ROLLBACK`
- Error handling using `TRY...CATCH`

### 6. Database Optimization

- Unique and non-unique indexes
- Index verification using SQL Server system catalogs
- Query execution plan analysis
- Index Seek and Key Lookup operations
- I/O statistics using `SET STATISTICS IO ON`

### 7. Constraint Testing

The project includes tests demonstrating that SQL Server rejects invalid records.

| Constraint | Test |
|---|---|
| UNIQUE | Rejects duplicate customer email addresses |
| CHECK | Rejects negative game prices |
| CHECK | Rejects review ratings outside the range 1–5 |
| FOREIGN KEY | Rejects purchases referencing nonexistent customers |

## Project Files

| File | Description |
|---|---|
| `01_Database_Design.sql` | Creates the database, tables, and relationships |
| `02_Data_Manipulation.sql` | Inserts sample records and demonstrates UPDATE, DELETE, and TRUNCATE |
| `03_Data_Retrieval.sql` | Contains aggregate queries, grouping, sorting, pagination, and subqueries |
| `04_Joins_Views.sql` | Demonstrates JOIN operations and creates a database view |
| `05_Programming.sql` | Implements stored procedures, functions, triggers, and transactions |
| `06_Optimization.sql` | Creates indexes and demonstrates query performance analysis |
| `07_Constraint_Testing.sql` | Tests data integrity constraints |

## How to Run the Project

**Requirements:** Microsoft SQL Server and SQL Server Management Studio (SSMS).

1. Open SSMS and connect to a SQL Server instance.
2. Open `01_Database_Design.sql` and execute it to create `GameManagementDB` and its tables.
3. Execute `02_Data_Manipulation.sql` to populate the database and demonstrate data manipulation operations.
4. Execute `03_Data_Retrieval.sql` to explore the data.
5. Execute `04_Joins_Views.sql` to create and test the database view.
6. Execute `05_Programming.sql` to create and test the procedure, function, and trigger.
7. Execute `06_Optimization.sql` to create indexes and examine query performance.
8. Execute `07_Constraint_Testing.sql` to verify that invalid records are rejected.

**Important:** The database creation and initial sample-data inserts are intended for a fresh database. Do not rerun them against an already populated database. SQL demonstrations can be executed individually in SSMS.

To inspect actual execution plans, enable **Include Actual Execution Plan** in SSMS using `Ctrl + M`.

## Database Normalization

The database structure is designed around the first three normal forms:

- **First Normal Form (1NF):** Each column stores an atomic value, and each table has a primary key.
- **Second Normal Form (2NF):** Non-key attributes depend on the complete identifying key of their table.
- **Third Normal Form (3NF):** Customer information, game information, purchases, and genres are maintained in separate related tables to reduce redundant data and avoid transitive dependencies.

This organization helps maintain data consistency and makes the database easier to update and extend.

## Project Purpose

This project was developed to demonstrate the practical application of relational database concepts in a digital storefront environment.

It covers the database development process, from schema design and data population to querying, procedural SQL, integrity testing, and execution-plan analysis.

The project serves as an academic demonstration of Microsoft SQL Server database development and relational data management.
