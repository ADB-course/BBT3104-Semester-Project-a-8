-- Write your SQL code here

DELIMITER //

CREATE TRIGGER trg_update_stock
AFTER UPDATE ON products
FOR EACH ROW
BEGIN
    INSERT INTO stock_log (product_id, old_quantity, new_quantity, updated_at)
    VALUES (OLD.product_id, OLD.stock_quantity, NEW.stock_quantity, NOW());
END;
//

DELIMITER ;
