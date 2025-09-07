create database ZEPTO_SQL_PROJECT;
use ZEPTO_SQL_PROJECT;


create table zepto(
sku_id serial primary key,
category varchar(120),
name varchar(150) not null,
mrp numeric(8,2),
discountPercent numeric(5,2),
availableQuantity int,
discountSellingPrice numeric(8,2),
weightInGms int,
outOfStock varchar(5),
quantity int
);

SET SQL_SAFE_UPDATES = 0;
UPDATE zepto SET outOfStock = CASE
  WHEN outOfStock = 'TRUE' THEN 1
  WHEN outOfStock = 'FALSE' THEN 0
END;


-- data exploration
-- count of rows

select count(*) from zepto;

-- sample data
select * from zepto
limit 10;

-- null values
select * from zepto
where name is null
or
category is null
or
mrp is null
or
discountPercent is null
or
discountSellingPrice is null
or
weightInGms is null
or
availableQuantity is null
or
outOfStock is null
or
quantity is null;

-- different product categories

select distinct category
from zepto
order by category;

-- products in stock vs out of stock
select outOfStock , count(sku_id)
from zepto
Group By outOfStock;

-- product names present multiple times
select name ,count(sku_id) as 'Number Of SKUs'
from zepto
group by name
having count(sku_id) > 1
order by count(sku_id) desc;

-- data cleaning

-- products with price =0

select * from zepto 
where mrp=0 or discountSellingPrice=0;

delete from zepto 
where mrp=0;

-- convert paise to rupees

update zepto
set mrp = mrp/100.0,
discountSellingPrice = discountSellingPrice/100.0;

select mrp, discountSellingPrice from zepto ;

-- Q1.Find the top 10 best value products based on the discount percantage.
select distinct name, mrp , discountPercent
from zepto 
order by discountPercent desc
limit 10; 

-- Q2.What are the products with high mrp but out of stock.

select distinct name, mrp
from zepto 
where outOfStock = true and mrp>300
order by mrp desc;

-- Q3.Calculate Estimated Revenue for each category.
select category,
sum(discountSellingPrice * availableQuantity) as total_revenue
from zepto 
group by category
order by total_revenue;

-- Q4.Find all products where mrp is greater than 500 and dicouunt is less than 10%.
select distinct name, mrp, discountPercent
from zepto
where mrp>500 and discountPercent<10
order by mrp desc, discountPercent desc;

-- Q5.Identify the top 5 categories offering the highest average discount percent.
select category,
round(avg(discountPercent),2) as avg_discount
from zepto 
group by category
order by avg_discount desc
limit 5;

-- Q6.Find the price per gram for products above 100g and sort by best value.
select distinct name, weightInGms, discountSellingPrice,
round(discountSellingPrice/weightInGms,2) as price_per_gram
from zepto
where weightInGms >= 100
order by price_per_gram;

-- Q7.Group the products into categories like low, medium, bulk.
select distinct name, weightInGms,
case when weightInGms < 1000 then 'Low'
	when weightInGms < 5000 then 'Medium'
    else 'Bulk'
	end as weight_category
from zepto;

-- Q8.What is the Total Inventory Weight Per Category

select category,
sum(weightInGms * availableQuantity) as total_weight
from zepto 
group by category
order by total_weight;







