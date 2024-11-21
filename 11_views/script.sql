-- Write your SQL code here
-- see the order details along with customer information(history):

CREATE VIEW ClientOrderHistory AS
SELECT c.customer_name, o.order_id, o.order_date, o.order_quantity, p.product_name
FROM Order o
JOIN Customer c ON o.customer_id = c.customer_id
JOIN Product p ON o.product_id = p.product_id;

-- View to show employee performance overview
CREATE VIEW EmployeePerformanceOverview AS
SELECT e.employee_name, e.employee_role, e.performance_rating, d.department_name
FROM Employee e
JOIN Department d ON e.department_id = d.department_id;
