describe pizza_sales3;

UPDATE pizza_sales3
SET order_date = STR_TO_DATE(order_date, '%d-%m-%Y');

Alter table pizza_sales3
Modify Column order_date DATE;

Alter table pizza_sales3
Modify Column order_time TIME;

-- 1. Total Revenue
select sum(total_price) as total_revenue from pizza_sales3;

-- 2. Average Order Value
select sum(total_price)/count(distinct order_id) as avg_order_value 
from pizza_sales3;

-- 3. Total Pizzas Sold
select sum(quantity) as total_pizzas_sold
from pizza_sales3;

-- 4. Total Orders
select count(distinct order_id) as total_orders
from pizza_sales3;

-- 5. Average Pizzas Per Order
select sum(quantity)/count(distinct order_id) as avg_pizzas_per_order
from pizza_sales3;

-- 6. Daily Trend for Total Orders
select dayname(order_date) as day_name, count(distinct order_id) as total_orders
from pizza_sales3
group by 1;

-- 7. Monthly Trend for Orders
select monthname(order_date) as month_name, count(distinct order_id) as total_orders
from pizza_sales3
group by 1;

-- 8. % of Sales by Pizza Category
select pizza_category, sum(total_price) as total_revenue, (sum(total_price)/(select sum(total_price) from pizza_sales3))*100 as PCT
from pizza_sales3
group by 1;

-- 9. % of Sales by Pizza Size
select pizza_size, sum(total_price) as total_revenue, (sum(total_price)/(select sum(total_price) from pizza_sales3))*100 as PCT
from pizza_sales3
group by 1;

-- 10. Total Pizzas Sold by Pizza Category
select pizza_category, sum(quantity) as total_pizzas_sold
from pizza_sales3
group by 1;

-- 11. Top 5 Pizzas by Revenue
select pizza_name, sum(total_price) as total_revenue
from pizza_sales3
group by 1
order by 2 DESC
limit 5;

-- 12. Bottom 5 Pizzas by Revenue
select pizza_name, sum(total_price) as total_revenue
from pizza_sales3
group by 1
order by 2 ASC
limit 5;

-- 13. Top 5 Pizzas by Quantity
select pizza_name, sum(quantity) as total_quantity
from pizza_sales3
group by 1
order by 2 DESC
limit 5;

-- 14. Bottom 5 Pizzas by Quantity
select pizza_name, sum(quantity) as total_quantity
from pizza_sales3
group by 1
order by 2 ASC
limit 5;

-- 15. Top 5 Pizzas by Total Orders
select pizza_name, count(distinct order_id) as total_orders
from pizza_sales3
group by 1
order by 2 DESC
limit 5;

-- 16. Bottom 5 Pizzas by Total Orders
 select pizza_name, count(distinct order_id) as total_orders
from pizza_sales3
group by 1
order by 2 ASC
limit 5;





