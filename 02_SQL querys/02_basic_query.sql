USE kolkata_restaurant_db;

-- Results
--  How many customers does the restaurant have?
-- How many orders were placed?
-- What is the total revenue?
-- Which payment method is most popular?
-- Which menu items are the most expensive?
-- Which ingredients need to be reordered? 

SELECT COUNT(*) AS total_customers
FROM customers;

SELECT COUNT(*) AS total_employees
FROM employees;

select count(*) as total_orders
from orders;

Select 
round(sum(total_bill),2) as Total_revenue
from orders;

Select round(avg(total_bill),2) as Avg_order_value
from orders;

SELECT
MAX(total_bill) AS highest_order
FROM orders;

select
min(total_bill) as lowest_order
from orders;

select
order_type,
count(*) as Total_orders
from orders
group by order_type;

select
order_status,
count(*) as Totals_orders
from orders
group by order_status;

select
payments.payment_mode,
count(*) as total_tansactions
from payments
group by payment_mode;

select
payments.payment_mode,
round(sum(amount),2) as revenue
from payments
group by payment_mode
order by revenue;

select 
item_name,
selling_price
from menu_items
order by selling_price desc
limit 10;

select
inventory.ingredient_name,
inventory.current_stock,
inventory.reorder_level
From inventory
where current_stock <= reorder_level;

