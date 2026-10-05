SELECT *
FROM `DATASET_PROJECT.orders`
LIMIT 10;

-- Get the time range between which the orders were placed.
SELECT MIN(DATE(order_purchase_timestamp)), MAX(DATE(order_purchase_timestamp))
FROM `DATASET_PROJECT.orders`;

-- Count the Cities & States of customers who ordered during the given period.
SELECT DISTINCT COUNT(customer_city), COUNT(customer_state)
FROM `DATASET_PROJECT.customers` c JOIN `DATASET_PROJECT.orders` o
ON c.customer_id = o.customer_id
WHERE EXTRACT(YEAR FROM o.order_purchase_timestamp) = 2018 AND 
EXTRACT(MONTH FROM o.order_purchase_timestamp) BETWEEN 1 AND 3;

-- Is there a growing trend in the no. of orders placed over the past years? 
SELECT EXTRACT(MONTH FROM order_purchase_timestamp) MONTH, COUNT(order_id) ORDERS
FROM `DATASET_PROJECT.orders`
GROUP BY EXTRACT(MONTH FROM order_purchase_timestamp)
ORDER BY ORDERS DESC;

-- During what time of the day, do the Brazilian customers mostly place their orders? (Dawn, Morning, Afternoon or Night) 
-- ■ 0-6 hrs : Dawn 
-- ■ 7-12 hrs : Mornings 
-- ■ 13-18 hrs : Afternoon 
-- ■ 19-23 hrs : Night 

SELECT EXTRACT(HOUR FROM order_purchase_timestamp) TIMEOFDAY, COUNT(order_id) ORDERS
FROM `DATASET_PROJECT.orders`
GROUP BY EXTRACT(HOUR FROM order_purchase_timestamp)
ORDER BY ORDERS DESC;

-- Get the month on month no. of orders placed in each state.
SELECT EXTRACT(YEAR FROM order_purchase_timestamp) YEAR, EXTRACT(MONTH FROM order_purchase_timestamp) MONTH, customer_state CUSTOMERSTATE
FROM `DATASET_PROJECT.orders` o JOIN `DATASET_PROJECT.customers` c
ON o.customer_id = c.customer_id
GROUP BY EXTRACT(YEAR FROM order_purchase_timestamp), EXTRACT(MONTH FROM order_purchase_timestamp), customer_state;

-- How are the customers distributed across all the states? 
SELECT customer_state STATE,COUNT(DISTINCT customer_unique_id) 
FROM `DATASET_PROJECT.customers`
GROUP BY customer_state;

-- Get the % increase in the cost of orders from year 2017 to 2018 
-- (include months between Jan to Aug only). 
-- You can use the "payment_value" column in the payments table to get 
-- the cost of orders.









