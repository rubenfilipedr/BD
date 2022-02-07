UPDATE STREAM
SET Charge = Charge + 1.5
WHERE MovieId IN (
  SELECT MovieId FROM MOVIE
  WHERE Duration >= 180
)
AND CustomerId IN (
  SELECT CustomerId FROM CUSTOMER
  JOIN COUNTRY ON (CUSTOMER.Country = COUNTRY.Name)
  JOIN REGION ON (COUNTRY.RegionId = REGION.RegionId)
  WHERE REGION.Name = 'Europe'
);
