create database OODS;
use OODS;

CREATE TABLE user (
    userID INT AUTO_INCREMENT PRIMARY KEY,
    userName VARCHAR(100) NOT NULL,
    phoneNumber INT(11) NOT NULL,
    email VARCHAR(255) NOT NULL,
    password VARCHAR(100) NOT NULL,
    outletAddress VARCHAR(255) NOT NULL
);
CREATE TABLE stocks (
    stocksID INT AUTO_INCREMENT PRIMARY KEY,
    stocksName VARCHAR(200) NOT NULL,
    stocksQuantity INT(255) NOT NULL,
    minQuantity VARCHAR(25) NOT NULL,
    price DECIMAL(10, 2) NOT NULL
);
CREATE TABLE orders (
    orderID INT AUTO_INCREMENT PRIMARY KEY,
    userID INT,
    orderDate DATE NOT NULL,
    orderQuantity INT(255),
    orderStatus ENUM('Approved', 'Pending', 'Rejected'),
    total DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (userID) REFERENCES user(userID) ON DELETE CASCADE ON UPDATE CASCADE
);
CREATE TABLE orderdetails (
	quantity INT(11),
    orderID INT,
    stocksID INT,
    FOREIGN KEY (orderID) REFERENCES orders(orderID) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (stocksID) REFERENCES stocks(stocksID) ON DELETE CASCADE ON UPDATE CASCADE
);
CREATE TABLE delivery (
	deliveryID INT AUTO_INCREMENT PRIMARY KEY,
    orderID INT,
    deliveryDate DATE NOT NULL,
    deliveryStatus ENUM('Preparing your order', 'Out for delivery', 'Delivered'),
    FOREIGN KEY (orderID) REFERENCES orders(orderID) ON DELETE CASCADE ON UPDATE CASCADE
);

ALTER TABLE orders AUTO_INCREMENT = 100;

ALTER TABLE stocks AUTO_INCREMENT = 10;