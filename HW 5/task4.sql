-- 1 

SELECT cust_name
FROM restBill 
WHERE bill_total > 450.00
  AND EXISTS (
    SELECT 1
    FROM restRoom_management 
    WHERE room_date = bill_date
      AND headwaiter = (
        SELECT staff_no
        FROM restStaff
        WHERE first_name = 'Charles'
      )
);

-- 2 

SELECT first_name, surname
FROM restStaff
WHERE staff_no = (
    SELECT headwaiter
    FROM restRoom_management
    JOIN restBill ON room_date = bill_date
    WHERE cust_name = 'Nerida Smith' AND bill_date = 160111);

-- 3 

SELECT cust_name
FROM restBill
WHERE bill_total = (
    SELECT MIN(bill_total)
    FROM restBill
);

-- 4 

SELECT first_name, surname
FROM restStaff
WHERE staff_no NOT IN (
    SELECT DISTINCT waiter_no
    FROM restBill
);

-- 5

