/* Question 2: */

SELECT storebranch.store, order_product.order_id, AVG(quantity)
FROM order_product
LEFT JOIN orders on orders.order_id = order_product.order_id
LEFT JOIN storebranch on storebranch.store_branch_id = orders.store_branch_id
GROUP BY storebranch.store, order_product.order_id


