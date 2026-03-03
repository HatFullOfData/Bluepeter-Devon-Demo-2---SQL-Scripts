-- Create OrderLines Table for Microsoft Fabric Warehouse
CREATE TABLE OrderLines (
    OrderLineID BIGINT IDENTITY NOT NULL,
    OrderID BIGINT NOT NULL,
    ProductID BIGINT NOT NULL,
    Quantity INT NOT NULL,
    UnitPrice DECIMAL(10, 2) NOT NULL,
    CreatedDate DATETIME2(6)
);

-- Sample insert statements
-- INSERT INTO OrderLines (OrderID, ProductID, Quantity, UnitPrice, CreatedDate)
-- VALUES (1, 1, 1, 999.99, GETDATE());

-- INSERT INTO OrderLines (OrderID, ProductID, Quantity, UnitPrice, CreatedDate)
-- VALUES (1, 3, 2, 29.99, GETDATE());

-- INSERT INTO OrderLines (OrderID, ProductID, Quantity, UnitPrice, CreatedDate)
-- VALUES (2, 2, 1, 249.99, GETDATE());