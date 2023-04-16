-- Creating database schema and Table relationships for the logistic company's data
create database dbschema

-- 1)
-- Creating the customer table (information of the customers or clients) by importing from csv
select * from Customer

-- After importing the data from csv, modifying the data type, constraints, assigning keys
-- Modifying C_ID to NOT NULL Constraint and INT Data type
ALTER TABLE Customer
ALTER COLUMN C_ID INT NOT NULL;

-- Modifying M_ID to INT Data type
ALTER TABLE Customer
ALTER COLUMN M_ID INT;

-- Modifying C_ADDR to VARCHAR(100) Data type
ALTER TABLE Customer
ALTER COLUMN C_ADDR VARCHAR(100);

-- Assigning C_ID As PRIMARY KEY
ALTER TABLE Customer
ADD PRIMARY KEY (C_ID);

-- Referencing M_ID As Foreign Key
ALTER TABLE Customer
ADD FOREIGN KEY (M_ID) REFERENCES Membership(M_ID)

-- 2)
-- Creating the Employee_Details table (information of the employees) by importing from csv
select * from Employee_Details

-- After importing the data from csv, modifying the data type, constraints, assigning keys
-- Modifying E_ID to NOT NULL Constrainta and INT Data type
ALTER TABLE Employee_Details
ALTER COLUMN E_ID INT NOT NULL;

-- Modifying E_ADDR to VARCHAR(100) Data type
ALTER TABLE Employee_Details
ALTER COLUMN E_ADDR VARCHAR(100);

-- Assigning E_ID As PRIMARY KEY
ALTER TABLE Employee_Details
ADD PRIMARY KEY (E_ID);

-- 3)
-- Creating the employee_manages_shipment table (Relation between employee and shipment table)
--  by importing from csv
select * from employee_manages_shipment

-- After importing the data from csv, modifying the data type, constraints, assigning keys
-- Modifying Employee_E_ID to INT data type
ALTER TABLE employee_manages_shipment
ALTER COLUMN Employee_E_ID INT;

-- Referencing Employee_E_ID As Foreign Key
ALTER TABLE employee_manages_shipment
ADD FOREIGN KEY (Employee_E_ID) REFERENCES Employee_Details(E_ID)

-- Referencing Shipment_SH_ID As Foreign Key
ALTER TABLE employee_manages_shipment
ADD FOREIGN KEY (Shipment_SH_ID) REFERENCES Shipment_Details(SH_ID)

-- Referencing Status_SH_ID As Foreign Key From Status table
ALTER TABLE employee_manages_shipment
ADD FOREIGN KEY (Status_SH_ID) REFERENCES Status(SH_ID)

-- 4)
-- Creating the Membership table (Membership details of customer or client) by importing from csv
select * from Membership

-- After importing the data from csv, modifying the data type, constraints, assigning keys
-- Modifying M_ID to NOT NULL Constraint and INT Data type
ALTER TABLE Membership
ALTER COLUMN M_ID INT NOT NULL;

-- Assigning M_ID As PRIMARY KEY
ALTER TABLE Membership
ADD PRIMARY KEY (M_ID);

-- Modifying Start_date to TEXT Data type
ALTER TABLE Membership
ALTER COLUMN Start_date TEXT;

-- Modifying End_date to TEXT Data type
ALTER TABLE Membership
ALTER COLUMN End_date TEXT;

-- 5)
-- Creating the Payment_Details table (Contains the payment details) by importing from csv
select * from Payment_Details

-- After importing the data from csv, modifying the data type, constraints, assigning keys
-- Modifying Payment_ID to NOT NULL Constraint and VARCHAR(40) data type
ALTER TABLE Payment_Details
ALTER COLUMN Payment_ID VARCHAR(40) NOT NULL;

-- Assigning Payment_ID As PRIMARY KEY
ALTER TABLE Payment_Details
ADD PRIMARY KEY (Payment_ID);

-- Modifying Amount to INT Data type
ALTER TABLE Payment_Details
ALTER COLUMN AMOUNT INT;

-- Modifying Payment_date to TEXT Data type
ALTER TABLE Payment_Details
ALTER COLUMN Payment_Date TEXT;

-- Modifying C_ID to INT Data type
ALTER TABLE Payment_Details
ALTER COLUMN C_ID INT;

-- Referencing SH_ID As Foreign Key
ALTER TABLE Payment_Details
ADD FOREIGN KEY (SH_ID) REFERENCES Shipment_Details(SH_ID)

-- Referencing C_ID As Foreign Key
ALTER TABLE Payment_Details
ADD FOREIGN KEY (C_ID) REFERENCES Customer(C_ID)

-- 6)
-- Creating the Shipment_Details table (Relation between employee and shipment table)
--  by importing from csv
select * from Shipment_Details

-- Modifying SH_ID to NOT NULL Constraint and VARCHAR(50) Data type
ALTER TABLE Shipment_Details
ALTER COLUMN SH_ID VARCHAR(50) NOT NULL;

-- Assigning SH_ID As PRIMARY KEY
ALTER TABLE Shipment_Details
ADD PRIMARY KEY (SH_ID);

-- Modifying SH_CHARGES To INT Data type
ALTER TABLE Shipment_Details
ALTER COLUMN SH_CHARGES INT;

-- Modifying SR_ADDR to VARCHAR(100) Data type
ALTER TABLE Shipment_Details
ALTER COLUMN SR_ADDR VARCHAR(100);

-- Modifying DS_ADDR to VARCHAR(100) Data type
ALTER TABLE Shipment_Details
ALTER COLUMN DS_ADDR VARCHAR(100);

-- Modifying C_ID to INT Data type
ALTER TABLE Shipment_Details
ALTER COLUMN C_ID INT;

-- Referencing C_ID As Foreign Key
ALTER TABLE Shipment_Details
ADD FOREIGN KEY (C_ID) REFERENCES Customer(C_ID)

-- 7)
-- Creating the Status table (Relation between employee and shipment table) by importing from csv
select * from Status

-- Modifying SH_ID to NOT NULL Constraint and VARCHAR(50) Data type
ALTER TABLE Status
ALTER COLUMN SH_ID VARCHAR(50) NOT NULL;

-- Assigning SH_ID As PRIMARY KEY
ALTER TABLE Status
ADD PRIMARY KEY (SH_ID);

-- Modifying Sent_date to TEXT Data type
ALTER TABLE Status
ALTER COLUMN Sent_date TEXT;

-- Modifying Delivery_date to TEXT Data type
ALTER TABLE Status
ALTER COLUMN Delivery_date TEXT;


-- Sample queries
--1) 
select * from Customer
Inner Join Membership 
ON Customer.M_ID = Membership.M_ID

--2) 
select * from Customer
Inner Join Payment_Details 
ON Customer.M_ID = Payment_Details.C_ID

