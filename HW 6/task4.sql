-- 1 
SELECT cust_name
FROM restBill
WHERE bill_total > 450.00
AND EXISTS (
  SELECT 
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
    WHERE cust_name = 'Nerida Smith' AND bill_date = 160111
);

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
SELECT b.cust_name, s.first_name AS headwaiter_first_name, s.surname AS headwaiter_surname, t.room_name
FROM restBill b
JOIN restRest_table t ON b.table_no = t.table_no
JOIN restRoom_management rm ON t.room_name = rm.room_name AND b.bill_date = rm.room_date
JOIN restStaff s ON rm.headwaiter = s.staff_no
WHERE b.bill_total = (
    SELECT MAX(bill_total)
    FROM restBill
);