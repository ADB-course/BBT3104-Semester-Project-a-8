-- Count the total number of orders handled by the employee
DELIMITER //

CREATE FUNCTION calc_total_orders_by_employee(employee_id INT)
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE total_orders INT;
    
    
    SELECT COUNT(*) INTO total_orders
    FROM Order
    WHERE employee_id = employee_id;
    
    RETURN total_orders;
END;
//

DELIMITER ;
