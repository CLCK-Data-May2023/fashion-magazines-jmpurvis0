SELECT c.customer_name AS Customer, SUM(unpaid.due) AS "Amount Due"
FROM customers c JOIN
(SELECT o.customer_id,
s.price_per_month*s.subscription_length AS due,
o.order_status
FROM orders o JOIN subscriptions s
ON o.subscription_id = s.subscription_id
WHERE o.order_status = "unpaid"
AND description = "Fashion Magazine") unpaid
ON c.customer_id = unpaid.customer_id
GROUP BY c.customer_name
