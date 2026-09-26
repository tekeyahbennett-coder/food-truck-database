# Food Truck Relational Database

A normalized relational database schema designed for a food truck business, built with SQL Server.

## Database Schema

**5 Tables:**

| Table | Description |
|-------|-------------|
| `FoodTruck` | Truck information and details |
| `MenuItems` | All available menu items with pricing |
| `Customers` | Customer records and contact info |
| `Orders` | Order headers linked to customers |
| `OrderItems` | Line items linking orders to menu items |

## Features

- Fully normalized relational design (3NF)
- IDENTITY-based primary keys on all tables
- Foreign key constraints enforcing referential integrity
- Supports full order lifecycle: browse menu → place order → track items
- Seed data (`seed_data.sql`) for 4 trucks, 16 menu items, 6 customers, and 8 orders
- Sample queries (`queries.sql`) covering joins, aggregates, and subqueries for real business questions (revenue by truck, best sellers, top customers, average order value)

## Tech Stack

- **Database:** SQL Server / T-SQL
- **Tools:** SQL Server Management Studio (SSMS)
- **Concepts:** Relational design, normalization, entity-relationship modeling, foreign keys, aggregate queries

## How to Run

1. Open SQL Server Management Studio
2. Connect to your SQL Server instance
3. Run `schema.sql` to create the database and all five tables with their foreign key relationships
4. Run `seed_data.sql` to populate the tables with sample data
5. Run any of the queries in `queries.sql` to explore the data (menu listings, order details, revenue by truck, best-selling items, top customers, and more)

## Author

Te'Keyah Bennett — [GitHub](https://github.com/tekeyahbennett-coder)
