# Online Shop Database (SQL)

A small relational database for an online shop with analytical queries.

## Structure
- `customers` - shop customers
- `products` - catalog with categories and prices
- `orders` - orders linked to customers
- `order_items` - products inside each order (many-to-many)

## Files
- `schema.sql` - creates the tables with keys and constraints
- `data.sql` - sample data
- `queries.sql` - 6 business queries (JOIN, GROUP BY, LEFT JOIN, aggregation, date functions)

## How to run (SQLite)
```bash
sqlite3 shop.db < schema.sql
sqlite3 shop.db < data.sql
sqlite3 -header -column shop.db < queries.sql
```

## Skills practiced
Database design, primary and foreign keys, JOINs, aggregation, business reporting.

## About
Built as a learning project while studying Business Informatics.
