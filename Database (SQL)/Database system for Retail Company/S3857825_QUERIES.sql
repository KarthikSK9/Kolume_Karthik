--1. Find the location details of all the customers who belong to Canberra. Output the Customer details.
SELECT CUST_ID,
       First_Name,
       Last_Name, Phone, Email
  FROM CUSTOMERS
       NATURAL JOIN
       LOCATION
WHERE LOCATION_NAME like 'Canberra';


--2. Find the Sales information of the list of the items delivered to customers. Output the Item and Customer details.
SELECT SALES_ORDER_ID,
       ITEM_KEY,
       ITEM_NAME,
       TIME_ID,
       CUST_ID,
       First_Name,
       Last_Name
  FROM SalesInfoTable
       NATURAL JOIN
       CUSTOMERS
       NATURAL JOIN
       ITEM;


--3. Find and output the Time and Item details delivered to customer named Tyson Ashley.
PRAGMA case_sensitive_like=1;
SELECT First_Name,
       Last_Name,
       ITEM_KEY,
       ITEM_NAME,
       BRAND,
       DAY,
       MONTH,
       YEAR
  FROM CUSTOMERS
       NATURAL JOIN
       SalesInfoTable
       NATURAL JOIN
       ITEM
       NATURAL JOIN
       TIME
 WHERE CUSTOMERS.First_Name LIKE 'Tyson' AND 
       CUSTOMERS.Last_Name LIKE 'Ashley';


--4. Find the list of the Customers who bought the maximum Quantity of items from the company. Output the customer and Item details.
SELECT Cust_ID,
       First_Name,
       Last_Name,
       ITEM_KEY,
       ITEM_NAME,
       BRAND,
       Quantity_Sold
  FROM CUSTOMERS
       NATURAL JOIN
       SalesInfoTable
       NATURAL JOIN
       ITEM
 WHERE QUANTITY_SOLD IN (
           SELECT max(Quantity_sold) 
             FROM SalesInfoTable
       );


--5. Find the the number of items delivered to location Melbourne in the year 2020
SELECT count(ITEM_KEY) AS Number_of_ITEMS_Delivered
  FROM LOCATION
       NATURAL JOIN
       CUSTOMERS
       NATURAL JOIN
       SalesInfoTable
       NATURAL JOIN
       ITEM
       NATURAL JOIN
       TIME
 WHERE location_name LIKE 'Melbourne' AND 
       Year = 2020;


--6. Find and output the Branch details which has made least amount in the year 2018
SELECT year,
       Branch_ID,
       min(Total) AS Least_Amount
  FROM (
           SELECT year,
                  BRANCH_ID,
                  sum(AMOUNT_SOLD) AS Total
             FROM salesInfoTable
                  NATURAL JOIN
                  TIME
            GROUP BY year
       )
       NATURAL JOIN
       Time
 WHERE year = 2018;

--7. Find and arrange the Items in decreasing order of Quantity sold.
SELECT DISTINCT ITEM_KEY,
                ITEM_NAME,
                BRAND,
                Quantity
  FROM ITEM
       NATURAL JOIN
       (
           SELECT sum(QUANTITY_SOLD) AS Quantity,
                  ITEM_KEY
             FROM SalesInfoTable
            GROUP BY ITEM_key
       )
 GROUP BY ITEM_KEY
 ORDER BY Quantity DESC;


--8. Find the items which are not bought by Shivakumar Kholi
SELECT item_key,
       ITEM_NAME,
       BRAND
  FROM ITEM
 WHERE ITEM_KEY NOT IN (
           SELECT ITEM_KEY
             FROM SalesInfoTable
            WHERE Sales_Order_ID IN (
                      SELECT Sales_Order_ID
                        FROM SalesInfoTable
                       WHERE CUST_ID IN (
                                 SELECT CUST_ID
                                   FROM CUSTOMERS
                                  WHERE First_Name LIKE 'Shivakumar' AND 
                                        Last_Name LIKE 'Kholi'
                             )
                  )
       );


--9. Find and output all the branches where the items have atleast 1 customer who belong to state victoria
SELECT *
  FROM BRANCH
 WHERE BRANCH_ID IN (
           SELECT DISTINCT Branch_ID
             FROM SalesInfoTable
            WHERE CUST_ID IN (
                      SELECT CUST_ID
                        FROM CUSTOMERS
                             NATURAL JOIN
                             LOCATION
                             NATURAL JOIN
                             SalesInfoTable
                       WHERE STATE LIKE 'Victoria'
                       GROUP BY CUST_ID
                      HAVING count( * ) >= 1
                  )
       );

       
          
--10. Find the customer from the state victoria who has made the maximum Amount of sale for the branch name Carlton 
--in the year 2020. Output the details Customer name,Item details in the ascending order.

SELECT CUST_ID,
       ITEM_KEY
  FROM LOCATION
       NATURAL JOIN
       CUSTOMERS
       NATURAL JOIN
       SalesInfoTable
       NATURAL JOIN
       TIME
       NATURAL JOIN
       BRANCH
 WHERE STATE LIKE 'Victoria' AND 
       Year = 2020 AND 
       BRANCH_NAME LIKE 'Carlton' AND 
       AMOUNT_SOLD IN (
           SELECT max(AMOUNT_SOLD) 
             FROM SalesInfoTable
       );








