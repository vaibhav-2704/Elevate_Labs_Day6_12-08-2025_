# 📊 Day 6 – Monthly Revenue & Order Volume Analysis (Elevate Labs Internship)

## 📌 Objective
Analyze **monthly revenue** and **order volume** from the `online_sales` dataset using MySQL, following the given task hints and best practices.

---

## 📂 Dataset
We used two CSV files from the **Online Sales Dataset**:
🔗 https://www.kaggle.com/datasets/samruddhi4040/online-sales-data?select=Details.csv

1. **Orders.csv**
   - `Order ID`
   - `Order Date`
   - `Customer Name`
   - `State`
   - `City`

2. **Details.csv**
   - `Order ID`
   - `Amount`
   - `Profit`
   - `Quantity`
   - `Category`
   - `Sub-Category`
   - `Payment Mode`

---

## 🛠 Steps Performed

### 1️⃣ Database & Tables
- Created `online_sales` database.
- Created `orders` and `details` tables with correct column types.
- Imported `Orders.csv` and `Details.csv` into MySQL Workbench.

### 2️⃣ Date Conversion
- Converted `Order Date` from `DD-MM-YYYY` format to proper `DATE` format.
- Handled multiple date formats using `STR_TO_DATE()` with conditional parsing.

### 3️⃣ Data Join
- Joined `orders` and `details` tables using `order_id` to combine date and amount.

### 4️⃣ Queries Implemented
- **Monthly Revenue & Order Volume** using:
  - `EXTRACT(MONTH FROM order_date)` and `EXTRACT(YEAR FROM order_date)`
  - `SUM(amount)` for revenue
  - `COUNT(DISTINCT order_id)` for order volume
  - `ORDER BY` for sorting
- **Filtered Analysis** using `WHERE` with `BETWEEN` for specific date ranges.
- **Extra Metric**: Calculated **Average Order Value (AOV)**.

---

## 📜 SQL Highlights
```sql
SELECT 
    EXTRACT(YEAR FROM o.order_date) AS year,
    EXTRACT(MONTH FROM o.order_date) AS month,
    SUM(d.amount) AS monthly_revenue,
    COUNT(DISTINCT o.order_id) AS order_volume
FROM orders o
JOIN details d
    ON o.order_id = d.order_id
GROUP BY year, month
ORDER BY year, month;
````

---

## 📈 Output

* Monthly revenue trends
* Monthly order volume trends
* Average order value insights
* Filtered reports for specific time periods

---

## 📌 Tools Used

* **MySQL Workbench** – for database creation, importing CSVs, and running SQL queries
* **Kaggle Dataset** – Online Sales Dataset (Orders & Details tables)

---

## 🚀 Key Learnings

* Handling multiple date formats in SQL
* Joining multiple tables for combined analysis
* Grouping and aggregating data effectively
* Applying internship task hints to real-world datasets

## ✍️ Author

***SALOORA VAIBHAV***

Do you want me to also **add example output tables or screenshots** from MySQL Workbench into this README so it looks more professional on GitHub? That would make it visually stronger.
```
