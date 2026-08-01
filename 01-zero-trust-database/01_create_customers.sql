-- Create Customer Table
CREATE TABLE Customers (
    CustomerID INT IDENTITY(1,1) PRIMARY KEY,
    FullName VARCHAR(100),
    Email VARCHAR(100),
    CreditCard VARCHAR(19)
);

-- Insert Test Data
INSERT INTO Customers (FullName, Email, CreditCard)
VALUES 
('Alex Mercer', 'alex.mercer@example.com', '4532-1122-3344-5566'),
('Jordan Reed', 'jordan.reed@example.com', '5120-9988-7766-5544');

-- Verify Data
SELECT * FROM Customers;