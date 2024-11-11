CREATE DATABASE wifi_billing_system;

USE wifi_billing_system;


CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    phone VARCHAR(15) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


CREATE TABLE packages (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50),
    price INT,
    validity_hours INT,
    devices INT
);


CREATE TABLE transactions (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    package_id INT,
    status VARCHAR(20),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (package_id) REFERENCES packages(id)
);


INSERT INTO packages (name, price, validity_hours, devices)
VALUES
    ('1 Hour', 10, 1, 1),
    ('4 Hours', 20, 4, 1),
    ('7 Hours', 30, 7, 1),
    ('12 Hours', 40, 12, 1),
    ('1 Day', 50, 24, 1),
    ('3 Days', 120, 72, 1),
    ('7 Days', 250, 168, 1),
    ('1 Month', 600, 720, 1);
