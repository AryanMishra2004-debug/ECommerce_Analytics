SELECT
    DATE_FORMAT(order_purchase_timestamp, '%Y-%m') AS month,
    SUM(payment_value) AS revenue,
    COUNT(DISTINCT o.order_id) AS orders
FROM orders o
JOIN order_payments p ON o.order_id = p.order_id
WHERE order_status = 'delivered'
GROUP BY month
ORDER BY month;