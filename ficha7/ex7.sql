UPDATE CUSTOMER
SET Active = FALSE
WHERE CustomerId NOT IN (
  SELECT CustomerId FROM STREAM
)
AND Country = 'China';
