# 🗄️ Module 01: Zero-Trust Azure SQL Database & Dynamic Data Masking

## 📌 Overview
This module demonstrates a **Zero-Trust data architecture** in Azure SQL Database. 
It focuses on enforcing the **Principle of Least Privilege (PoLP)** and protecting sensitive Personally Identifiable Information (PII) at rest using **Dynamic Data Masking (DDM)** without altering the underlying raw data.

---

## 🏗️ Architecture & Security Controls

Zero-Trust Access Control: Implements role-based separation between database administrators and low-privileged application users.
Dynamic Data Masking (DDM): Obfuscates sensitive customer attributes (such as email addresses, credit card numbers, 
  or social security numbers) in query results for unprivileged users.
Isolated Infrastructure: Deployed inside `rg-cloudshield-prod` with secure networking controls.

---

## 📂 File Breakdown

| File Name - Purpose |

 `01_create_customers.sql` - Builds the `Customers` schema, inserts test seed data, and applies DDM rules on sensitive columns. 
 `02_test_low_privileged_user.sql` - Executes context-switching (`EXECUTE AS USER`) to validate that unprivileged users receive masked outputs while admins see full data. 
 `images/rg-cloudshield.png` - Architecture screenshot showing the Azure SQL deployment inside the resource group. 
 `images/Masked.png` - Verification screenshot confirming data masking in action during query execution. 

---

## 🧪 Implementation & Verification Steps

### 1. Schema & Masking Deployment
The script `01_create_customers.sql` creates the target database structure and applies built-in Azure SQL masking functions:

```sql
-- Example Dynamic Data Masking syntax used in project
ALTER TABLE Customers 
ALTER COLUMN Email ADD MASKED WITH (FUNCTION = 'email()');
