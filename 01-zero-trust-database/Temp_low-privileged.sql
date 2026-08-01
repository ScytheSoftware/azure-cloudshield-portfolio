-- 1. Create a low-privileged test user without admin rights
CREATE USER TestUser WITHOUT LOGIN;
GRANT SELECT ON Customers TO TestUser;

-- 2. Run the query AS the test user to see the mask
EXECUTE AS USER = 'TestUser';
SELECT * FROM Customers;

-- 3. Switch back to your admin account
REVERT;