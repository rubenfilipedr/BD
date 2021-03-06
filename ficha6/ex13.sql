SELECT CUSTOMER.Name, MAX(STREAM.Charge) AS C
FROM CUSTOMER NATURAL JOIN STREAM
WHERE CUSTOMER.Country = 'United States' AND YEAR(StreamDate) = 2018
GROUP BY CUSTOMER.Name
ORDER BY C DESC, CUSTOMER.Name;
