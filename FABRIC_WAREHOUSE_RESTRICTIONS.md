# Microsoft Fabric Warehouse SQL Restrictions

This document outlines the SQL restrictions discovered when creating tables in Microsoft Fabric Warehouse.

## Overview

Microsoft Fabric Warehouse uses a simplified T-SQL dialect optimized for analytical workloads. Several standard SQL Server features are not supported in CREATE TABLE statements.

## Discovered Restrictions

### 1. DEFAULT Constraints Not Supported

**❌ Not Supported:**
```sql
CreatedDate DATETIME2 DEFAULT GETDATE()
```

**✅ Workaround:**
```sql
CreatedDate DATETIME2(6)
-- Set values manually in INSERT statements using GETDATE()
```

### 2. PRIMARY KEY Constraints Not Supported

**❌ Not Supported:**
```sql
CONSTRAINT PK_Customer PRIMARY KEY NONCLUSTERED (CustomerID) NOT ENFORCED
```

**✅ Workaround:**
- No primary key definition in CREATE TABLE
- Handle uniqueness and primary key logic at the application level

### 3. UNIQUE Constraints Not Supported

**❌ Not Supported:**
```sql
CONSTRAINT UQ_Customer_Email UNIQUE (Email) NOT ENFORCED
```

**✅ Workaround:**
- No unique constraint in CREATE TABLE
- Enforce uniqueness at the application level

### 4. IDENTITY Columns Must Be BIGINT

**❌ Not Supported:**
```sql
CustomerID INT IDENTITY
```

**✅ Correct:**
```sql
CustomerID BIGINT IDENTITY
```

### 5. IDENTITY Cannot Specify SEED or INCREMENT

**❌ Not Supported:**
```sql
CustomerID BIGINT IDENTITY(1,1)
```

**✅ Correct:**
```sql
CustomerID BIGINT IDENTITY
```

### 6. NVARCHAR with Specified Length Not Supported

**❌ Not Supported:**
```sql
CompanyName NVARCHAR(100)
```

**✅ Correct:**
```sql
CompanyName VARCHAR(100)
```

### 7. DATETIME2 Requires Explicit Precision

**❌ Not Supported:**
```sql
CreatedDate DATETIME2
```

**✅ Correct:**
```sql
CreatedDate DATETIME2(6)  -- Precision must be 0-6
```

## Example: Valid Table Creation

```sql
CREATE TABLE Customer (
    CustomerID BIGINT IDENTITY NOT NULL,
    CompanyName VARCHAR(100) NOT NULL,
    ContactPerson VARCHAR(100),
    Email VARCHAR(100) NOT NULL,
    Phone VARCHAR(20),
    Website VARCHAR(100),
    Address VARCHAR(255),
    City VARCHAR(50),
    PostalCode VARCHAR(20),
    Country VARCHAR(50),
    TaxID VARCHAR(50),
    CreatedDate DATETIME2(6)
);
```

## Key Takeaways

- Fabric Warehouse focuses on analytical workloads, not transactional integrity
- Many constraints and defaults must be handled at the application level
- Identity columns have specific requirements (BIGINT, no seed/increment)
- Data types have stricter requirements (VARCHAR over NVARCHAR, explicit datetime precision)

---

*Last Updated: 2026-03-03*