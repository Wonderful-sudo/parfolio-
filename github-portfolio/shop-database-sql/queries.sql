-- 1. Revenue per order
SELECT o.order_id, o.order_date,
       ROUND(SUM(oi.quantity * p.price), 2) AS order_total
FROM orders o
JOIN order_items oi ON oi.order_id = o.order_id
JOIN products p     ON p.product_id = oi.product_id
GROUP BY o.order_id
ORDER BY o.order_id;

-- 2. Revenue by product category
SELECT p.category,
       ROUND(SUM(oi.quantity * p.price), 2) AS revenue
FROM order_items oi
JOIN products p ON p.product_id = oi.product_id
GROUP BY p.category
ORDER BY revenue DESC;

-- 3. Top customers by total spending
SELECT c.name, c.city,
       ROUND(SUM(oi.quantity * p.price), 2) AS total_spent
FROM customers c
JOIN orders o       ON o.customer_id = c.customer_id
JOIN order_items oi ON oi.order_id = o.order_id
JOIN products p     ON p.product_id = oi.product_id
GROUP BY c.customer_id
ORDER BY total_spent DESC;

-- 4. Monthly revenue
SELECT strftime('%Y-%m', o.order_date) AS month,
       ROUND(SUM(oi.quantity * p.price), 2) AS revenue
FROM orders o
JOIN order_items oi ON oi.order_id = o.order_id
JOIN products p     ON p.product_id = oi.product_id
GROUP BY month
ORDER BY month;

-- 5. Customers who never placed an order
SELECT c.name
FROM customers c
LEFT JOIN orders o ON o.customer_id = c.customer_id
WHERE o.order_id IS NULL;

-- 6. Best-selling products by units sold
SELECT p.name, SUM(oi.quantity) AS units_sold
FROM order_items oi
JOIN products p ON p.product_id = oi.product_id
GROUP BY p.product_id
ORDER BY units_sold DESC;
