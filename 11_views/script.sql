-- Write your SQL code here
-- see the order details along with customer information:
CREATE VIEW customer_order_summary AS
SELECT 
    c.customer_name,
    o.order_id,
    o.order_quantity,
    o.order_date
FROM Customer c
JOIN `Order` o ON c.customer_id = o.customer_id;
