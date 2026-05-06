USE smart_eticket_booking;

INSERT INTO Users VALUES
(1, 'Shashi Kumar', 'shashi@example.com', '9876543210', 'Hyderabad'),
(2, 'Ravi Teja', 'ravi@example.com', '9876543211', 'Kolkata'),
(3, 'Ananya Rao', 'ananya@example.com', '9876543212', 'Bengaluru'),
(4, 'Kiran Kumar', 'kiran@example.com', '9876543213', 'Mumbai'),
(5, 'Meera Singh', 'meera@example.com', '9876543214', 'Delhi'),
(6, 'Aman Verma', 'aman@example.com', '9876543215', 'Pune'),
(7, 'Priya Sharma', 'priya@example.com', '9876543216', 'Chennai'),
(8, 'Rahul Das', 'rahul@example.com', '9876543217', 'Kolkata');

INSERT INTO Events VALUES
(1, 'Tech Music Night', 'Music', 'IIT Kharagpur Arena', '2026-06-15', 10, 499.00),
(2, 'Startup Summit', 'Business', 'Kolkata Convention Hall', '2026-07-10', 10, 999.00),
(3, 'Comedy Evening', 'Entertainment', 'Hyderabad Auditorium', '2026-08-05', 10, 599.00),
(4, 'Product Leadership Meet', 'Business', 'Bengaluru Expo Center', '2026-09-12', 10, 1299.00);

INSERT INTO Seats VALUES
(1, 1, 'A1', 'Booked'),
(2, 1, 'A2', 'Available'),
(3, 1, 'A3', 'Available'),
(4, 1, 'A4', 'Booked'),
(5, 1, 'A5', 'Available'),

(6, 2, 'B1', 'Booked'),
(7, 2, 'B2', 'Available'),
(8, 2, 'B3', 'Booked'),
(9, 2, 'B4', 'Available'),
(10, 2, 'B5', 'Available'),

(11, 3, 'C1', 'Available'),
(12, 3, 'C2', 'Booked'),
(13, 3, 'C3', 'Available'),
(14, 3, 'C4', 'Available'),
(15, 3, 'C5', 'Booked'),

(16, 4, 'D1', 'Booked'),
(17, 4, 'D2', 'Booked'),
(18, 4, 'D3', 'Available'),
(19, 4, 'D4', 'Available'),
(20, 4, 'D5', 'Available');

INSERT INTO Bookings VALUES
(1, 1, 1, 1, '2026-06-01', 'Confirmed'),
(2, 2, 1, 4, '2026-06-02', 'Confirmed'),
(3, 3, 2, 6, '2026-06-05', 'Confirmed'),
(4, 4, 2, 8, '2026-06-06', 'Pending'),
(5, 5, 3, 12, '2026-06-07', 'Confirmed'),
(6, 1, 3, 15, '2026-06-08', 'Confirmed'),
(7, 6, 4, 16, '2026-06-09', 'Confirmed'),
(8, 7, 4, 17, '2026-06-10', 'Confirmed');

INSERT INTO Payments VALUES
(1, 1, 499.00, 'Success', '2026-06-01'),
(2, 2, 499.00, 'Success', '2026-06-02'),
(3, 3, 999.00, 'Success', '2026-06-05'),
(4, 4, 999.00, 'Pending', '2026-06-06'),
(5, 5, 599.00, 'Success', '2026-06-07'),
(6, 6, 599.00, 'Success', '2026-06-08'),
(7, 7, 1299.00, 'Success', '2026-06-09'),
(8, 8, 1299.00, 'Success', '2026-06-10');

INSERT INTO EventLogs VALUES
(1, 1, 1, 'view_event', '2026-06-01'),
(2, 1, 1, 'view_seat', '2026-06-01'),
(3, 1, 1, 'start_booking', '2026-06-01'),
(4, 1, 1, 'payment_success', '2026-06-01'),

(5, 2, 1, 'view_event', '2026-06-02'),
(6, 2, 1, 'view_seat', '2026-06-02'),
(7, 2, 1, 'start_booking', '2026-06-02'),
(8, 2, 1, 'payment_success', '2026-06-02'),

(9, 3, 2, 'view_event', '2026-06-05'),
(10, 3, 2, 'view_seat', '2026-06-05'),
(11, 3, 2, 'start_booking', '2026-06-05'),
(12, 3, 2, 'payment_success', '2026-06-05'),

(13, 4, 2, 'view_event', '2026-06-06'),
(14, 4, 2, 'view_seat', '2026-06-06'),
(15, 4, 2, 'start_booking', '2026-06-06'),

(16, 5, 3, 'view_event', '2026-06-07'),
(17, 5, 3, 'view_seat', '2026-06-07'),
(18, 5, 3, 'start_booking', '2026-06-07'),
(19, 5, 3, 'payment_success', '2026-06-07'),

(20, 6, 4, 'view_event', '2026-06-09'),
(21, 6, 4, 'view_seat', '2026-06-09'),
(22, 6, 4, 'start_booking', '2026-06-09'),
(23, 6, 4, 'payment_success', '2026-06-09'),

(24, 7, 4, 'view_event', '2026-06-10'),
(25, 7, 4, 'view_seat', '2026-06-10'),
(26, 7, 4, 'start_booking', '2026-06-10'),
(27, 7, 4, 'payment_success', '2026-06-10'),

(28, 8, 3, 'view_event', '2026-06-11'),
(29, 8, 3, 'view_seat', '2026-06-11');
