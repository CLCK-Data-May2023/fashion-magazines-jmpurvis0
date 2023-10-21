SELECT c.customer_name, SUM(unpaid.due)
FROM customers c JOIN
(SELECT o.customer_id,
s.price_per_month*s.subscription_length AS due,
o.order_status
FROM orders o join subscriptions s
ON o.order_status = "unpaid"
AND description = "Fashion Magazine") unpaid
ON c.customer_id = unpaid.customer_id
GROUP BY c.customer_name
