# 📊 Retail Sales Analysis (SQL Project)

This project focuses on analyzing retail sales data using **SQL**.  
It includes data cleaning, exploration, and answering real-world business questions using SQL queries.

The goal of this project is to demonstrate strong SQL skills for **data analyst roles** by working on realistic transactional sales data.

---

## 🚀 Project Objectives

- Clean raw retail sales data
- Perform exploratory data analysis (EDA)
- Solve business problems using SQL queries
- Generate insights such as:
  - Best selling months
  - Top customers
  - Sales by category
  - Customer demographics

---

## 🗂️ Dataset Features

The dataset contains the following key fields:

- Transaction ID
- Sale Date & Time
- Customer ID
- Gender & Age
- Product Category
- Quantity Sold
- Price per Unit
- Cost of Goods Sold (COGS)
- Total Sale Amount

---

## 🧹 Data Cleaning Steps

The following cleaning operations were performed:

- Renamed incorrect column headers
- Fixed data types (DATE, TIME, INT, FLOAT)
- Removed rows with missing values
- Set primary key on `transaction_ID`

Example:
```sql
ALTER TABLE sales CHANGE sale_data sale_date DATE;
```

---

## 📈 Business Questions Solved

This project answers several real-world analytical questions:

- Total number of sales
- Unique customers count
- Best selling month in each year
- Top 5 customers by revenue
- Sales distribution by gender and category
- Shift-wise order analysis (Morning / Afternoon / Evening)

Example query:
```sql
SELECT customer_id , SUM(total_sale) AS total_sales
FROM sales
GROUP BY 1
ORDER BY 2 DESC
LIMIT 5;
```

---

## 🏗️ Project Structure

```
Retail-Sales-SQL/
│
├── data
   └──RETAIL_SALES.csv
├── sql
    └──RETAIL_SALES.sql
└── README.md
```

---

## 🧠 Key Insights Generated

- Identified highest revenue generating months
- Found top spending customers
- Observed sales variation across product categories
- Detected peak shopping hours

---

## 🛠️ Tools & Technologies Used

- **MySQL**
- SQL Window Functions
- Aggregate Functions
- Data Cleaning using SQL

---

## 📌 Skills Demonstrated

This project showcases:

- SQL data cleaning
- Data exploration
- Window functions
- Business analysis thinking
- Writing optimized analytical queries

---


## 👤 Author

**Ravi**  
Data Analyst | SQL | Python | Data Visualization
