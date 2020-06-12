/* Question 3: */

SELECT CASE
			WHEN dow = 0 THEN 'Sunday'
			WHEN dow = 1 THEN 'Monday'
			WHEN dow = 2 THEN 'Tuesday'
			WHEN dow = 3 THEN 'Wednesday'
			WHEN dow = 4 THEN 'Thursday'
			WHEN dow = 5 THEN 'Friday'
			ELSE 'Saturday'
			END AS day_of_week,
		buy_unit AS product_format, 
		AVG(quantity_found/quantity) AS found_rate
FROM order_product op
LEFT JOIN orders o ON o.order_id = op.order_id
GROUP BY dow, buy_unit

