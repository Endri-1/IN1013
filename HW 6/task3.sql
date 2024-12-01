-- 1
SELECT DISTINCT first_name, surname
FROM restStaff
JOIN restBill ON staff_no = waiter_no
WHERE cust_name = 'Tanya Singh';

-- 2 
SELECT rm.room_date
FROM restRoom_management rm
JOIN restStaff s ON rm.headwaiter = s.staff_no
WHERE rm.room_name = 'Green' AND s.first_name = 'Charles' AND rm.room_date BETWEEN 160201 AND 160229;

-- 3 
SELECT DISTINCT first_name, surname
FROM restStaff
WHERE headwaiter = (
    SELECT headwaiter
    FROM restStaff
    WHERE first_name = 'Zoe' AND surname = 'Ball'
);

-- 4 
SELECT cust_name, bill_total, first_name, surname AS waiter_name
FROM restBill 
JOIN restStaff ON waiter_no = staff_no
ORDER BY bill_total DESC;

-- 5 
SELECT DISTINCT first_name, surname
    FROM restStaff 
    JOIN restBill ON staff_no = waiter_no
    WHERE table_no IN (
SELECT DISTINCT table_no
FROM restBill 
WHERE bill_no IN (00014, 00017)
);

-- 6
SELECT DISTINCT s.first_name, s.surname
FROM restStaff s
WHERE s.staff_no IN (
    SELECT DISTINCT b.waiter_no
    FROM restBill b
    JOIN restRest_table t ON b.table_no = t.table_no
    WHERE t.room_name = 'Blue' AND b.bill_date = 160312
)
OR s.staff_no = (
    SELECT headwaiter
    FROM restRoom_management
    WHERE room_name = 'Blue' AND room_date = 160312
);