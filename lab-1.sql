-- 1. Create Database
CREATE DATABASE Bank_System_220;


-- 2. Create tables
-- Table: Bank_Master
CREATE TABLE Bank_Master (
    Bank_Id INT PRIMARY KEY,
    Bank_Name VARCHAR(40),
    Bank_ShortName VARCHAR(10)
);

-- Table: Branch_Master
CREATE TABLE Branch_Master (
    Branch_Id INT PRIMARY KEY,
    Branch_Name VARCHAR(30),
    Branch_IFSC VARCHAR(11) UNIQUE,
    Bank_Id INT,
    FOREIGN KEY (Bank_Id) REFERENCES Bank_Master(Bank_Id)
);

-- Table: Employee_Master
CREATE TABLE Employee_Master (
    Emp_No INT PRIMARY KEY,
    Branch_IFSC VARCHAR(11),
    Emp_FullName VARCHAR(30),
    Emp_Designation VARCHAR(25),
    Emp_Manager_No BIGINT,
    Emp_Salary FLOAT,
    FOREIGN KEY (Branch_IFSC) REFERENCES Branch_Master(Branch_IFSC)
);

-- Table: Customer_Master
CREATE TABLE Customer_Master (
    Cust_Id INT PRIMARY KEY,
    Cust_FullName VARCHAR(30),
    Cust_DOB DATE,
    Cust_Address VARCHAR(80),
    Cust_MobileNo BIGINT,
    Cust_EmailID VARCHAR(30),
    Cust_City VARCHAR(20)
);

-- Table: Account_Master
CREATE TABLE Account_Master (
    Acc_No BIGINT PRIMARY KEY,
    Cust_Id INT,
    Acc_Type VARCHAR(7),
    Branch_IFSC VARCHAR(11),
    FOREIGN KEY (Cust_Id) REFERENCES Customer_Master(Cust_Id),
    FOREIGN KEY (Branch_IFSC) REFERENCES Branch_Master(Branch_IFSC),
    CHECK (Acc_Type IN ('SB', 'CR'))
);

-- Table: Transaction_Master
CREATE TABLE Transaction_Master (
    Tran_Id INT PRIMARY KEY,
    Tran_Acc_No BIGINT,
    Tran_Date DATETIME,
    Tran_Type VARCHAR(7),
    Tran_Amount_Debit_Credit VARCHAR(6),
    Tran_Amount FLOAT,
    FOREIGN KEY (Tran_Acc_No) REFERENCES Account_Master(Acc_No),
    CHECK (Tran_Type IN ('CH', 'CQ', 'OL', 'RG')),
    CHECK (Tran_Amount_Debit_Credit IN ('D', 'C'))
);

-- 3. Insert records

-- Table: Bank_Master
INSERT INTO Bank_Master (Bank_Id, Bank_Name, Bank_ShortName) VALUES
(101, 'State Bank of India', 'SBI'),
(102, 'Bank of India', 'BOI'),
(103, 'Bank of Baroda', 'BOB'),
(104, 'Punjab National Bank', 'PNB'),
(105, 'Central Bank of India', 'CBI');

-- Table: Branch_Master
INSERT INTO Branch_Master (Branch_Id, Branch_Name, Branch_IFSC, Bank_Id) VALUES
(201, 'Green Chowk, Morbi', 'SBI101MB201', 101),
(202, 'Lati Plot, Morbi', 'CBI105MB202', 105),
(203, 'Ravapar Road, Morbi', 'BOI102MB203', 102),
(204, 'Kalawad Road, Rajkot', 'PNB104RJ204', 104),
(205, 'Nanavati Chowk, Rajkot', 'BOB103RJ205', 103),
(206, 'Lal Darwaja, Ahemdabad', 'BOB103AM206', 103),
(207, 'Zanjar Cinema Road, Wankaner', 'PNB104WK207', 104),
(208, 'AksharDham Road, Ahemdabad', 'CBI105AM208', 105),
(209, 'Maharana Pratap Circle, Morbi', 'PNB104MB209', 104),
(210, 'Race Course Ring Road, Rajkot', 'SBI101RJ210', 101);

-- Table: Employee_Master
INSERT INTO Employee_Master (Emp_No, Branch_IFSC, Emp_FullName, Emp_Designation, Emp_Manager_No, Emp_Salary) VALUES
(301, 'SBI101MB201', 'Shashikant Das', 'Bank Manager', 9876543210, 250000),
(302, 'BOI102MB203', 'Dinesh Khara', 'Bank Manager', 8765432109, 45000),
(303, 'BOB103AM206', 'Nirav Modi', 'Loan Officer', 7654321098, 36500),
(304, 'CBI105AM208', 'Lalit Modi', 'Loan Officer', 6543210987, 70000),
(305, 'PNB104MB209', 'P.V. Sindhu', 'Credit Analyst', 5432109876, 65300),
(306, 'SBI101RJ210', 'Shikha Sharma', 'Credit Analyst', 4321098765, 56700),
(307, 'CBI105AM208', 'Archana Bhargav', 'Audit Officer', 3210987654, 60000),
(308, 'BOB103AM206', 'Arundhati Bhatt', 'Audit Officer', 2109876543, 55000),
(309, 'SBI101RJ210', 'Kalpana Moria', 'Finance Manager', 1098765432, 62500),
(310, 'CBI105AM208', 'Atul Goel', 'Finance Manager', 9876543201, 54000);

-- Table: Customer_Master
INSERT INTO Customer_Master (Cust_Id, Cust_FullName, Cust_DOB, Cust_Address, Cust_MobileNo, Cust_EmailID, Cust_City) VALUES
(401, 'C N Kanani', '1985-08-20', 'Milap Nagar, University Road', 2134567890, 'cnk@gmail.com', 'Gandhinagar'),
(402, 'A N Siddhpura', '1987-10-15', 'Royal Park, Ravapar road', 1243567890, 'ans@gmail.com', 'Ahemdabad'),
(403, 'V K Makwana', '1987-07-04', '150 Feet Ring Road', 1234567890, 'vkm@gmail.com', 'Ahemdabad'),
(404, 'H K Vyas', '1990-12-10', 'Madhapar Circle', 1234567809, 'hkv@gmail.com', 'Rajkot'),
(405, 'K B Bhalodia', '1996-03-25', 'Nanavati Chowk', 1234568790, 'kbb@gmail.com', 'Rajkot'),
(406, 'N H Patel', '1990-06-13', 'Ayodhya Chwok', 1234567980, 'nhp@gmail.com', 'Baroda'),
(407, 'T D Solanki', '1996-10-25', 'Bhaktinagar Circle', 9314567820, 'tds@gmail.com', 'Baroda'),
(408, 'N H Ahuja', '1994-09-15', 'Seth Nagar Road', 1234567089, 'nha@gmail.com', 'Jamnagar'),
(409, 'B K Chattrala', '1995-07-02', 'Trikon Baug', 1234568710, 'bkc@gmail.com', 'Jamnagar'),
(410, 'A B Pandya', '2000-08-20', 'Sanala Road', 1432567890, 'abp@gmail.com', 'Morbi');

-- Table: Account_Master
INSERT INTO Account_Master (Acc_No, Cust_Id, Acc_Type, Branch_IFSC) VALUES
(501, 401, 'SB', 'CBI105AM208'),
(502, 402, 'SB', 'CBI105AM208'),
(503, 403, 'SB', 'BOB103AM206'),
(504, 404, 'CR', 'BOB103RJ205'),
(505, 405, 'SB', 'SBI101RJ210'),
(506, 406, 'CR', 'BOB103AM206'),
(507, 407, 'CR', 'BOB103AM206'),
(508, 408, 'SB', 'PNB104RJ204'),
(509, 409, 'CR', 'SBI101RJ210'),
(510, 410, 'SB', 'SBI101MB201');

-- Table: Transaction_Master
INSERT INTO Transaction_Master (Tran_Id, Tran_Acc_No, Tran_Date, Tran_Type, Tran_Amount_Debit_Credit, Tran_Amount) VALUES
(601, 501, '2022-11-22 00:00:00:000', 'CH', 'C', 500000),
(602, 503, '2018-10-15 00:00:00:000', 'CQ', 'D', 25020),
(603, 506, '2017-12-01 00:00:00:000', 'OL', 'C', 200000),
(604, 510, '2021-03-03 00:00:00:000', 'RG', 'D', 25000),
(605, 504, '2021-11-10 00:00:00:000', 'CH', 'C', 65000),
(606, 502, '2022-05-15 00:00:00:000', 'CQ', 'C', 24571),
(607, 509, '2020-01-26 00:00:00:000', 'OL', 'C' ,69704),
(608,507 ,'2009-07-04 00:00:00:000', 'RG','D', 30000),
(609, 508, '2015-10-16 00:00:00.000','CH' ,'D', 70050),
(610, 505, '2022-08-20 00:00:00.000', 'CQ' ,'C' ,26320);
