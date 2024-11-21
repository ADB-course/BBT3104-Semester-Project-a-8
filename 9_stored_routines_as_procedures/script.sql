--calculates the total order value for a specific customer:

DELIMITER //

CREATE PROCEDURE calc_total_order_value(IN customer_id INT, OUT total_value DECIMAL(10, 2))
BEGIN
    SELECT SUM(order_quantity * product_price) INTO total_value
    FROM Order o
    JOIN Product p ON o.order_id = p.product_id
    WHERE o.customer_id = customer_id;
END;
//

DELIMITER ;
 