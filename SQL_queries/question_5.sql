SELECT COUNT(*) AS orders_diff_picker_driver
FROM orders
WHERE picker_id != driver_id