-- Write your SQL code here
DELIMITER //

CREATE TRIGGER trg_update_order_timestamp
BEFORE UPDATE ON orders
FOR EACH ROW
BEGIN
    SET NEW.updated_at = NOW();
END;
//

DELIMITER ;
