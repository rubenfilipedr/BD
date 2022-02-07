DROP FUNCTION IF EXISTS bonus;
DELIMITER $

CREATE FUNCTION bonus(staff_id INT, year INT)
RETURNS INT
BEGIN
  DECLARE value INT;
  DECLARE n INT;
  DECLARE s INT;
  DECLARE r INT;

  SELECT COUNT(StreamId) INTO n
  FROM STREAM
  WHERE MONTH(StreamDate) = 12 AND YEAR(StreamDate) = year;

  SELECT COUNT(StaffId) INTO s
  FROM STAFF
  WHERE Supervisor = staff_id;

  SELECT COUNT(RegionId) INTO r
  FROM REGION
  WHERE RegionManager = staff_id;

  SET value = n * (s + r + 1);

  IF value < 300 THEN
    SET value = 300;
  END IF;
  IF value > 2000 THEN
    SET value = 2000;
  END IF;

  RETURN value;
END$

DELIMITER ;
