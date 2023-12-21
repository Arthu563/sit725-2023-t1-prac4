-- SQL Code: to create the database schema for RemindPay, based on the requirements identified:

-- Create Role Table
CREATE TABLE Role (
    role_id INT AUTO_INCREMENT PRIMARY KEY,
    role_name VARCHAR(50) NOT NULL
);

-- Insert role data
INSERT INTO Role (role_name) VALUES 
    ('Administrator'),
    ('Manager'),  -- Renamed Non-Administrator to Manager for clarity.
    ('Client');

-- Create User Table
CREATE TABLE User (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL,
    password_hash VARCHAR(255) NOT NULL,
    email VARCHAR(100) NOT NULL,
    role_id INT NOT NULL,
    FOREIGN KEY (role_id) REFERENCES Role(role_id)
);

-- Create Client Account Table
CREATE TABLE ClientAccount (
    client_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    other_client_fields VARCHAR(255), -- Add other client-specific fields, Maybe?
    FOREIGN KEY (user_id) REFERENCES User(user_id)
);

-- Create Reminder Table
CREATE TABLE Reminder (
    reminder_id INT AUTO_INCREMENT PRIMARY KEY,
    client_id INT NOT NULL,
    reminder_date DATE NOT NULL,
    reminder_message VARCHAR(255) NOT NULL,
    FOREIGN KEY (client_id) REFERENCES ClientAccount(client_id)
);
