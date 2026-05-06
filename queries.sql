USE smart_eticket_booking;

-- 1. View all users
SELECT * FROM Users;

-- 2. View all events
SELECT * FROM Events;

-- 3. Check available seats for a specific event
SELECT 
    e.event_name,
    s.seat_no,
    s.seat_status
FROM Seats s
JOIN Events e ON s.event_id = e.event_id
WHERE s.event_id = 1 AND s.seat_status = 'Available';

-- 4. View booking history of a user
SELECT 
    u.name,
    e.event_name,
    e.venue,
    s.seat_no,
    b.booking_date,
    b.booking_status,
    p.payment_status
FROM Bookings b
JOIN Users u ON b.user_id = u.user_id
JOIN Events e ON b.event_id = e.event_id
JOIN Seats s ON b.seat_id = s.seat_id
JOIN Payments p ON b.booking_id = p.booking_id
WHERE u.user_id = 1;

-- 5. Revenue generated per event
SELECT 
    e.event_name,
    SUM(p.amount) AS total_revenue
FROM Payments p
JOIN Bookings b ON p.booking_id = b.booking_id
JOIN Events e ON b.event_id = e.event_id
WHERE p.payment_status = 'Success'
GROUP BY e.event_name
ORDER BY total_revenue DESC;

-- 6. Most booked events
SELECT 
    e.event_name,
    COUNT(b.booking_id) AS total_bookings
FROM Bookings b
JOIN Events e ON b.event_id = e.event_id
GROUP BY e.event_name
ORDER BY total_bookings DESC;

-- 7. Available seats per event
SELECT 
    e.event_name,
    COUNT(s.seat_id) AS available_seats
FROM Events e
JOIN Seats s ON e.event_id = s.event_id
WHERE s.seat_status = 'Available'
GROUP BY e.event_name;

-- 8. Users with successful payments
SELECT 
    u.name,
    COUNT(p.payment_id) AS successful_payments
FROM Users u
JOIN Bookings b ON u.user_id = b.user_id
JOIN Payments p ON b.booking_id = p.booking_id
WHERE p.payment_status = 'Success'
GROUP BY u.name;

-- 9. Complete booking details with payment status
SELECT 
    b.booking_id,
    u.name,
    e.event_name,
    s.seat_no,
    b.booking_status,
    p.payment_status,
    p.amount
FROM Bookings b
JOIN Users u ON b.user_id = u.user_id
JOIN Events e ON b.event_id = e.event_id
JOIN Seats s ON b.seat_id = s.seat_id
JOIN Payments p ON b.booking_id = p.booking_id;

-- 10. User funnel analysis
SELECT 
    COUNT(DISTINCT CASE WHEN event_type = 'view_event' THEN user_id END) AS users_viewed_event,
    COUNT(DISTINCT CASE WHEN event_type = 'view_seat' THEN user_id END) AS users_viewed_seat,
    COUNT(DISTINCT CASE WHEN event_type = 'start_booking' THEN user_id END) AS users_started_booking,
    COUNT(DISTINCT CASE WHEN event_type = 'payment_success' THEN user_id END) AS users_completed_payment
FROM EventLogs;

-- 11. Overall conversion rate from event view to payment success
SELECT 
    ROUND(
        COUNT(DISTINCT CASE WHEN event_type = 'payment_success' THEN user_id END) * 100.0 /
        COUNT(DISTINCT CASE WHEN event_type = 'view_event' THEN user_id END),
        2
    ) AS conversion_rate_percentage
FROM EventLogs;

-- 12. Event-wise conversion rate
SELECT 
    e.event_name,
    COUNT(DISTINCT CASE WHEN el.event_type = 'view_event' THEN el.user_id END) AS viewed_users,
    COUNT(DISTINCT CASE WHEN el.event_type = 'payment_success' THEN el.user_id END) AS converted_users,
    ROUND(
        COUNT(DISTINCT CASE WHEN el.event_type = 'payment_success' THEN el.user_id END) * 100.0 /
        COUNT(DISTINCT CASE WHEN el.event_type = 'view_event' THEN el.user_id END),
        2
    ) AS conversion_rate_percentage
FROM EventLogs el
JOIN Events e ON el.event_id = e.event_id
GROUP BY e.event_name;

-- 13. Identify users who viewed seats but did not complete payment
SELECT DISTINCT
    u.name,
    e.event_name
FROM EventLogs el
JOIN Users u ON el.user_id = u.user_id
JOIN Events e ON el.event_id = e.event_id
WHERE el.event_type = 'view_seat'
AND el.user_id NOT IN (
    SELECT user_id 
    FROM EventLogs 
    WHERE event_type = 'payment_success'
);

-- 14. Event demand by number of views
SELECT 
    e.event_name,
    COUNT(el.log_id) AS total_event_views
FROM EventLogs el
JOIN Events e ON el.event_id = e.event_id
WHERE el.event_type = 'view_event'
GROUP BY e.event_name
ORDER BY total_event_views DESC;

-- 15. Category-wise revenue
SELECT 
    e.category,
    SUM(p.amount) AS category_revenue
FROM Payments p
JOIN Bookings b ON p.booking_id = b.booking_id
JOIN Events e ON b.event_id = e.event_id
WHERE p.payment_status = 'Success'
GROUP BY e.category
ORDER BY category_revenue DESC;
