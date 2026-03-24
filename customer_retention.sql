--Business Question #3: How likely are  customers to repeat purchases within different time frames of their first purchase?
--This query will identify each customers first purchase date and find whether the customer placed a later order.
--It will calculate the number and percentage of customers who returned within the following time frames
--1. 30 days
--2. 60 days
--3. 90 days

--Identify customer orders
WITH customer_orders AS (
	SELECT
		c.customer_unique_id,
		o.order_id,
		DATE(o.order_purchase_timestamp) AS order_date
	FROM orders AS o
	JOIN customers AS c
		ON o.customer_id = c.customer_id
	WHERE o.order_purchase_timestamp IS NOT NULL
)
SELECT * 
FROM customer_orders
LIMIT 10;

