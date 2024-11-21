-- Trigger to set order status to "Pending Payment" after a new order is created
DELIMITER //
CREATE TRIGGER trg_set_order_status
AFTER INSERT ON Order
FOR EACH ROW
BEGIN
    UPDATE Order
    SET order_status = 1 -- Pending Payment
    WHERE order_id = NEW.order_id;
END //
DELIMITER ;

-- Trigger to validate employee performance rating before insert/update
DELIMITER //
CREATE TRIGGER trg_check_employee_performance
BEFORE INSERT OR UPDATE ON Employee
FOR EACH ROW
BEGIN
    IF NEW.performance_rating > 5 OR NEW.performance_rating < 1 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Performance rating must be between 1 and 5';
    END IF;
END //
DELIMITER ;
