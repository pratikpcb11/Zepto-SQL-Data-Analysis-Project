
# 📊 Zepto SQL Data Analysis Project

This SQL project focuses on analyzing product data from **Zepto**, a fast-commerce grocery platform, using **MySQL**. The objective was to clean, transform, and explore product-level data to uncover valuable insights related to pricing, stock, discounts, and category-wise trends.

---

## 📁 Dataset Overview

The dataset was sourced from **Kaggle** and was originally scraped from **Zepto’s official product listings**. It mimics what you’d typically encounter in a real-world **e-commerce inventory system**, including columns like product name, category, MRP, discounts, stock availability, and weight.

---

## 🧰 Tools & Technologies Used

* **MySQL 8.0 / MySQL Workbench** – For database creation, data manipulation, and query execution.
* **SQL** – For data cleaning, transformation, and exploratory analysis.
* **CSV File** – Used as the raw dataset for product information.
* **Git & GitHub** – For version control and project sharing.

---

## 🗃️ Database Setup

* Created a database `ZEPTO_SQL_PROJECT`.
* Created a table `zepto` with fields such as `sku_id`, `category`, `name`, `mrp`, `discountPercent`, `availableQuantity`, `discountSellingPrice`, `weightInGms`, `outOfStock`, and `quantity`.
* Imported data from a CSV file.
* Converted the `outOfStock` column from `'TRUE'/'FALSE'` strings to boolean `1/0` using a `CASE` statement.
* Scaled prices from paise to rupees by dividing `mrp` and `discountSellingPrice` by 100.

---

## 🧹 Data Cleaning Performed

* Removed rows with `mrp = 0` or `discountSellingPrice = 0`.
* Checked and filtered out `NULL` values from all important columns.
* Removed duplicates by checking for repeated product names with different `sku_id`s.

---

## 🔎 Data Exploration & Analysis

Executed various SQL queries to derive insights such as:

* ✅ **Row Count** and **Sample Data Preview**
* ✅ **Distinct Categories** and Product Name Duplicates
* ✅ **In-stock vs Out-of-stock Product Counts**
* ✅ **Out-of-stock Products with High MRP**
* ✅ **Revenue Estimation by Category**
* ✅ **Products with High MRP & Low Discounts**
* ✅ **Top Categories by Average Discount Percent**
* ✅ **Price per Gram Analysis** for value comparison
* ✅ **Product Weight Categorization** (Low / Medium / Bulk)
* ✅ **Total Inventory Weight per Category**

---

## 📈 Sample Business Questions Answered

1. **Top 10 products with the highest discount percentages**
2. **Out-of-stock products with high MRP**
3. **Estimated revenue by category**
4. **Best value products based on price per gram**
5. **Weight category classification (Low / Medium / Bulk)**
6. **Top categories offering the highest average discounts**
7. **Total inventory weight per category**

---

## 🧠 Key Learnings

* Practical use of **SQL for data analysis** and business decision-making.
* Handling **boolean values** and data type conversions in MySQL.
* Importance of **data cleaning** before analysis.
* Leveraging SQL queries for **KPI-based reporting** and insights.

---

## 🚀 How to Run the Project

1. Clone this repository.
2. Open MySQL Workbench or any SQL client.
3. Run the provided SQL script to:

   * Create the database and table.
   * Import and clean the data.
   * Execute analysis queries.
4. View results and modify queries for deeper analysis.

---

## 📂 Files Included

* `zepto_table_creation.sql` – SQL code for table creation and data import.
* `data_cleaning.sql` – Queries for cleaning and transforming raw data.
* `analysis_queries.sql` – All business and exploration queries.
* `zepto_data.csv` – The original dataset (if provided).

---


