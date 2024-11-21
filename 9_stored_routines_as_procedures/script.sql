-- Write your SQL code here
DELIMITER //

CREATE PROCEDURE calculate_total_sales(IN product_id INT, OUT total_sales DECIMAL(10, 2))
BEGIN
    SELECT SUM(quantity * price) INTO total_sales
    FROM order_details
    WHERE product_id = product_id;
END;
//

DELIMITER ;

