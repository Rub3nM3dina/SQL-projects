# Universe database

This project involves designing and building a SQLite relational database to model astronomical objects and their relationships. The following requirements must be followed in designing the 5 related tables:

- Each table should have a primary key.
- Each *primary key* should automatically increment. (Because I am working in SQLite, I will have to manually increment the primary key column. But if you use the commands in SQL Server or PostgresSQL, it will automatically increment)
- Each table should have a name column.
- You should use the **INT** data type for at least two columns that are not a primary key or foreign key.
- You should use the **NUMERIC** data type at least once.
- You should use the **BOOLEAN** data type on at least two columns.
- You should use the **TEXT** data type at least once.
- Each "star" should have a *foreign key* that references one of the rows in galaxy.
- Each "planet" should have a *foreign key* that references one of the rows in star.
- Each "moon" should have a *foreign key* that references one of the rows in planet.
- At least 2 columns per table should not accept **NULL** values.
- At least one column from each table should be required to be **UNIQUE**.
- All columns named *name* should be of type **VARCHAR**.

## Solution
The full documentation and code for this project is separated into two files:
- Contains detailed explanations of the database design, schema, queries, and usage instructions.
- SQL script with all table definitions, constraints, lookups, inserts, and comments.

Please refere to UNIVERSE-DOC.md for the complete narrative documentation for this database project. UNIVERSE-CODE.sql contains the full SQL implementation and can be used to recreate the database.
