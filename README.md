# Bluepeter-Devon-Demo-2---SQL-Scripts

SQL scripts for Microsoft Fabric Warehouse - Party Products Database

## Quick Start Guide

Follow these steps to set up your complete party products database in Microsoft Fabric Warehouse.

### Step 1: Create Tables

Run these scripts **in order** to create your database schema:

1. `create_customer_table.sql` - Creates the Customer table
2. `create_products_table.sql` - Creates the Products table
3. `create_orders_table.sql` - Creates the Orders table
4. `create_orderlines_table.sql` - Creates the OrderLines table
5. `create_calendar_table.sql` - Creates and populates the Calendar table (2024-2026)

### Step 2: Insert Data

Run these scripts **in order** to populate your tables with sample data:

1. `insert_customers_data.sql` - Inserts 15 customers (restaurants, party planners, event organizers)
2. `insert_products_data.sql` - Inserts 22 party products (summer, winter, and year-round items)
3. `insert_orders_data.sql` - Inserts 52 orders with seasonal patterns (2024-2026)
4. `insert_orderlines_data.sql` - Inserts order line items linking orders to products

### What You'll Get

After running all scripts, your database will contain:

- **15 Customers**: 5 restaurants, 5 party planners, 5 event organizers
- **22 Products**: 
  - 7 summer products (garden lanterns, BBQ supplies, tiki torches, etc.)
  - 9 Christmas/New Year products (table runners, champagne flutes, crackers, etc.)
  - 6 year-round products (wine glasses, table covers, LED candles, etc.)
- **52 Orders**: Orders spanning 2024-2026 with clear seasonal patterns
- **Order Lines**: Detailed line items showing which products were ordered
- **Calendar**: 1,096 date records (Jan 1 2024 - Dec 31 2026) with date attributes

### Seasonal Patterns

The sample data demonstrates realistic seasonal trends:

- 🌞 **Summer Products** (June-August): High demand for outdoor party supplies
- 🎄 **Christmas/New Year Products** (November-January): Peak demand for festive decorations
- 📅 **Year-Round Products**: Consistent demand throughout the year

Perfect for analyzing seasonal sales patterns, inventory planning, and customer behavior!

## Documentation

- [Microsoft Fabric Warehouse SQL Restrictions](FABRIC_WAREHOUSE_RESTRICTIONS.md) - Important limitations and workarounds when writing SQL for Fabric Warehouse

## Important Notes

- All scripts follow Microsoft Fabric Warehouse restrictions (no defaults, no constraints, VARCHAR instead of NVARCHAR, etc.)
- The Calendar table auto-populates when created (no separate insert script needed)
- Order and OrderLine IDs are auto-generated using IDENTITY columns
- Sample data uses realistic UK business information