-- Write your SQL code here

START TRANSACTION;

-- Insert a new order
INSERT INTO Order (order_quantity, order_date, customer_id)
VALUES (5, CURRENT_DATE, 1);

-- Update product stock after order is placed
UPDATE Product
SET product_quantity = product_quantity - 5
WHERE product_id = 101;

COMMIT;
