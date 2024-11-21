-- Write your SQL code here


DELIMITER //

CREATE TRIGGER trg_update_order_date
AFTER UPDATE ON `Order`
FOR EACH ROW
BEGIN
    IF NEW.order_quantity != OLD.order_quantity THEN
        UPDATE `Order`
        SET order_date = CURRENT_DATE
        WHERE order_id = NEW.order_id;
    END IF;
END;
//

DELIMITER ;
