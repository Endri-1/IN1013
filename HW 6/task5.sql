-- 1 
SELECT first_name, surname, bill_date, COUNT(*) AS num_bills
FROM restBill 
JOIN restStaff  ON waiter_no = staff_no
GROUP BY first_name, surname, bill_date
HAVING COUNT(*) >= 2;

-- 2 
SELECT room_name, COUNT(*) AS num_tables
FROM restRest_table
WHERE no_of_seats > 6
GROUP BY room_name;

-- 3 
SELECT room_name, SUM(bill_total) AS total_bill_amount
FROM restBill 
JOIN restRest_table ON table_no = table_no
GROUP BY room_name;

-- 4 
SELECT first_name AS headwaiter_first_name, surname AS headwaiter_surname, SUM(b.bill_total) AS total_bill_amount
FROM restStaff 
JOIN restStaff ON staff_no = headwaiter
JOIN restBill  ON staff_no = waiter_no
GROUP BY first_name, surname
ORDER BY total_bill_amount DESC;

-- 5
SELECT cust_name, AVG(bill_total) AS avg_spent
FROM restBill
GROUP BY cust_name
HAVING AVG(bill_total) > 400;

-- 6 
SELECT s.first_name, s.surname, COUNT(*) AS num_bills
FROM restBill b
JOIN restStaff s ON b.waiter_no = s.staff_no
GROUP BY s.first_name, s.surname, b.bill_date
HAVING COUNT(*) >= 3;
