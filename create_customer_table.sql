-- Create Customer Table (Company) for Microsoft Fabric Warehouse
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

-- Sample insert statement
-- INSERT INTO Customer (CompanyName, ContactPerson, Email, Phone, Website, Address, City, PostalCode, Country, TaxID, CreatedDate)
-- VALUES ('Acme Corporation', 'Jane Smith', 'contact@acme.com', '555-0123', 'www.acme.com', '456 Business Rd', 'London', 'EC1A 1BB', 'UK', 'GB123456789', GETDATE());