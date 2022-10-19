CREATE TABLE TIME(
TIME_ID INTEGER,
DAY VARCHAR(3),
MONTH VARCHAR(3),
QUARTER INTEGER,
YEAR INTEGER,
PRIMARY KEY (TIME_ID));

CREATE TABLE ITEM(
ITEM_KEY VARCHAR(10),
ITEM_NAME VARCHAR(40),
BRAND VARCHAR(20),
SOLD_BY VARCHAR(30),
ITEM_GROUP CHAR,
PRIMARY KEY (ITEM_KEY));

CREATE TABLE BRANCH(
BRANCH_ID INTEGER,
BRANCH_NAME VARCHAR(40),
OWNER VARCHAR(30),
PRIMARY KEY (BRANCH_ID));

CREATE TABLE CUSTOMERS(
CUST_ID INTEGER,
First_Name VARCHAR(15),
Last_Name VARCHAR(15),
Phone INTEGER,
Email VARCHAR(30),
LOCATION_ID INTEGER,
PRIMARY KEY(CUST_ID),
FOREIGN KEY(LOCATION_ID) REFERENCES LOCATION);

CREATE TABLE LOCATION(
LOCATION_ID INTEGER,
LOCATION_NAME VARCHAR(40),
STATE VARCHAR(30),
PINCODE INTEGER,
PRIMARY KEY (LOCATION_ID));

CREATE TABLE SalesInfoTable(
SALES_ORDER_ID INTEGER,
ITEM_KEY VARCHAR(10),
TIME_ID INTEGER,
BRANCH_ID INTEGER,
CUST_ID INTEGER,
QUANTITY_SOLD INTEGER,
AMOUNT_SOLD INTEGER,
PRIMARY KEY (SALES_ORDER_ID),
FOREIGN KEY(CUST_ID) REFERENCES CUSTOMERS,
FOREIGN KEY(TIME_ID) REFERENCES TIME,
FOREIGN KEY(ITEM_KEY) REFERENCES ITEM,
FOREIGN KEY(BRANCH_ID) REFERENCES BRANCH);