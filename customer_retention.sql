--Buisness Question #3: How likely are customers to place a second order within a given timeframe after their first purchase?
--This query will identify first purchase dates and check whether a customer returns within 30, 60, or 90 days.

--Identify customer order
WITH customer_orders AS (
	SELECT 
		c.customer_unique_id,
		o.order_id,
		DATE(o.order_purchase_timestamp) AS order_date
	FROM orders as o
	JOIN customers as c
		ON o.customer_id = c.customer_id
	WHERE o.order_purchase_timestamp IS NOT NULL
),

--Add first purchase date CTE
first_orders AS (
	SELECT 
		customer_unique_id,
		MIN(order_date) AS first_order_date
	FROM customer_orders
	GROUP BY customer_unique_id
)

SELECT *
FROM first_orders
LIMIT 10;

