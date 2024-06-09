DROP DATABASE IF EXISTS cardealershipdatabase;

CREATE DATABASE cardealershipdatabase;

USE cardealershipdatabase;

CREATE TABLE dealerships (
    dealership_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50),
    address VARCHAR(50),
    phone VARCHAR(12)
);

CREATE TABLE vehicles (
    VIN VARCHAR(17) PRIMARY KEY,
    SOLD BOOLEAN
);

CREATE TABLE inventory (
    dealership_id INT,
    VIN VARCHAR(17),
    FOREIGN KEY (dealership_id) REFERENCES dealerships(dealership_id),
    FOREIGN KEY (VIN) REFERENCES vehicles(VIN)
);

CREATE TABLE sales_contracts (
    id INT AUTO_INCREMENT PRIMARY KEY,
    VIN VARCHAR(17),
    sale_date DATE,
    FOREIGN KEY (VIN) REFERENCES vehicles(VIN)
);

CREATE TABLE lease_contracts (
    id INT AUTO_INCREMENT PRIMARY KEY,
    VIN VARCHAR(17),
    FOREIGN KEY (VIN) REFERENCES vehicles(VIN)
);

INSERT INTO dealerships (name, address, phone) VALUES
('Auto World', '123 Main St', '123-456-7890'),
('Car Nation', '456 Elm St', '987-654-3210'),
('Drive Time', '789 Oak St', '555-555-5555');

INSERT INTO vehicles (VIN, SOLD) VALUES
('1HGCM82633A123456', FALSE),
('1HGCM82633A654321', TRUE),
('1HGCM82633A789012', FALSE),
('1HGCM82633A345678', TRUE),
('1HGCM82633A901234', FALSE),
('1HGCM82633A567890', TRUE),
('1HGCM82633A234567', TRUE);

INSERT INTO inventory (dealership_id, VIN) VALUES
(1, '1HGCM82633A123456'),
(1, '1HGCM82633A654321'),
(2, '1HGCM82633A789012'),
(2, '1HGCM82633A345678'),
(3, '1HGCM82633A901234'),
(3, '1HGCM82633A567890'),
(1, '1HGCM82633A234567');

INSERT INTO sales_contracts (VIN, sale_date) VALUES
('1HGCM82633A654321', '2023-01-15'),
('1HGCM82633A345678', '2023-05-10'),
('1HGCM82633A567890', '2023-03-20'),
('1HGCM82633A234567', '2023-11-05');

INSERT INTO lease_contracts (VIN) VALUES
('1HGCM82633A789012'),
('1HGCM82633A901234');
