CREATE DATABASE smart_eticket_booking;
USE smart_eticket_booking;

CREATE TABLE Users (
    user_id INT PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100),
    phone VARCHAR(15),
    city VARCHAR(50)
);

CREATE TABLE Events (
    event_id INT PRIMARY KEY,
    event_name VARCHAR(100),
    category VARCHAR(50),
    venue VARCHAR(100),
    event_date DATE,
    total_seats INT,
    ticket_price DECIMAL(10,2)
);

CREATE TABLE Seats (
    seat_id INT PRIMARY KEY,
    event_id INT,
    seat_no VARCHAR(10),
    seat_status VARCHAR(20),
    FOREIGN KEY (event_id) REFERENCES Events(event_id)
);

CREATE TABLE Bookings (
    booking_id INT PRIMARY KEY,
    user_id INT,
    event_id INT,
    seat_id INT,
    booking_date DATE,
    booking_status VARCHAR(20),
    FOREIGN KEY (user_id) REFERENCES Users(user_id),
    FOREIGN KEY (event_id) REFERENCES Events(event_id),
    FOREIGN KEY (seat_id) REFERENCES Seats(seat_id)
);

CREATE TABLE Payments (
    payment_id INT PRIMARY KEY,
    booking_id INT,
    amount DECIMAL(10,2),
    payment_status VARCHAR(20),
    payment_date DATE,
    FOREIGN KEY (booking_id) REFERENCES Bookings(booking_id)
);

CREATE TABLE EventLogs (
    log_id INT PRIMARY KEY,
    user_id INT,
    event_id INT,
    event_type VARCHAR(50),
    event_time DATE,
    FOREIGN KEY (user_id) REFERENCES Users(user_id),
    FOREIGN KEY (event_id) REFERENCES Events(event_id)
);
