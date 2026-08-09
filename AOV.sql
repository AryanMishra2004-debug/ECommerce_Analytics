SELECT ROUND(SUM(payment_value) / COUNT(DISTINCT o.order_id), 2) AS aov
FROM orders o JOIN order_payments p ON o.order_id = p.order_id
WHERE order_status = 'delivered';