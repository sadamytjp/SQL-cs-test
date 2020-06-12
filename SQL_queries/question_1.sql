/* Quest 1: Assuming Sunday is 0*/

SELECT CASE
			WHEN dow = 0 THEN 'Sunday'
			WHEN dow = 1 THEN 'Monday'
			WHEN dow = 2 THEN 'Tuesday'
			WHEN dow = 3 THEN 'Wednesday'
			WHEN dow = 4 THEN 'Thursday'
			WHEN dow = 5 THEN 'Friday'
			ELSE 'Saturday'
			END AS week_day, 
		on_demand,
		COUNT(*)
FROM orders
WHERE on_demand = true OR on_demand = false
GROUP BY dow, on_demand
ORDER BY dow;

