-- Create Orders Table for Microsoft Fabric Warehouse
CREATE TABLE Orders (
    OrderID BIGINT IDENTITY NOT NULL,
    CustomerID BIGINT NOT NULL,
    OrderDate DATETIME2(6) NOT NULL,
    OrderStatus VARCHAR(50) NOT NULL,
    TotalAmount DECIMAL(10, 2) NOT NULL,
    Notes VARCHAR(1000),
    CreatedDate DATETIME2(6),
    ModifiedDate DATETIME2(6)
);

-- Sample insert statements
-- INSERT INTO Orders (CustomerID, OrderDate, OrderStatus, TotalAmount, Notes, CreatedDate, ModifiedDate)
-- VALUES (1, GETDATE(), 'Pending', 1279.97, 'Rush delivery requested', GETDATE(), GETDATE());

-- INSERT INTO Orders (CustomerID, OrderDate, OrderStatus, TotalAmount, Notes, CreatedDate, ModifiedDate)
-- VALUES (2, GETDATE(), 'Processing', 249.99, NULL, GETDATE(), GETDATE());