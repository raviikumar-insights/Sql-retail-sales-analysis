CREATE DATABASE  retail_sales;
Use retail_sales;

-- Import Data
SELECT * FROM SALES;

SELECT COUNT(*)
FROM sales;

-- Data Cleaning
ALTER TABLE sales CHANGE ï»¿transactions_id transaction_ID INT PRIMARY KEY;
ALTER TABLE sales CHANGE sale_data sale_date DATE;
ALTER TABLE sales CHANGE sale_time sale_time TIME;
ALTER TABLE sales CHANGE customer_id customer_id INT;
ALTER TABLE sales CHANGE gender gender VARCHAR(50);
ALTER TABLE sales CHANGE age age INT;
ALTER TABLE sales CHANGE category category VARCHAR(50);
ALTER TABLE sales CHANGE quantiy quantity INT ;
ALTER TABLE sales CHANGE price_per_unit price_per_unit FLOAT ;
ALTER TABLE sales CHANGE cogs cogs FLOAT;
ALTER TABLE sales CHANGE total_sale total_sale FLOAT; 

SELECT * FROM sales
WHERE 
	transaction_ID IS NULL
    OR
    sale_data IS NULL
    OR
    sale_time IS NULL
    OR 
    gender IS NULL
    OR 
    age IS NULL
    OR 
    category IS NULL
    OR
    quantity IS NULL
    OR 
    cogs IS NULL
    OR 
    total_sale IS NULL;
--
DELETE FROM sales
WHERE
	transaction_ID IS NULL
    OR
    sale_data IS NULL
    OR
    sale_time IS NULL
    OR 
    gender IS NULL
    OR 
    age IS NULL
    OR 
    category IS NULL
    OR
    quantity IS NULL
    OR 
    cogs IS NULL
    OR 
    total_sale IS NULL;
    
-- Data Exploration
SELECT * FROM SALES;
-- How many sales we have ?
SELECT COUNT(*) AS total_sales FROM sales;

-- How many unique customers we have ?
SELECT COUNT(DISTINCT customer_id) AS total_sales FROM sales;

SELECT DISTINCT category FROM sales;

-- Data Analysis & Business Key Problems & Answers

-- Write a SQL query to retrieve all columns for sales made on '2022-11-05'

SELECT * FROM sales
WHERE sale_date = '2022-11-05';

-- Write a SQL query to retrieve all transactions where the category is 'Clothing' and the quantity sold is more than 4 in the month of Nov-2022

SELECT * FROM sales
WHERE 
	category = 'Clothing'
    AND
    sale_date BETWEEN '2022-11-01' AND '2022-11-30'
    AND
    quantity >= 4;
    
-- Write a SQL query to calculate the total sales (total_sale) to each category

SELECT category , SUM(total_sale) AS net_sales , COUNT(*) AS total_order FROM sales
GROUP BY 1;

-- Write a SQL query to of find the average age of customers who purchased items from the 'Beauty' category

SELECT ROUND(AVG(age),2) AS Avg_age FROM sales
WHERE category = 'Beauty';

-- Write a SQL query to find all transactions where the total_sale is greater than 1000

SELECT * FROM sales
WHERE total_sale > 1000;

-- Write a SQL query to find the total number number of transactions (transaction_ID) made by each gender in each category

SELECT COUNT(transaction_ID) AS total_trans , gender, category FROM sales
GROUP BY gender,category;

-- Write a SQL query to calculate the average sale for each month.Find out best selling month in each year 
SELECT 
	year,
    month,
	total,rnk
FROM(
	SELECT   
		YEAR(sale_date) AS year,
		MONTH(sale_date) AS month,
        sum(total_sale) AS total,
		RANK() OVER (
				PARTITION BY YEAR(sale_date)
			    ORDER BY sum(total_sale) DESC) AS rnk
    FROM sales
    GROUP BY year , month
    ) AS t1
    WHERE rnk = 1 ;
    
-- Write a SQL query to find the top 5 customers based on the highest total sales

SELECT customer_id , SUM( total_sale) AS total_sales
FROM sales
GROUP BY 1
ORDER BY 2 DESC
LIMIT 5;

-- Write a SQL query to find the number of unique customers who purchased items from each category

SELECT COUNT(DISTINCT customer_id) AS unique_cust, category
FROM sales
GROUP BY 2;

-- Write a SQL query to create each shift and number of orders (Example Morning <12 , Afternoon Between 12 & 17 , Evening >17)

SELECT 
	CASE
		WHEN HOUR(sale_time) <12 THEN 
	'Morning'
		WHEN HOUR(sale_time) BETWEEN 12 AND 17
        THEN 'Afternoon'
			ELSE 'Evening'
		END AS shift,
        COUNT(transaction_ID) AS total_orders
	FROM sales
    GROUP by shift;