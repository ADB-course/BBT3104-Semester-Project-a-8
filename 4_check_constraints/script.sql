--Tables Without Check Constraints
CREATE TABLE Department (
    department_id INT AUTO_INCREMENT PRIMARY KEY,
    department_name VARCHAR(100) NOT NULL,
    location VARCHAR(100) NOT NULL,
    department_head VARCHAR(100) NOT NULL
) ENGINE=InnoDB;

CREATE TABLE Employee (
    employee_id INT AUTO_INCREMENT PRIMARY KEY,
    employee_name VARCHAR(100) NOT NULL,
    employee_role VARCHAR(100) NOT NULL,
    department_id INT NOT NULL,
    FOREIGN KEY (department_id) REFERENCES Department(department_id),
    INDEX (department_id)
) ENGINE=InnoDB;

CREATE TABLE Customer (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_name VARCHAR(100) NOT NULL,
    customer_email VARCHAR(100) NOT NULL UNIQUE
) ENGINE=InnoDB;



--Tables With Check Constraints

CREATE TABLE Product (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    product_quantity INT NOT NULL CHECK (product_quantity >= 0),
    product_price DECIMAL(10, 2) NOT NULL CHECK (product_price > 0)
) ENGINE=InnoDB;

CREATE TABLE Order(
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    order_quantity INT NOT NULL CHECK (order_quantity > 0),
    order_date DATE NOT NULL,
    customer_id INT NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES Customer(customer_id),
    CHECK (order_quantity <= (SELECT product_quantity FROM Product WHERE product_id = order_id)),
    INDEX (order_date)
) ENGINE=InnoDB;
