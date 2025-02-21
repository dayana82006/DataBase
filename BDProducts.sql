CREATE DATABASE company_db;
USE company_db;

-- Tabla productlines
CREATE TABLE productlines (
    id INT AUTO_INCREMENT PRIMARY KEY,
    description VARCHAR(50),
    html_description TEXT,
    image BLOB
);

-- Tabla units
CREATE TABLE units (
    id INT AUTO_INCREMENT PRIMARY KEY,
    description VARCHAR(50)
);

-- Tabla country
CREATE TABLE country (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50)
) ENGINE=INNODB;

-- Tabla region
CREATE TABLE region (
    id INT AUTO_INCREMENT,
    name VARCHAR(50),
    country_id INT(11),
    PRIMARY KEY(id),
    CONSTRAINT country_region_fk FOREIGN KEY (country_id) REFERENCES country(id)
) ENGINE=INNODB;

-- Tabla city
CREATE TABLE city (
    id INT AUTO_INCREMENT,
    name VARCHAR(50),
    region_id INT(11),
    PRIMARY KEY(id),
    zip_code VARCHAR(10),
    CONSTRAINT city_region_fk FOREIGN KEY (region_id) REFERENCES region(id)
) ENGINE=INNODB;

-- Tabla type_vendors
CREATE TABLE type_vendors (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50)
) ENGINE=INNODB;

-- Tabla vendors
CREATE TABLE vendors (
    id VARCHAR(20) PRIMARY KEY,
    name VARCHAR(20),
    email VARCHAR(80) UNIQUE,
    phone VARCHAR(13),
    description VARCHAR(50),
    typevendors_id INT(11),
    CONSTRAINT typevendors_fk FOREIGN KEY (typevendors_id) REFERENCES type_vendors(id)
) ENGINE=INNODB;

-- Tabla locations
CREATE TABLE locations (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50)
) ENGINE=INNODB;

-- Tabla phone_vendors
CREATE TABLE phone_vendors (
    id INT AUTO_INCREMENT PRIMARY KEY,
    code_area VARCHAR(3),
    location_id INT(11),
    phone VARCHAR(50),
    vendor_id VARCHAR(20),
    CONSTRAINT phone_vendor_fk FOREIGN KEY (vendor_id) REFERENCES vendors(id),
    CONSTRAINT location_phone_fk FOREIGN KEY (location_id) REFERENCES locations(id)
) ENGINE=INNODB;

-- Tabla products
CREATE TABLE products (
    code VARCHAR(15) PRIMARY KEY,
    name VARCHAR(70) NOT NULL,
    productline_id INT(11),
    units_id INT(11),
    productVendor VARCHAR(50),
    productDescription TEXT,
    quantityInStock INT,
    buyPrice DECIMAL(10,2),
    MSRP DECIMAL(10,2),
    FOREIGN KEY (productline_id) REFERENCES productlines(id)
);

-- Tabla employees
CREATE TABLE employees (
    employeeNumber INT PRIMARY KEY,
    lastName VARCHAR(50) NOT NULL,
    firstName VARCHAR(50) NOT NULL,
    extension VARCHAR(10),
    email VARCHAR(100),
    officeCode VARCHAR(10),
    reportsTo INT,
    jobTitle VARCHAR(50),
    FOREIGN KEY (reportsTo) REFERENCES employees(employeeNumber)
);

-- Tabla offices
CREATE TABLE offices (
    officeCode VARCHAR(10) PRIMARY KEY,
    city VARCHAR(50),
    phone VARCHAR(20),
    addressLine1 VARCHAR(100),
    addressLine2 VARCHAR(100),
    state VARCHAR(50),
    country VARCHAR(50),
    postalCode VARCHAR(15),
    territory VARCHAR(10)
);

-- Relación offices - employees
ALTER TABLE employees ADD FOREIGN KEY (officeCode) REFERENCES offices(officeCode);

-- Tabla customers
CREATE TABLE customers (
    customerNumber INT PRIMARY KEY,
    customerName VARCHAR(50) NOT NULL,
    contactLastName VARCHAR(50),
    contactFirstName VARCHAR(50),
    phone VARCHAR(20),
    addressLine1 VARCHAR(100),
    addressLine2 VARCHAR(100),
    city VARCHAR(50),
    state VARCHAR(50),
    postalCode VARCHAR(15),
    country VARCHAR(50),
    salesRepEmployeeNumber INT,
    creditLimit DECIMAL(10,2),
    FOREIGN KEY (salesRepEmployeeNumber) REFERENCES employees(employeeNumber)
);

-- Tabla orders
CREATE TABLE orders (
    orderNumber INT PRIMARY KEY,
    orderDate DATE,
    requiredDate DATE,
    shippedDate DATE,
    status VARCHAR(20),
    comments TEXT,
    customerNumber INT,
    FOREIGN KEY (customerNumber) REFERENCES customers(customerNumber)
);

-- Tabla orderdetails
CREATE TABLE orderdetails (
    orderNumber INT,
    productCode VARCHAR(15),
    quantityOrdered INT,
    priceEach DECIMAL(10,2),
    orderLineNumber SMALLINT,
    PRIMARY KEY (orderNumber, productCode),
    FOREIGN KEY (orderNumber) REFERENCES orders(orderNumber),
    FOREIGN KEY (productCode) REFERENCES products(productCode)
);

-- Tabla payments
CREATE TABLE payments (
    customerNumber INT,
    checkNumber VARCHAR(50),
    paymentDate DATE,
    amount DECIMAL(10,2),
    PRIMARY KEY (customerNumber, checkNumber),
    FOREIGN KEY (customerNumber) REFERENCES customers(customerNumber)
);
