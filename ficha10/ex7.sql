DROP VIEW REGION_DATA;

CREATE VIEW REGION_DATA(Name, Manager, Countries, Customers)
AS
SELECT REGION.Name, STAFF.Name,
COUNT(DISTINCT(COUNTRY.Name)) AS Countries, COUNT(CUSTOMER.CustomerId) AS Customers
FROM STAFF
JOIN REGION ON (STAFF.StaffId = REGION.RegionManager)
JOIN COUNTRY USING (RegionId)
JOIN CUSTOMER ON (COUNTRY.Name = CUSTOMER.Country)
GROUP BY REGION.Name, STAFF.Name
ORDER BY REGION.Name
;
