/* Question 4:*/
SELECT  EXTRACT(hour FROM actual_time - (total_minutes || ' minutes')::interval) AS order_hour,
		SUM(total_minutes) AS t1_actual_min,
		SUM(EXTRACT(EPOCH FROM (promised_time - (actual_time - (total_minutes || ' minutes')::interval))::interval)/60) AS t2_predicted_min,
		SUM(total_minutes - EXTRACT(EPOCH FROM (promised_time - (actual_time - (total_minutes || ' minutes')::interval))::interval)/60) AS t1_minus_t2,
		SUM(total_minutes - EXTRACT(EPOCH FROM (promised_time - (actual_time - (total_minutes || ' minutes')::interval))::interval)/60) ^ 2 AS t1_minus_t2_squared,
		SUM(total_minutes - EXTRACT(EPOCH FROM (promised_time - (actual_time - (total_minutes || ' minutes')::interval))::interval)/60)/COUNT(total_minutes - EXTRACT(EPOCH FROM (promised_time - (actual_time - (total_minutes || ' minutes')::interval))::interval)/60) AS mean_error,
		SUM((total_minutes - EXTRACT(EPOCH FROM (promised_time - (actual_time - (total_minutes || ' minutes')::interval))::interval)/60) ^ 2)/COUNT((total_minutes - EXTRACT(EPOCH FROM (promised_time - (actual_time - (total_minutes || ' minutes')::interval))::interval)/60) ^ 2) AS mean_squared_error
FROM orders
GROUP BY order_hour
ORDER BY order_hour