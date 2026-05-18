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

## Tech Stack

- **Database:** SQL Server / T-SQL
- **Tools:** SQL Server Management Studio (SSMS)
- **Concepts:** Relational design, normalization, entity-relationship modeling, foreign keys

## How to Run

1. Open SQL Server Management Studio
2. Connect to your SQL Server instance
3. Run `schema.sql` to create the database and tables
4. Run `seed.sql` to populate with sample data (if included)

## Author

Te'Keyah Bennett — [GitHub](https://github.com/tekeyahbennett-coder)
