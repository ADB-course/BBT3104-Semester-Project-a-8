-- Procedure to generate a monthly sales report
DELIMITER //
CREATE PROCEDURE GenerationOfMonthlySalesReport()
BEGIN
    SELECT 
        p.product_name, 
        SUM(o.order_quantity) AS total_sales, 
        SUM(o.order_quantity * p.product_price) AS total_revenue
    FROM Order o
    JOIN Product p ON o.product_id = p.product_id
    WHERE o.order_date BETWEEN CURDATE() - INTERVAL 1 MONTH AND CURDATE()
    GROUP BY p.product_name;
END //
DELIMITER ;

-- Procedure to retrieve employee performance by department
DELIMITER //
CREATE PROCEDURE RetrievalOfEmployeePerformance(department_id INT)
BEGIN
    SELECT employee_name, performance_rating
    FROM Employee
    WHERE department_id = department_id;
END //
DELIMITER ;
