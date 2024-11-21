-- Create a transaction that handles order placement
START TRANSACTION;

INSERT INTO Order (order_id, order_quantity, order_date, customer_id)
VALUES (101, 2, '2024-11-20', 1);

INSERT INTO Payments (payment_id, order_id, amount_paid)
VALUES (1001, 101, 200);

COMMIT;
