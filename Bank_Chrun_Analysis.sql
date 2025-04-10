CREATE TABLE customers (
    CustomerID INT PRIMARY KEY,
    Surname VARCHAR(50),
    CreditScore INT,
    Geography VARCHAR(50),
    Gender VARCHAR(10),
    Age INT,
    Tenure INT,
    Balance FLOAT,
    NumOfProducts INT,
    HasCrCard INT,
    IsActiveMember INT,
    EstimatedSalary FLOAT,
    Exited INT
);

select * from customers;

-- Total number of customers
SELECT COUNT(*) as total_customers  FROM customers;

--Chruned Customers count
SELECT COUNT(*) AS churned_customers
FROM customers
WHERE Exited = 1;

--Churn Rate (in %)
SELECT 
  ROUND(100.0 * SUM(CASE WHEN Exited = 1 THEN 1 ELSE 0 END) / COUNT(*), 2) AS churn_rate_percent
FROM customers;

--Churn Rate by Geography
SELECT Geography, 
       COUNT(*) AS total_customers,
       SUM(CASE WHEN Exited = 1 THEN 1 ELSE 0 END) AS churned,
       ROUND(100.0 * SUM(CASE WHEN Exited = 1 THEN 1 ELSE 0 END) / COUNT(*), 2) AS churn_rate
FROM customers
GROUP BY Geography
ORDER BY churn_rate DESC;

--Churn Rate by Gender
SELECT Gender, 
       COUNT(*) AS total_customers,
       SUM(CASE WHEN Exited = 1 THEN 1 ELSE 0 END) AS churned,
       ROUND(100.0 * SUM(CASE WHEN Exited = 1 THEN 1 ELSE 0 END) / COUNT(*), 2) AS churn_rate
FROM customers
GROUP BY Gender;


--Churn Rate by Active Membership
SELECT IsActiveMember, 
       COUNT(*) AS total_customers,
       SUM(CASE WHEN Exited = 1 THEN 1 ELSE 0 END) AS churned,
       ROUND(100.0 * SUM(CASE WHEN Exited = 1 THEN 1 ELSE 0 END) / COUNT(*), 2) AS churn_rate
FROM customers
GROUP BY IsActiveMember;




