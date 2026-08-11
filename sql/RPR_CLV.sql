WITH customer_orders AS (
    SELECT c.customer_unique_id, o.order_id, o.order_purchase_timestamp,
           p.payment_value,
           ROW_NUMBER() OVER (PARTITION BY c.customer_unique_id ORDER BY o.order_purchase_timestamp) AS order_rank
    FROM orders o
    JOIN customers c ON o.customer_id = c.customer_id
    JOIN order_payments p ON o.order_id = p.order_id
)
SELECT customer_unique_id,
       COUNT(order_id) AS total_orders,
       SUM(payment_value) AS clv
FROM customer_orders
GROUP BY customer_unique_id
ORDER BY clv DESC;
