USE kolkata_restaurant_db;
-- Advanced SQL Queries (36-50)

-- Q36. Rank employees based on total revenue generated.
SELECT 
e.employee_name,
SUM(o.total_bill) AS revenue,
RANK() OVER(ORDER BY SUM(o.total_bill) DESC) AS employee_rank
 FROM employees e 
 JOIN orders o 
 ON e.employee_id=o.employee_id 
 GROUP BY e.employee_name;

-- Q37. Rank the top-selling menu items.
SELECT mi.item_name,
SUM(od.quantity) AS quantity_sold,
DENSE_RANK() OVER(ORDER BY SUM(od.quantity) DESC) AS item_rank 
FROM menu_items mi 
JOIN order_details od 
ON mi.item_id=od.item_id 
GROUP BY mi.item_name;

-- Q38. Show monthly revenue with a running total.
SELECT 
MONTH(order_date) AS month,
SUM(total_bill) AS monthly_revenue,
SUM(SUM(total_bill)) 
OVER(ORDER BY MONTH(order_date)) AS running_total 
FROM orders GROUP BY MONTH(order_date);

-- Q39. Find the second highest order value.
SELECT 
DISTINCT total_bill 
FROM orders 
ORDER BY total_bill DESC 
LIMIT 1 
OFFSET 1;


-- Q40. Show each customer's latest order.
SELECT 
customer_id,MAX(order_date) AS latest_order 
FROM orders 
GROUP BY customer_id;

-- Q41. Find customers who spent more than the average customer spending.
SELECT 
customer_name,total_spent 
FROM(
SELECT 
c.customer_name,
SUM(o.total_bill) total_spent 
FROM customers c 
JOIN orders o 
ON c.customer_id=o.customer_id 
GROUP BY c.customer_name)t 
WHERE total_spent>
(SELECT 
AVG(total_spent) 
FROM(
SELECT 
SUM(total_bill) total_spent 
FROM orders 
GROUP BY customer_id)x);



-- Q44. Find the most popular payment method.
SELECT payment_mode,COUNT(*) AS total_transactions FROM payments GROUP BY payment_mode ORDER BY total_transactions DESC LIMIT 1;

-- Q45. Show revenue contribution (%) of each category.
SELECT mc.category_name,ROUND(SUM(od.amount),2) revenue,ROUND(SUM(od.amount)/(SELECT SUM(amount) FROM order_details)*100,2) contribution_percent FROM menu_categories mc JOIN menu_items mi ON mc.category_id=mi.category_id JOIN order_details od ON mi.item_id=od.item_id GROUP BY mc.category_name;

-- Q46. Find the top supplier based on purchase cost.
SELECT s.supplier_name,SUM(po.total_cost) total_purchase FROM suppliers s JOIN purchase_orders po ON s.supplier_id=po.supplier_id GROUP BY s.supplier_name ORDER BY total_purchase DESC LIMIT 1;

-- Q47. Show profit for each menu item.
SELECT item_name,cost_price,selling_price,(selling_price-cost_price) AS profit FROM menu_items;

-- Q48. Find the most profitable menu item.
SELECT item_name,(selling_price-cost_price) AS profit FROM menu_items ORDER BY profit DESC LIMIT 1;

-- Q49. Calculate average monthly revenue.
SELECT ROUND(AVG(monthly_revenue),2) AS avg_monthly_revenue FROM(SELECT MONTH(order_date) month,SUM(total_bill) monthly_revenue FROM orders GROUP BY MONTH(order_date))t;

-- Q50. Display the complete restaurant sales report.
SELECT 
o.order_id,
o.order_date,
c.customer_name,
e.employee_name,
SUM(od.amount) AS total_bill,
p.payment_mode,
p.payment_status 
FROM orders o 
JOIN customers c 
ON o.customer_id=c.customer_id 
JOIN employees e 
ON o.employee_id=e.employee_id 
JOIN order_details od 
ON o.order_id=od.order_id 
JOIN payments p 
ON o.order_id=p.order_id 
GROUP BY o.order_id,o.order_date,
c.customer_name,e.employee_name,
p.payment_mode,p.payment_status 
ORDER BY o.order_date;

