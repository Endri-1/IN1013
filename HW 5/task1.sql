-- 1
SELECT bill_date, bill_total
FROM restBill
WHERE cust_name = 'Bob Crow';

-- 2
SELECT DISTINCT cust_name
FROM restBill
WHERE cust_name LIKE '% Smith'
ORDER BY cust_name DESC;

-- 3
SELECT cust_name
FROM restBill
WHERE cust_name LIKE '% C%';

-- 4
SELECT DISTINCT first_name, surname 
FROM restStaff
WHERE headwaiter IS NOT NULL;

-- 5
SELECT * 
FROM restBill
WHERE bill_date BETWEEN 160201 and 160229;

-- 6
SELECT bill_date
FROM restBill
WHERE bill_date BETWEEN 150101 and 151231
ORDER BY bill_date;