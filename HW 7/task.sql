-- 1
CREATE VIEW samsBills AS
SELECT
    first_name, 
    surname,
    bill_date,
    cust_name,
    bill_total
FROM restBill
JOIN restStaff ON waiter_no = staff_no
WHERE first_name = 'Sam' AND surname = 'Pitt';

-- 2
SELECT first_name, surname, bill_date, cust_name, bill_total
FROM samsBills
WHERE bill_total > 400.00;

-- 3 
CREATE VIEW roomTotals AS
SELECT 
    room_name,
    SUM(bill_total) AS total_sum
FROM restBill
JOIN restRest_table ON table_no = table_no
GROUP BY room_name;

-- 4
CREATE VIEW teamTotals AS
SELECT
    CONCAT(first_name, ' ', surname) AS headwaiter_name,
    SUM(bill_total) AS total_sum
FROM restBill
JOIN restStaff ON waiter_no = staff_no
JOIN restStaff ON headwaiter = staff_no
GROUP BY first_name, surname; 