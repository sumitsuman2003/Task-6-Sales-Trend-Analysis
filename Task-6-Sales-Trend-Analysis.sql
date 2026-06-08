CREATE TABLE orders (
    order_id VARCHAR(50),
    order_date DATE,
    customer_name VARCHAR(100),
    state VARCHAR(100),
    city VARCHAR(100)
);

CREATE TABLE details (
    order_id VARCHAR(50),
    amount NUMERIC,
    profit NUMERIC,
    quantity INT,
    category VARCHAR(100),
    sub_category VARCHAR(100),
    payment_mode VARCHAR(100)
);



SELECT * FROM orders LIMIT 5;

-- Monthly Revenue + Order Volume
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

--Top 3 Months by Sales
SELECT
    EXTRACT(YEAR FROM o.order_date) AS year,
    EXTRACT(MONTH FROM o.order_date) AS month,
    SUM(d.amount) AS revenue
FROM orders o
JOIN details d
ON o.order_id = d.order_id
GROUP BY year, month
ORDER BY revenue DESC
LIMIT 3;

--Specific Time Period Analysis
SELECT
    EXTRACT(MONTH FROM o.order_date) AS month,
    SUM(d.amount) AS revenue
FROM orders o
JOIN details d
ON o.order_id = d.order_id
WHERE EXTRACT(YEAR FROM o.order_date) = 2018
GROUP BY month
ORDER BY month;

--Overall Revenue
SELECT
    SUM(amount) AS total_revenue
FROM details;
