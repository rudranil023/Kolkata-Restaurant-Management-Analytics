
USE kolkata_restaurant_db;
-- Create Table --
-- ==========================================================
-- 1. CUSTOMERS
-- ==========================================================

CREATE TABLE customers (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_name VARCHAR(100) NOT NULL,
    phone VARCHAR(15) NOT NULL UNIQUE,
    email VARCHAR(100) UNIQUE,
    gender ENUM('Male','Female','Other'),
    city VARCHAR(50) NOT NULL,
    join_date DATE NOT NULL
);

-- ==========================================================
-- 2. EMPLOYEES
-- ==========================================================

CREATE TABLE employees (
    employee_id INT AUTO_INCREMENT PRIMARY KEY,
    employee_name VARCHAR(100) NOT NULL,
    role ENUM('Manager','Chef','Waiter','Cashier','Delivery') NOT NULL,
    phone VARCHAR(15) UNIQUE,
    salary DECIMAL(10,2) NOT NULL CHECK(salary>0),
    shift ENUM('Morning','Evening') NOT NULL,
    joining_date DATE NOT NULL
);

-- ==========================================================
-- 3. MENU CATEGORIES
-- ==========================================================

CREATE TABLE menu_categories (
    category_id INT AUTO_INCREMENT PRIMARY KEY,
    category_name VARCHAR(50) NOT NULL UNIQUE,
    description VARCHAR(200)
);

-- ==========================================================
-- 4. SUPPLIERS
-- ==========================================================

CREATE TABLE suppliers (
    supplier_id INT AUTO_INCREMENT PRIMARY KEY,
    supplier_name VARCHAR(100) NOT NULL,
    contact_person VARCHAR(100),
    phone VARCHAR(15) UNIQUE,
    city VARCHAR(50)
);

-- ==========================================================
-- 5. MENU ITEMS
-- ==========================================================

CREATE TABLE menu_items (
    item_id INT AUTO_INCREMENT PRIMARY KEY,
    category_id INT NOT NULL,
    item_name VARCHAR(100) NOT NULL,
    cost_price DECIMAL(10,2) NOT NULL CHECK(cost_price>=0),
    selling_price DECIMAL(10,2) NOT NULL CHECK(selling_price>=0),
    food_type ENUM('Veg','Non Veg') NOT NULL,
    available ENUM('Yes','No') DEFAULT 'Yes',

    CONSTRAINT fk_menu_category
    FOREIGN KEY(category_id)
    REFERENCES menu_categories(category_id)
);

-- ==========================================================
-- 6. INVENTORY
-- ==========================================================

CREATE TABLE inventory (
    ingredient_id INT AUTO_INCREMENT PRIMARY KEY,
    supplier_id INT NOT NULL,
    ingredient_name VARCHAR(100) NOT NULL,
    current_stock DECIMAL(10,2) NOT NULL CHECK(current_stock>=0),
    unit VARCHAR(20) NOT NULL,
    reorder_level DECIMAL(10,2) NOT NULL,

    CONSTRAINT fk_inventory_supplier
    FOREIGN KEY(supplier_id)
    REFERENCES suppliers(supplier_id)
);

-- ==========================================================
-- 7. ORDERS
-- ==========================================================

CREATE TABLE orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT NOT NULL,
    employee_id INT NOT NULL,

    order_date DATE NOT NULL,
    order_time TIME NOT NULL,

    order_type ENUM('Dine-In','Takeaway','Delivery') NOT NULL,

    total_bill DECIMAL(10,2) NOT NULL CHECK(total_bill>=0),

    order_status ENUM('Completed','Pending','Cancelled')
    DEFAULT 'Completed',

    CONSTRAINT fk_order_customer
    FOREIGN KEY(customer_id)
    REFERENCES customers(customer_id),

    CONSTRAINT fk_order_employee
    FOREIGN KEY(employee_id)
    REFERENCES employees(employee_id)
);

-- ==========================================================
-- 8. ORDER DETAILS
-- ==========================================================

CREATE TABLE order_details (
    order_detail_id INT AUTO_INCREMENT PRIMARY KEY,

    order_id INT NOT NULL,

    item_id INT NOT NULL,

    quantity INT NOT NULL CHECK(quantity>0),

    unit_price DECIMAL(10,2) NOT NULL,

    amount DECIMAL(10,2) NOT NULL,

    CONSTRAINT fk_detail_order
    FOREIGN KEY(order_id)
    REFERENCES orders(order_id),

    CONSTRAINT fk_detail_item
    FOREIGN KEY(item_id)
    REFERENCES menu_items(item_id)
);

-- ==========================================================
-- 9. PAYMENTS
-- ==========================================================

CREATE TABLE payments (

    payment_id INT AUTO_INCREMENT PRIMARY KEY,

    order_id INT NOT NULL UNIQUE,

    payment_mode ENUM('Cash','UPI','Card','Wallet') NOT NULL,

    amount DECIMAL(10,2) NOT NULL,

    payment_status ENUM('Paid','Pending','Refunded')
    DEFAULT 'Paid',

    payment_date DATE NOT NULL,

    CONSTRAINT fk_payment_order
    FOREIGN KEY(order_id)
    REFERENCES orders(order_id)
);

-- ==========================================================
-- 10. PURCHASE ORDERS
-- ==========================================================

CREATE TABLE purchase_orders (

    purchase_id INT AUTO_INCREMENT PRIMARY KEY,

    supplier_id INT NOT NULL,

    ingredient_id INT NOT NULL,

    purchase_date DATE NOT NULL,

    quantity DECIMAL(10,2) NOT NULL CHECK(quantity>0),

    unit_cost DECIMAL(10,2) NOT NULL CHECK(unit_cost>=0),

    total_cost DECIMAL(10,2) NOT NULL CHECK(total_cost>=0),

    CONSTRAINT fk_purchase_supplier
    FOREIGN KEY(supplier_id)
    REFERENCES suppliers(supplier_id),

    CONSTRAINT fk_purchase_ingredient
    FOREIGN KEY(ingredient_id)
    REFERENCES inventory(ingredient_id)
);

-- ==========================================================
-- END OF DATABASE
-- ==========================================================
-- View customer orders
SELECT *
FROM orders
LIMIT 10;

-- View order details
SELECT *
FROM order_details
LIMIT 10;
-- Join orders with customers
SELECT
o.order_id,
c.customer_name,
o.total_bill
FROM orders o
JOIN customers c
ON o.customer_id = c.customer_id
LIMIT 20;