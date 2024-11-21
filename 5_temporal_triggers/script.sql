-- Write your SQL code here
--update order_date every time an order is modified:
DELIMITER //

CREATE TRIGGER trg_update_order_date_on_modify
BEFORE UPDATE ON `Order`
FOR EACH ROW
BEGIN
    SET NEW.order_date = CURRENT_DATE;
END;
//

DELIMITER ;

