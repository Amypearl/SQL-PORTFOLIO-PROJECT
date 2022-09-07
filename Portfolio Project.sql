-- Processing the data
SELECT * 
FROM portfolioproject.telecom_customer_churn;

-- Checking for duplicate values
SELECT DISTINCT (`Customer ID`)
FROM portfolioproject.telecom_customer_churn;

-- Replace blank values with a wildcard
SELECT 
CASE WHEN `Churn category`='' THEN NULL else '-' end AS `Churn category`,
CASE WHEN `Churn Reason`='' THEN NULL else '-' end AS `Churn Reason`,
CASE WHEN `Customer Status`='' THEN NULL else '-'end AS 'Customer Status'
From portfolioproject.telecom_customer_churn;

-- Analyze 
-- Cities with the most customers
SELECT City, Count(`Customer ID`) AS COUNT
FROM portfolioproject.telecom_customer_churn
GROUP BY City
ORDER BY COUNT DESC;

SELECT City, Count(`Customer ID`) AS COUNT
FROM portfolioproject.telecom_customer_churn
GROUP BY City
ORDER BY COUNT DESC;

-- Customer's Age range
SELECT MAX(Age) AS oldest, MIN(Age)AS youngest 
FROM portfolioproject.telecom_customer_churn;

-- Customer's distribution by Age
SELECT Age, COUNT(`Customer ID`) AS COUNT
FROM portfolioproject.telecom_customer_churn
GROUP BY Age
ORDER BY COUNT DESC;

-- Customer's distribution by gender
SELECT Gender, COUNT(`Customer ID`) AS COUNT
FROM portfolioproject.telecom_customer_churn
GROUP BY Gender;

-- Customer's Distribution by Marital status
SELECT Married, COUNT(`Customer ID`) AS COUNT
FROM portfolioproject.telecom_customer_churn
GROUP BY Married;

-- Customer's Distribution by customer status
SELECT `Customer status`, COUNT(`Customer ID`) AS COUNT
FROM portfolioproject.telecom_customer_churn
GROUP BY `Customer status`;

-- Company's stats at the end of the quarter
--- Total Revenue
SELECT ROUND(SUM(`Total revenue`),0) AS 'Total Revenue'
FROM portfolioproject.telecom_customer_churn;

-- Average Revenue per customer
SELECT ROUND(AVG(`Total revenue`),0) AS 'AVG Revenue'
FROM portfolioproject.telecom_customer_churn;

-- Total Revenue at the end of the first quarter
SELECT `Tenure in Months` AS QUARTER, ROUND(SUM(`Total Revenue`),0) AS 'Total Revenue'
FROM portfolioproject.telecom_customer_churn
GROUP BY Quarter
ORDER BY Quarter;

-- Number of customers who churned, joined and stayed in the last quarter
SELECT `Tenure in Months` AS MONTH,  COUNT(`Customer status`) AS COUNT, `Customer status`
FROM portfolioproject.telecom_customer_churn
WHERE `Customer status` = 'Churned'
OR `Customer status` = 'Joined'
OR `Customer status` = 'Stayed'
GROUP BY MONTH, `Customer Status`
ORDER BY MONTH;

-- Total long distance charges
SELECT ROUND(SUM(`Total Long distance charges`),0) AS 'Total long distance charges'
FROM portfolioproject.telecom_customer_churn;

-- Total charges
SELECT ROUND(SUM(`Total charges`),0) AS 'Total charges'
FROM portfolioproject.telecom_customer_churn;

-- Total Refunds
SELECT ROUND(SUM(`Total Refunds`),0) AS 'Total Refunds'
FROM portfolioproject.telecom_customer_churn;

-- Customer's distribution by their subscription
-- Customers who subsrcibed for phone services
SELECT `Phone Service`, COUNT(`Customer ID`) AS COUNT
FROM portfolioproject.telecom_customer_churn
GROUP BY `Phone Service`;

-- Customer's Distribution by Multiple lines
SELECT `Multiple lines`, COUNT(`Customer ID`) AS COUNT
FROM portfolioproject.telecom_customer_churn
GROUP BY `Multiple Lines`;

-- Customer's Distribution by Internet Services
SELECT `Internet Service`, COUNT(`Customer ID`) AS COUNT
FROM portfolioproject.telecom_customer_churn
GROUP BY `Internet Service`;

--  Customer's Distribution by Online Security
SELECT `Online Security`, COUNT(`Customer ID`) AS COUNT
FROM portfolioproject.telecom_customer_churn
GROUP BY `Online Security`;

--  Customer's Distribution by Online Back up
SELECT `Online Backup`, COUNT(`Customer ID`) AS COUNT
FROM portfolioproject.telecom_customer_churn
GROUP BY `Online Backup`;

--  Customer's Distribution by Internet type
SELECT `Internet type`, COUNT(`Customer ID`) AS COUNT
FROM portfolioproject.telecom_customer_churn
GROUP BY `Internet type`;

--  Customer's Distribution by Offer
SELECT Offer, COUNT(`Customer ID`) AS COUNT
FROM portfolioproject.telecom_customer_churn
GROUP BY Offer;

--  How many customers subscribed to device protection plan
SELECT `Device Protection Plan`, COUNT(`Customer ID`) AS COUNT
FROM portfolioproject.telecom_customer_churn
GROUP BY `Device Protection Plan`;

--  How many customers subscribed to premium tech support
SELECT `Premium Tech Support`, COUNT(`Customer ID`) AS COUNT
FROM portfolioproject.telecom_customer_churn
GROUP BY `Premium Tech Support`;

-- Identifying high value customers
-- Customers who generate the highest revenue are considered as high value customers
SELECT COUNT(`Total Revenue`) AS Revenue, Contract
FROM portfolioproject.telecom_customer_churn
GROUP BY Contract
ORDER BY Revenue DESC;

-- Customer Distribution by contract
SELECT DISTINCT (Contract), COUNT(Contract) AS COUNT
FROM portfolioproject.telecom_customer_churn
GROUP BY Contract
ORDER BY Contract DESC;

-- Customer Distribution by payment method
SELECT DISTINCT (`Payment Method`), COUNT(`payment method`) AS COUNT
FROM portfolioproject.telecom_customer_churn
GROUP BY `Payment Method`
ORDER BY COUNT DESC;

-- Which customer had the highest extra data charges
SELECT `Customer Status`, COUNT(`Total Extra Data Charges`) AS COUNT
FROM portfolioproject.telecom_customer_churn
GROUP BY `Customer Status`;

-- Highest Referral per customer
SELECT MAX(`Number of Referrals`) AS COUNT
FROM portfolioproject.telecom_customer_churn;

-- Number of Referrals
SELECT COUNT(`Number of Referrals`) AS COUNT
FROM portfolioproject.telecom_customer_churn
Where `Number of Referrals` =11;

-- How Many customers referred the company
SELECT COUNT(`Number of Referrals`) AS COUNT
FROM portfolioproject.telecom_customer_churn
Where `Number of Referrals` >=1;

-- Customer Churn Analysis
-- Number of churn customers
SELECT COUNT(`Customer Status`) AS 'CHURN CUSTOMERS'
FROM portfolioproject.telecom_customer_churn
Where `Customer Status` ='Churned';

-- Customer distribution by churn categories
SELECT `Churn Category`, COUNT(`Customer ID`) AS COUNT 
FROM portfolioproject.telecom_customer_churn
GROUP BY `Churn category`;

-- Age distribution of churn customers
SELECT DISTINCT (Age)AS Age, COUNT(Age) AS COUNT, `Customer Status` 
FROM portfolioproject.telecom_customer_churn
GROUP BY Age, `Customer Status`
Having `Customer status` ='Churned'
ORDER BY COUNT DESC;

-- Gender distribution of churn customers
SELECT DISTINCT (Gender)AS Gender, COUNT(Gender) AS COUNT, `Customer Status` 
FROM portfolioproject.telecom_customer_churn
GROUP BY Gender, `Customer Status`
Having `Customer status` ='Churned'
ORDER BY COUNT DESC;

-- Churned Customers and their contract type
SELECT DISTINCT (Contract)AS Contract, COUNT(Contract) AS COUNT, `Customer Status` 
FROM portfolioproject.telecom_customer_churn
GROUP BY Contract, `Customer Status`
Having `Customer status` ='Churned'
ORDER BY COUNT DESC;

-- Cities of Churned Customers
SELECT DISTINCT (City)AS City, COUNT(City) AS COUNT, `Customer Status` 
FROM portfolioproject.telecom_customer_churn
GROUP BY City, `Customer Status`
Having `Customer status` ='Churned'
ORDER BY COUNT DESC;

-- Reasons given by churstomers who discontinued their subscription (churned)
SELECT DISTINCT(`Churn Reason`), COUNT(`Churn Reason`) AS COUNT, `Customer Status` 
FROM portfolioproject.telecom_customer_churn
GROUP BY `Churn Reason`, `Customer Status`
Having `Customer status` ='Churned'
ORDER BY COUNT DESC;

-- Total monthly charge lost with churned customers
SELECT `Customer Status`, ROUND(SUM(`Monthly Charge`),0) AS 'Total Monthly Charges'
FROM portfolioproject.telecom_customer_churn
GROUP BY `Customer Status`
Having `Customer status` ='Churned';

-- Total Revenue lost with churned customers
SELECT `Customer Status`, ROUND(SUM(`Total Revenue`),0) AS 'Total Revenue'
FROM portfolioproject.telecom_customer_churn
GROUP BY `Customer Status`
Having `Customer status` ='Churned';

-- Getting rid of unwanted columns
ALTER TABLE telecom_customer_churn
DROP COLUMN `Zip Code`;
ALTER TABLE telecom_customer_churn
DROP COLUMN `Number of Dependents`;
ALTER TABLE telecom_customer_churn
DROP COLUMN Latitude;
ALTER TABLE telecom_customer_churn
DROP COLUMN Longitude;
ALTER TABLE telecom_customer_churn
DROP COLUMN `Paperless billing`;
ALTER TABLE telecom_customer_churn
DROP COLUMN `Streaming Movies`;
ALTER TABLE telecom_customer_churn
DROP COLUMN `Streaming Music`;
ALTER TABLE telecom_customer_churn
DROP COLUMN `Streaming Tv`;
