-- Write your SQL code here
-- Trigger to update inventory levels after order dispatch
DELIMITER //
CREATE TRIGGER trg_update_inventory_after_dispatch
AFTER UPDATE ON `Order`
FOR EACH ROW
BEGIN
    IF NEW.dispatch_date IS NOT NULL AND OLD.dispatch_date IS NULL THEN
        UPDATE Product
        SET product_quantity = product_quantity - NEW.order_quantity
        WHERE product_id = NEW.product_id;
    END IF;
END //
DELIMITER ;

-- Trigger to archive old orders before deletion
DELIMITER //
CREATE TRIGGER trg_archive_old_orders
BEFORE DELETE ON `Order`
FOR EACH ROW
BEGIN
    INSERT INTO OrderArchive SELECT * FROM `Order` WHERE order_id = OLD.order_id;
END //
DELIMITER ;
