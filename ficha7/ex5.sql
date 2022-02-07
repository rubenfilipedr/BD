DELETE FROM STREAM
WHERE Charge <= 5.5
AND CustomerId IN (
  SELECT CustomerId
  FROM CUSTOMER
  WHERE Country = 'China'
);
